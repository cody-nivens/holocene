module HoloceneMinitests
  def interactive_debug_session(log_in_as = nil)
    return unless Capybara.current_driver == Capybara.javascript_driver
    return unless current_url
    login_as(log_in_as, scope: :user) if log_in_as.present?
    Launchy.open(current_url)
    binding.pry
  end

  def setup_menus
    @chapter = chapters(:chapter_1)
    @book_non = @chapter.scripted
    @story = stories(:story_1)
    @book_fic = @story.book
    @stage = stages(:stage_1)

    @menu_items_welcome = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ 'New Book', 'Books' ],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines' ]
    }

    @menu_items_book_fic = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_fic.name}", 'New Book', 'Books', 'Stats', 'Scenes', 'Resync Stories', 'Publish All', 'Key Points', 'Plot Points', 'Glossary Terms', 'Timeline' ],
      'Story' => [ 'New Story', 'All Stories', 'Stories' ],
      'Characters' => [ 'Character Grid', 'Main Characters', 'Characters with Scenes', 'By Occupation', 'By Occupation, All', 'Import Chars'],
      'Stage' => [ 'Acts', 'Actors', 'Locations'],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines', 'Key Words', 'Authors', 'Artifacts', 'Artifact Types', 'Character Categories' ]
    }
    @menu_items_book_non = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_non.name}", 'New Book', 'Books', 'Stats', 'Bibliography', 'Glossary Terms', 'Timeline' ],
      'Chapter' => [ 'New Chapter' ],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines'  ]
    }

    @menu_items_chapter = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_non.name}", 'New Book', 'Books', 'Stats', 'Bibliography', 'Glossary Terms', 'Timeline'],
      'Chapter' => [ 'New Chapter', "#{@chapter.name}", "Partition", "Aside", "Footnotes", "Citations", 'Timeline' ],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines' ]
    }

    @menu_items_chapter_full = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_non.name}", 'New Book', 'Books', 'Stats', 'Bibliography', 'Glossary Terms'],
      'Chapter' => [ 'New Chapter' ],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines' ]
    }

    @menu_items_story = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_fic.name}", 'New Book', 'Books', 'Stats', 'Scenes', 'Resync Stories', 'Publish All', 'Key Points', 'Plot Points', 'Glossary Terms', 'Timeline' ],
      'Story' => [ 'New Story', "#{@story.name}", 'Characters', 'Move', 'All Stories', 'Stories', 'Key Points', 'Char List', 'Char List, All', 'Stats', 'Scenes', 'Resync Scenes', 'Timeline', 'Tours'],
      'Characters' => [ 'Character Grid', 'Main Characters', 'Characters with Scenes', 'By Occupation', 'By Occupation, All', 'Import Chars'],
      'Stage' => [ 'Acts', 'Actors', 'Locations'],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines', 'Key Words', 'Authors', 'Artifacts', 'Artifact Types', 'Character Categories']
    }
    @menu_items_stage = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_fic.name}", 'New Book', 'Books', 'Stats', 'Scenes', 'Resync Stories', 'Publish All', 'Key Points', 'Plot Points', 'Glossary Terms', 'Timeline'],
      'Story' => [ 'New Story', 'All Stories', 'Stories'],
      'Characters' => [ 'Character Grid', 'Main Characters', 'Characters with Scenes', 'By Occupation', 'By Occupation, All', 'Import Chars'],
      'Stage' => [ "#{@stage.name}", 'Stage List', 'Scenes', 'Scene Characters', 'Time by Actor', 'Time by Location', 'Actor by Location', 'Acts', 'Actors', 'Locations' ],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines', 'Key Words', 'Authors', 'Artifacts', 'Artifact Types', 'Character Categories' ]
    }
    @menu_items_stage_full = {
      'Welcome' => %w[ Progress Tags Stats History ],
      'Book' => [ "#{@book_fic.name}", 'New Book', 'Books', 'Stats', 'Scenes', 'Resync Stories', 'Publish All', 'Key Points', 'Plot Points', 'Glossary Terms', 'Timeline'],
      'Story' => [ 'New Story', 'All Stories', 'Stories'],
      'Characters' => [ 'Character Grid', 'Main Characters', 'Characters with Scenes', 'By Occupation', 'By Occupation, All', 'Import Chars'],
      'Stage' => [ 'Acts', 'Actors', 'Locations'],
      'Support' => [ 'Holocene Events', 'Cities', 'Epochs', 'Event Types', 'Regions', 'Timelines', 'Key Words', 'Authors', 'Artifacts', 'Artifact Types', 'Character Categories' ]
    }
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

  def setup_menu_page(master, object)
    setup_page master

    master = 'Book' if master == 'BookC'

    do_menu master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5

    assert_arrival master, object
    assert_current_path root_url
    assert_no_text "Content missing", wait: 5
  end

  def drive_cycle(master, object)
    setup_menu_page master, object
    master = 'Book' if master == 'BookC'

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
    when 'Footnotes'
      assert_text "Slug", wait: 5
    else
      assert_text "Name", wait: 5
    end

    case object
    when 'Footnotes'
      fill_in "Slug", with: "TestSlug"
    when 'Key Words'
      fill_in "Key word", with: "Strangeness in Space"
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
    else
      click_on "Create #{object.downcase.capitalize.singularize}"
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully created", wait: 5
    else
      assert_text "#{object.singularize} was successfully created", wait: 5
    end

    case object
    when 'Authors'
      assert_link "Snoopy", wait: 5
      assert_text "Brown", wait: 5
      click_on "Snoopy"
    when 'Footnotes'
      assert_link 'TestSlug', wait: 5
      click_on 'TestSlug'
    when 'Sections'
      assert_text "Strangeness in Space", wait: 5
      click_on "Strangeness in Space"
    else
      assert_text "Strangeness in Space", wait: 5
      click_on "Strangeness in Space"
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Key Words'
      assert_link "Strangeness in Space", wait: 5
      find("div > turbo-frame##{dom_id KeyWord.last} > div > a", match: :first).click
      assert_text "Key word:", wait: 5
      assert_no_text 'stormy', wait: 5
    when 'Footnotes'
      assert_text 'Slug:', wait: 5
    when 'Authors'
      assert_text 'Biblioentries'
    else
      assert_text "Strangeness in Space", wait: 5
    end


    assert_side 'edit'
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
    when 'Footnotes'
      assert_text "Slug", wait: 5
      fill_in "Slug", with: "SlugTest"
    else
      assert_text "Name", wait: 5
      fill_in "Name", with: "Seemingly Case"
    end

    case object
    when 'Bibliography'
      click_on "Update Biblioentry"
    else
      click_on "Update #{object.downcase.capitalize.singularize}"
    end
    assert_no_text "Content missing", wait: 5
    assert_current_path root_url

    case object
    when 'Bibliography'
      assert_text "Biblioentry was successfully updated", wait: 5
    else
      assert_text "#{object.singularize} was successfully updated", wait: 5
    end

    case object
    when 'Authors'
      assert_text "Charlie", wait: 5
    when 'Footnotes'
      assert_text "Slug", wait: 5
    else
      assert_text "Seemingly Case", wait: 5
    end

    click_side 'backward'
    assert_current_path root_url

    case object
    when 'Authors'
      assert_link "Charlie", wait: 5
      accept_alert do
        click_on_line "Charlie", "trash"
      end
    when 'Footnotes'
      assert_link 'SlugTest', wait: 5
      accept_alert do
        click_on_line "SlugTest", "trash"
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
    else
      assert_text "#{object.singularize} was successfully destroyed", wait: 5
    end


    unless ['Regions', 'Cities', 'Holocene Events', 'Character Categories', 'Epochs', 'Event Types'].include?(object)
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
      assert_link 'Cultural Events', wait: 5
      click_on 'Cultural Events'
      assert_text 'Flight of the Bubblebees', wait: 5
    when 'Story', /^Character$/
      assert_text 'The Phantom', wait: 5
      click_on 'The Phantom'
      assert_link 'The Beginnings', wait: 5
      click_on 'The Beginnings'
      assert_text 'Climate Change', wait: 5
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
    else
      assert_text "#{object}", wait: 5
    end
  end
end
