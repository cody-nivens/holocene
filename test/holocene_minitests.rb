module HoloceneMinitests
  def interactive_debug_session(log_in_as = nil)
    return unless Capybara.current_driver == Capybara.javascript_driver
    return unless current_url
    login_as(log_in_as, scope: :user) if log_in_as.present?
    Launchy.open(current_url)
    binding.pry
  end

  def walk_menu(menu_master, debug: false)
    visit root_url
    assert_text "The Phantom", wait: 5
    setup_page menu_master
    doc = Nokogiri::HTML(page.html)
    tops = doc.xpath("//*[@id='nav-bar']/nav/ul/li/a[contains(@class,'dropdown-toggle')]")
    @menu_items = { }
    tops.each do |master|
      sub_actions = doc.xpath("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master.text}']/../ul/li/a")
      @menu_items[master.text] = sub_actions.collect{ |sa| "#{sa.text}" }
    end
    @menu_items.keys.each do |master|
      @menu_items[master].each do |object|
        p "#{menu_master}: #{object}" if debug
        visit root_url
        assert_text "The Phantom", wait: 5
        setup_page menu_master
        setup_page_menu master, object
        menu_test master, object
      end
    end
  end

  def walk_sides(menu_master, debug: false)
    visit root_url
    setup_page menu_master
    doc = Nokogiri::HTML(page.html)
    items = []
    tops = doc.xpath("//div[@id='side_controls']/a/i")
    tops.each do |object|
      items << object.classes.excluding(['fa-fw', 'fas', 'far'])[0].gsub(/fa-/,'')
    end
    items.each do |item|
      p "#{menu_master}: #{item}" if debug
      visit root_url
      setup_page menu_master
      click_side item
      assert_current_path root_url
      assert_no_text "Content missing", wait: 5
     if item == 'expand'
        assert_side 'minus', menu_master, 'minus'
        click_side 'minus'
     elsif item == 'minus'
        assert_side 'expand', menu_master, 'expand'
        click_side 'expand'
     elsif item == 'backward' and ['Book','BookC'].include?(menu_master)
     else
        assert_side 'backward', menu_master, item
        click_side 'backward'
      end
    end
  end

  def menu_test(master, object, debug: false)
    puts "#{master}: #{object}" if debug

    unless ['Progress', 'Tags', 'History', 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines',
        'New Book', 'Books', 'Publish All', 'Resync Stories', 'Character Grid', 'Character Categories'].include?(object) or
      (master == 'Welcome' and object == 'Stats')
      assert_side 'backward', master, object
    end
    unless ['New Book', 'New Story', 'Characters with Scenes', 'Character Grid', 'Progress', 'Tags', 'History', 'Stats',
        'Stories', 'All Stories', 'Time by Actor', 'Time by Location', 'Actor by Location', 'Publish All',
        'Resync Stories', 'Key Points', 'By Occupation', 'By Occupation, All', 'Resync Scenes', 'Main Characters',
        'Partition', 'Timeline', 'Scenes', 'Books', 'Import Chars',
        "#{@book.nil? ? 'Progress' : @book.name}", "#{@story.nil? ? 'Progress' : @story.name}", "#{@stage.nil? ? 'Progress' : @stage.name}", "#{@chapter.nil? ? 'Progress' : @chapter.name}", 
        'Move', 'Char List', 'Char List, All', 'Scene Characters', 'Stage List', 'New Chapter'].include?(object) or
        (master == 'Story' and object == 'Characters')

      drive_cycle master, object
    end
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5
  end

  def verify_menus(menu_items)
    menu_items.keys.each do |master|
      master = 'Book' if master == 'BookC'
      assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']"), wait: 5, mgs: "'#{master}' menu top missing"
      find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']").click

      assert_text menu_items[master][1]
      link_count = find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul").all('li > a').count
      item_count = find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul").all('li').count
      hr_count = find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul").all('li > hr').count
      assert_equal link_count, item_count - hr_count, "Number of menu items differ for '#{master}'"
      assert_equal menu_items[master].count, item_count - hr_count, "Number of test items differ for '#{master}'"
      menu_items[master].each do |object|
        #debugger unless has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul/li/a[text()='#{object}']")
        assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul/li/a[text()='#{object}']"), "'#{master}/#{object}' menu item missing"
      end
    end
  end

  def setup_page_menu(master, object)
    do_menu master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5

    assert_arrival master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5
  end

  def setup_menu_page(master, object)
    setup_page master
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5

    master = 'Book' if master == 'BookC'

    do_menu master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5

    assert_arrival master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5
  end

  def drive_cycle(master, object)
    visit root_url
    setup_menu_page master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5
    master = 'Book' if master == 'BookC'

    assert_new 'plus', master, object
    click_new 'plus'
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Key Words'
      assert_text 'stormy', wait: 5
    when 'Authors'
      assert_text "First name", wait: 5
    when 'Cities'
      has_css? 'input[name="city[name]"]', wait: 5
    when 'Holocene Events'
      has_css? 'input[name="holocene_event[name]"]', wait: 5
    when 'Footnotes', 'Citations'
      assert_text "Slug", wait: 5
    when 'New Book', 'New Story', 'Key Points', "#{@chapter.nil? ? (@story.nil? ? '' : @story.name) : @chapter.name}"
      assert_text 'Title'
    else
      assert_text "Name", wait: 5
    end

    case object
    when 'Footnotes', 'Citations'
      fill_in "Slug", with: "TestSlug"
    when 'Key Words'
      fill_in "Key word", with: "dark"
    when 'Cities'
      fill_in "city[name]", with: "Strangeness in Space"
      fill_in "city[lat]", with: "45.3246"
      fill_in "city[lng]", with: "118.0877"
    when 'Epochs'
      fill_in "Name", with: "Strangeness in Space"
      fill_in 'End date', with: '2000'
      fill_in 'Start date', with: '1900'
    when 'Artifacts'
      fill_in "Name", with: "Strangeness in Space"
      select 'John', from: 'artifact_character_id'
      select 'Ship', from: 'artifact_artifact_type_id'
    when 'Authors'
      fill_in "First name", with: "Snoopy"
      fill_in "Last name", with: "Brown"
    when 'Holocene Events'
      fill_in "Name", with: "Strangeness in Space"
      fill_in "Start year", with: "-300"
    else
      fill_in "Name", with: "Strangeness in Space"
    end

    case object
    when 'Bibliography'
      click_on "Create Biblioentry"
    when 'Citations'
      click_on 'Create Footnote'
    else
      click_on "Create #{object.downcase.capitalize.singularize}"
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully created", wait: 5
    when 'Citations'
      assert_text "Footnote was successfully created", wait: 5
    else
      assert_text "#{object.singularize} was successfully created", wait: 5
    end

    case object
    when 'Authors'
      assert_link "Snoopy", wait: 5
      assert_text "Brown", wait: 5
      click_on "Snoopy"
    when 'Footnotes', 'Citations'
      assert_link 'TestSlug', wait: 5
      click_on 'TestSlug'
    when 'Sections'
      assert_text "Strangeness in Space", wait: 5
      click_on "Strangeness in Space"
    when 'Key Words'
      assert_text "dark", wait: 5
      within "turbo-frame##{dom_id KeyWord.last}" do
        click_on "dark"
      end
    else
      assert_text "Strangeness in Space", wait: 5
      click_on "Strangeness in Space"
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Key Words'
      #assert_link "dark", wait: 5
      #find("div > turbo-frame##{dom_id KeyWord.last} > div > a", match: :first).click
      assert_text "Key word:", wait: 5
      assert_no_text 'stormy', wait: 5
    when 'Footnotes', 'Citations'
      assert_text 'Slug:', wait: 5
    when 'Authors'
      assert_text 'Biblioentries'
    else
      assert_text "Strangeness in Space", wait: 5
    end


    assert_side 'edit', master, object
    click_side 'edit'
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5

    case object
    when 'Cities'
      assert_text "Simple map", wait: 5
      fill_in "city[name]", with: "Seemingly Case"
    when 'Authors'
      assert_text "First name", wait: 5
      fill_in "First name", with: "Charlie"
    when 'Footnotes', 'Citations'
      assert_text "Slug", wait: 5
      fill_in "Slug", with: "SlugTest"
    when 'Key Words'
      assert_text 'Key word'
      fill_in "Key word", with: "lighting"
    when 'Holocene Events'
      assert_text "End year", wait: 5
      assert_text "Name", wait: 5
      fill_in "Name", with: "Seemingly Case"
    else
      assert_text "Name", wait: 5
      fill_in "Name", with: "Seemingly Case"
    end

    case object
    when 'Bibliography'
      click_on "Update Biblioentry"
    when 'Citations'
      click_on "Update Footnote", wait: 5
    else
      click_on "Update #{object.downcase.capitalize.singularize}"
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully updated", wait: 5
    when 'Citations'
      assert_text "Footnote was successfully updated", wait: 5
    else
      assert_text "#{object.singularize} was successfully updated", wait: 5
    end

    case object
    when 'Authors'
      assert_text "Charlie", wait: 5
    when 'Footnotes', 'Citations'
      assert_text "Slug", wait: 5
    when 'Key Words'
      assert_text 'lighting', wait: 5
    else
      assert_text "Seemingly Case", wait: 5
    end

    unless ['Acts', 'Holocene Events', 'Key Words'].include?(object)
      assert_side 'backward', master, object
      click_side 'backward'
      assert_current_path root_url
    end

    case object
    when 'Authors'
      assert_link "Charlie", wait: 5
      accept_alert do
        click_on_line "Charlie", "trash"
      end
    when 'Footnotes', 'Citations'
      assert_link 'SlugTest', wait: 5
      accept_alert do
        click_on_line "SlugTest", "trash"
      end
    when 'Key Words'
      assert_link "lighting", wait: 5
      accept_alert do
        click_on_line "lighting", "trash"
      end
    else
      assert_link "Seemingly Case", wait: 5
      accept_alert do
        click_on_line "Seemingly Case", "trash"
      end
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully destroyed", wait: 5
    when 'Citations'
      assert_text "Footnote was successfully destroyed", wait: 5
    else
      assert_text "#{object.singularize} was successfully destroyed", wait: 5
    end

    unless ['Regions', 'Cities', 'Holocene Events', 'Character Categories', 'Epochs', 'Event Types'].include?(object)
      assert_side 'backward', master, object
      click_side 'backward'
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url
  end

  def setup_page(master)
    visit root_url
    case master
    when 'Welcome'
    when /^BookC$/
      assert_text 'Fun Events in History', wait: 5
      click_on 'Fun Events in History'
      assert_link 'Cultural Events', wait: 5
    when 'Chapter'
      assert_text 'Fun Events in History', wait: 5
      click_on 'Fun Events in History'
      assert_link 'Chapter Two Stuff', wait: 5
      click_on 'Chapter Two Stuff'
      assert_text 'Asides', wait: 5
    when 'Story', /^Characters$/
      assert_text 'The Phantom', wait: 5
      click_on 'The Phantom'
      assert_link 'The Beginnings', wait: 5
      click_on 'The Beginnings'
      assert_text 'Climate Change', wait: 5
    when 'Scene'
      assert_text 'The Phantom', wait: 5
      click_on 'The Phantom'
      assert_link 'The Beginnings', wait: 5
      click_on 'The Beginnings'
      assert_link 'A00011', wait: 5
      click_on 'A00011'
      assert_text 'Summary', wait: 5
    when /^Book$/, "Support"
      assert_text 'The Phantom', wait: 5
      click_on 'The Phantom'
      assert_text 'The Beginnings', wait: 5
    when 'Stage'
      assert_text 'The Phantom', wait: 5
      click_on 'The Phantom'
      assert_text 'The Beginnings', wait: 5
      do_menu "Stage", "Acts"
      assert_link "Waiting for Godot", wait: 5
      click_on "Waiting for Godot"
      assert_link "Orphan Andy", wait: 5
      click_on "Orphan Andy"
      assert_text "Leaving Childhood", wait: 5
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url
  end

  def assert_arrival(master, object)
    case object
    when 'Publish All'
      assert_text "All Stories marked publish", wait: 5
    when 'Resync Stories'
      assert_text "Stories were successfully resynced", wait: 5
    when 'Resync Scenes'
      assert_text "Story was successfully resynced", wait: 5
    when 'Scenes'
      if master == 'Stage'
        assert_text "Scenes with Segments", wait: 5
      else
        assert_text 'No Section', wait: 5
      end
    when 'History'
      assert_selector "div#chart-1", wait: 5
    when 'Acts'
      assert_text "Stages", wait: 5
    when 'Locations'
      assert_text 'Location Times', wait: 5
    when 'Progress'
      assert_text "Monthly", wait: 5
    when 'Bibliography'
      assert_text "Bibliography", wait: 5
    when 'Character Grid'
      assert_text 'Last Name LIKE', wait: 5
    when 'Characters with Scenes'
      assert_text 'Characters with Scene Count', wait: 5
    when 'Stage'
      assert_text "Leaving Childhood", wait: 5
    when 'Stage List'
      assert_text "Stage with Segment Information", wait: 5
    when 'Timeline'
      assert_text 'Timeline for'
    when 'New Book'
      assert_text 'Copyright'
    when 'New Story'
      assert_text 'Title page'
    when 'All Stories'
      assert_text 'The Middles XX'
    when 'New Chapter'
      assert_text 'Display title'
    when 'Citations'
      assert_text 'Slug'
    when 'Char List, All'
      assert_text 'Char List'
    when 'Import Chars'
      assert_text 'Import Characters for'
    when 'Key Words'
      assert_text 'Key Words'
    else
      assert_text "#{object}", wait: 5
    end
  end
end
