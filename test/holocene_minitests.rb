module HoloceneMinitests
  def interactive_debug_session(log_in_as = nil)
    return unless Capybara.current_driver == Capybara.javascript_driver
    return unless current_url
    login_as(log_in_as, scope: :user) if log_in_as.present?
    Launchy.open(current_url)
    binding.pry
  end

  def walk_menu(menu_master, exclude_tops, exclude_objects, debug: false)
    setup_page menu_master, debug: debug
    doc = Nokogiri::HTML(page.html)
    tops = doc.xpath("//*[@id='nav-bar']/nav/ul/li/a[contains(@class,'dropdown-toggle')]")
    @menu_items = { }
    tops.each do |master|
      next exclude_tops.include?(master)
      sub_actions = doc.xpath("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master.text}']/../ul/li/a")
      @menu_items[master.text] = sub_actions.collect{ |sa| "#{sa.text}" }
    end
    @menu_items.keys.each do |master|
      @menu_items[master].each do |object|
        next exclude_objects.include?(object)
        p "#{menu_master}: #{master}::#{object}" if debug
        menu_test master, object, debug: debug
      end
    end
  end

  def walk_sides(menu_master, debug: false)
    setup_page menu_master, debug: debug
    doc = Nokogiri::HTML(page.html)
    items = []
    trash_found = false

    tops = doc.xpath("//div[@id='side_controls']/a/i")
    tops.each do |object|
      items << object.classes.excluding(['fa-fw', 'fas', 'far'])[0].gsub(/fa-/,'')
    end
    items.each do |item|
      next if item == 'backward'
      p "Setup side #{item} for #{menu_master}" if debug
      visit root_url
      setup_page menu_master, debug: debug

      assert_side item, menu_master, item
      if item == 'trash'
        trash_found = true
        next 
      else
        click_side item
      end

      assert_current_path root_url
      assert_no_text "Content missing"

      p "Doing #{item} for #{menu_master}" if debug
      case item
      when 'expand'
        assert_side 'minus', menu_master, 'minus'
        click_side 'minus'
      when 'minus'
        assert_side 'expand', menu_master, 'expand'
        click_side 'expand'
      when 'sticky-note'
        do_cycle menu_master, 'Signets'
      when 'eye'
        if menu_master == 'Book'
          assert_text 'Copyright:'
        end
      when 'newspaper'
      when 'file-pdf'
      when 'calendar'
      when 'list'
      when 'map'
      when 'angle-right'
        assert_side 'angle-left', menu_master, 'angle-left'
        click_side 'angle-left'
      when 'angle-left'
        assert_side 'angle-right', menu_master, 'angle-right'
        click_side 'angle-right'
      when 'trash'
      when 'truck'
        assert_text 'Move'
      end
      assert_current_path root_url
      assert_no_text "Content missing"

      p "Ensure we can get back with #{item} for #{menu_master}" if debug
      unless ['Book','BookC'].include?(menu_master)
        assert_side 'backward', menu_master, item
        click_side 'backward'
      end
    end
    if trash_found
      accept_alert do
        click_side 'trash'
      end
      case menu_master
      when 'Key Points'
        assert_text 'Nabta Playa'
      end
    end
    p "Removing the trash for #{menu_master}" if debug
  end

  def menu_test(master, object, debug: false)
    p "#{master}: #{object}" if debug
    setup_page master, debug: debug
    p "Page setup for #{master}" if debug
    master = 'Book' if master == 'BookC'
    setup_page_menu master, object, debug: debug
    p "Page menu setup for #{master}: #{object}" if debug

    if ['Progress', 'Tags', 'History', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines',
        'Books', 'Character Categories'].include?(object) or
      (master == 'Welcome' and object == 'Stats') or (master == 'Support' and object == 'Holocene Events')
      assert_no_side 'backward', master, object, debug: debug
    else
      assert_side 'backward', master, object
    end
    p "Asserted side #{master}: #{object}" if debug
    unless ['Characters with Scenes', 'Character Grid', 'Progress', 'Tags', 'History', 'Stats',
        'Stories', 'All Stories', 'Time by Actor', 'Time by Location', 'Actor by Location', 'Publish All',
        'Resync Stories', 'Key Points', 'By Occupation', 'By Occupation, All', 'Resync Scenes', 'Main Characters',
        'Partition', 'Timeline', 'Scenes', 'Books', 'Import Chars',
        "#{@book.nil? ? 'Progress' : @book.name}", "#{@story.nil? ? 'Progress' : @story.name}", "#{@stage.nil? ? 'Progress' : @stage.name}", "#{@chapter.nil? ? 'Progress' : @chapter.name}", 
        'Move', 'Char List', 'Char List, All', 'Scene Characters', 'Stage List', 'New Chapter'].include?(object) or
      (master == 'Story' and object == 'Characters')

      p "Starting drive cycle #{master}: #{object}" if debug
      drive_cycle master, object, debug: debug
    end
    assert_current_path root_url
    assert_no_text "Content missing"
  end

  def verify_menus(menu_items)
    menu_items.keys.each do |master|
      master = 'Book' if master == 'BookC'
      assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']"), mgs: "'#{master}' menu top missing"
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

  def setup_page_menu(master, object, debug: false)
    p "Doing menu #{master}: #{object}" if debug
    do_menu master, object, debug: debug
    assert_current_path root_url
    assert_no_text "Content missing"

    assert_arrival master, object, debug: debug
    assert_current_path root_url
    assert_no_text "Content missing"
  end

  def setup_menu_page(master, object, debug: false)
    setup_page master, debug: debug
    assert_current_path root_url
    assert_no_text "Content missing"

    master = 'Book' if master == 'BookC'

    do_menu master, object, debug: debug
    assert_current_path root_url
    assert_no_text "Content missing"

    assert_arrival master, object, debug: debug
    assert_current_path root_url
    assert_no_text "Content missing"
  end

  def drive_cycle(master, object, debug: false)
    visit root_url
    setup_menu_page master, object, debug: debug
    assert_current_path root_url
    assert_no_text "Content missing"
    master = 'Book' if master == 'BookC'
    p "Setup page for #{master}:#{object}" if debug
    do_cycle master, object, debug: debug
  end

  def do_cycle(master, object, debug: false)
    assert_new 'plus', master, object
    click_new 'plus'
    assert_no_text "Content missing"
    assert_current_path root_url

    case object
    when 'Key Words'
      assert_text 'stormy'
    when 'Authors'
      assert_text "First name"
    when 'Cities'
      has_css? 'input[name="city[name]"]'
    when 'Holocene Events'
      has_css? 'input[name="holocene_event[name]"]'
    when 'Footnotes', 'Citations'
      assert_text "Slug"
    when 'New Book', 'New Story', 'Key Points', "#{@chapter.nil? ? (@story.nil? ? '' : @story.name) : @chapter.name}"
      assert_text 'Title'
    when 'Signets'
      assert_text 'Message'
    else
      assert_text "Name"
    end

    case object
    when 'Footnotes', 'Citations'
      fill_in "Slug", with: "TestSlug"
    when 'Key Words'
      fill_in "Key word", with: "dark"
    when 'Cities'
      fill_in "city[name]", with: "Strangeness in Space"
      fill_in "city[lat]", with: "410.3246"
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
    when 'Signets'
      fill_in "Message", with: "Strangeness in Space"
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
    assert_no_text "Content missing"
    assert_current_path root_url
    p "Created #{object} on #{master}" if debug

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully created"
    when 'Citations'
      assert_text "Footnote was successfully created"
    else
      assert_text "#{object.singularize} was successfully created"
    end

    case object
    when 'Authors'
      assert_link "Snoopy"
      assert_text "Brown"
      click_on "Snoopy"
    when 'Footnotes', 'Citations'
      assert_link 'TestSlug'
      click_on 'TestSlug'
    when 'Sections'
      assert_text "Strangeness in Space"
      click_on "Strangeness in Space"
    when 'Key Words'
      assert_text "dark"
      within "turbo-frame##{dom_id KeyWord.last}" do
        click_on "dark"
      end
    else
      assert_text "Strangeness in Space"
      click_on "Strangeness in Space"
    end
    assert_no_text "Content missing"
    assert_current_path root_url

    case object
    when 'Key Words'
      #assert_link "dark"
      #find("div > turbo-frame##{dom_id KeyWord.last} > div > a", match: :first).click
      assert_text "Key word:"
      assert_no_text 'stormy'
    when 'Footnotes', 'Citations'
      assert_text 'Slug:'
    when 'Authors'
      assert_text 'Biblioentries'
    when 'Signets'
      assert_text 'Message'
    else
      assert_text "Strangeness in Space"
    end

    p "Showing #{object} on #{master}" if debug
    unless ['Signets'].include?(object)
      assert_side 'edit', master, object
      click_side 'edit'
      assert_current_path root_url
      assert_no_text "Content missing"
    end

    case object
    when 'Cities'
      assert_text "Simple map"
      fill_in "city[name]", with: "Seemingly Case"
    when 'Authors'
      assert_text "First name"
      fill_in "First name", with: "Charlie"
    when 'Footnotes', 'Citations'
      assert_text "Slug"
      fill_in "Slug", with: "SlugTest"
    when 'Key Words'
      assert_text 'Key word'
      fill_in "Key word", with: "lighting"
    when 'Holocene Events'
      assert_text "End year"
      assert_text "Name"
      fill_in "Name", with: "Seemingly Case"
    when 'Signets'
      assert_text "Message"
      fill_in "Message", with: "Seemingly Case"
    else
      assert_text "Name"
      fill_in "Name", with: "Seemingly Case"
    end

    case object
    when 'Bibliography'
      click_on "Update Biblioentry"
    when 'Citations'
      click_on "Update Footnote"
    else
      click_on "Update #{object.downcase.capitalize.singularize}"
    end
    assert_no_text "Content missing"
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully updated"
    when 'Citations'
      assert_text "Footnote was successfully updated"
    else
      assert_text "#{object.singularize} was successfully updated"
    end

    p "Updated #{object} on #{master}" if debug
    case object
    when 'Authors'
      assert_text "Charlie"
    when 'Footnotes', 'Citations'
      assert_text "Slug"
    when 'Key Words'
      assert_text 'lighting'
    else
      assert_text "Seemingly Case"
    end

    unless ['Signets', 'Asides', 'Acts', 'Holocene Events', 'Key Words'].include?(object)
      assert_side 'backward', master, object
      click_side 'backward'
      assert_no_text "Content missing"
      assert_current_path root_url
    end

    p "Back at index of #{object} on #{master}" if debug
    case object
    when 'Authors'
      assert_link "Charlie"
      accept_alert do
        click_on_line "Charlie", "trash"
      end
    when 'Footnotes', 'Citations'
      assert_link 'SlugTest'
      accept_alert do
        click_on_line "SlugTest", "trash"
      end
    when 'Key Words'
      assert_link "lighting"
      accept_alert do
        click_on_line "lighting", "trash"
      end
    when 'Character Categories'
      assert_link "Gender"
      accept_alert do
        click_on_line "Seemingly Case", "trash"
      end
    else
      assert_link "Seemingly Case"
      accept_alert do
        click_on_line "Seemingly Case", "trash"
      end
    end
    assert_no_text "Content missing"
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully destroyed"
    when 'Citations'
      assert_text "Footnote was successfully destroyed"
    else
      assert_text "#{object.singularize} was successfully destroyed"
    end

    p "Deleted #{object} on #{master}" if debug
    unless ['Timelines', 'Regions', 'Cities', 'Holocene Events', 'Character Categories', 'Epochs', 'Event Types'].include?(object)
      assert_side 'backward', master, object
      click_side 'backward'
    end
    assert_no_text "Content missing"
    assert_current_path root_url
  end

  def setup_page(master, debug: false)
    p "Seting up #{master}" if debug
    visit root_url
    case master
    when 'Welcome'
    when /^BookC$/
      assert_text 'Fun Events in History'
      click_on 'Fun Events in History'
      assert_link 'Cultural Events'
    when 'Chapter'
      assert_text 'Fun Events in History'
      click_on 'Fun Events in History'
      assert_link 'Chapter Two Stuff'
      click_on 'Chapter Two Stuff'
      assert_text 'Asides'
    when 'Story', /^Characters$/
      assert_text 'The Phantom'
      click_on 'The Phantom'
      assert_link 'The Beginnings'
      click_on 'The Beginnings'
      assert_text 'Climate Change'
    when 'Key Points'
      assert_text 'The Phantom'
      click_on 'The Phantom'
      assert_link 'The Beginnings'
      click_on 'The Beginnings'
      assert_link 'Climate Change'
      click_on 'Climate Change'
      assert_no_text 'Sleepy village'
    when 'Scene'
      assert_text 'The Phantom'
      click_on 'The Phantom'
      assert_link 'The Beginnings'
      click_on 'The Beginnings'
      assert_link 'A00011'
      click_on 'A00011'
      assert_text 'Insert Scene'
    when /^Book$/, "Support"
      assert_text 'The Phantom'
      click_on 'The Phantom'
      assert_text 'The Beginnings'
    when 'Stage'
      assert_text 'The Phantom'
      click_on 'The Phantom'
      assert_text 'The Beginnings'
      do_menu "Stage", "Acts"
      assert_link "Waiting for Godot"
      click_on "Waiting for Godot"
      assert_link "Orphan Andy"
      click_on "Orphan Andy"
      assert_text "Leaving Childhood"
    end
    assert_no_text "Content missing"
    assert_current_path root_url
    p "Page set up #{master}" if debug
  end

  def assert_arrival(master, object, debug: false)
    p "Confirming arrival at #{object} on #{master}" if debug
    case object
    when 'Publish All'
      assert_text "All Stories marked publish"
    when 'Resync Stories'
      assert_text "Stories were successfully resynced"
    when 'Resync Scenes'
      assert_text "Story was successfully resynced"
    when 'Scenes'
      if master == 'Stage'
        assert_text "Scenes with Segments"
      else
        assert_text 'No Section'
      end
    when 'History'
      assert_selector "div#chart-1"
    when 'Acts'
      assert_text "Stages"
    when 'Locations'
      assert_text 'Location Times'
    when 'Progress'
      assert_text "Monthly"
    when 'Bibliography'
      assert_text "Bibliography"
    when 'Character Grid'
      assert_text 'Last Name LIKE'
    when 'Characters with Scenes'
      assert_text 'Characters with Scene Count'
    when 'Stage'
      assert_text "Leaving Childhood"
    when 'Stage List'
      assert_text "Stage with Segment Information"
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
    when 'Partition'
      assert_selector "#partition_name"
    else
      assert_xpath "//h3[contains(text(),'#{object}')]"

      #raise Minitest::Assertion,"Catching menu for #{object}. Arrival not set up."
    end
    p "Confirmed arrival at #{object} on #{master}" if debug
  end
end
