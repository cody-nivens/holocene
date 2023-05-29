# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    DownloadHelpers.clear_downloads
    @book = books(:book_1)
    @book_2 = books(:book_2)
    @book_3 = books(:book_3)
    @user = users(:users_1)
    sign_in @user
#    ThinkingSphinx::Test.init
#    ThinkingSphinx::Test.start index: false
#    index
  end

  teardown do
#    ThinkingSphinx::Test.stop
#    ThinkingSphinx::Test.clear
  end

  if 1 == 0
  test 'books show all stories' do
#    visit All Stories
    visit root_url
    # save_and_open_page
    # debugger
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'

    do_menu 'Story', 'All Stories'
    assert_text 'The Middles XX'
    click_side 'backward'
    assert_no_text 'The Middles XX'
  end

  test 'books edit' do
#    visit Show
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    click_side 'edit'
    assert_selector "form.edit_book"
    click_new 'backward'

    assert_new 'plus'
    click_side 'backward'
  end

  test 'books index' do
#    visit New Book
    visit root_url
    assert_link 'New Book'
    click_on 'New Book'

    assert_no_link 'New Book'
    assert_selector "turbo-frame#new_object"
    click_new 'backward'
    assert_link 'New Book'
  end

  test 'books show artifacts' do
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    do_menu 'Support', 'Artifacts'

    assert_text 'Owner/Controller'
    #interactive_debug_session(@user)
    click_on 'Back'
    assert_text @book_2.name
  end

  test 'books show authors' do
#    visit Authors
    visit root_url
    assert_text 'Fun Events in History'
    click_on 'Fun Events in History'
    assert_text "Surprise"

    do_menu 'Support', 'Authors'
    assert_text 'Erggy'
    click_on 'Back'
    assert_text 'No Dogs'
  end

  test 'books show characters' do
#    visit Characters
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    do_menu "Characters", "Character Grid"
    assert_text "Characters for Book"
    click_new 'plus'

    #click_on 'Back'
    #assert_text 'The Beginnings'
    #assert_current_path root_url
  end

  test 'books show key points' do
#    visit Key Points
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'

    click_on 'The Beginnings'
    assert_text 'Climate Change'
    do_menu "Book", "Key Points"
    click_on 'Back'
    assert_link 'New Story'
  end

  test 'books show new chapter' do
#    visit New Chapter
    visit root_url
    assert_text 'Fun Events in History'
    click_on 'Fun Events in History'
    assert_text "Surprise"

    assert_link 'New Chapter'
    click_on 'New Chapter'
    assert_text 'Always display events'
    assert_current_path root_url
    click_new 'backward'
    assert_text 'No Dogs'
    assert_current_path root_url
  end

  test 'books show new story' do
#    visit New Story
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'

    assert_link 'New Story'
    click_on 'New Story'
    assert_text 'Publish?'
    assert_current_path root_url
    click_new 'backward'
    assert_text 'The Beginnings'
    assert_current_path root_url
  end

  test 'books show scenes' do
#    visit Scenes
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    do_menu 'Book', 'Scenes'

    assert_text 'No Section'
    assert_current_path root_url
  end

  test 'books show xstats' do
#    visit Stats
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    do_menu 'Book', 'Stats'

    assert_text 'Stats for Book'
    assert_current_path root_url
  end

  test 'books toc' do
#    visit Chapters, Details
    visit root_url
    assert_text 'Fun Events in History'
    click_on 'Fun Events in History'
    assert_text "Surprise"

    click_side 'expand'
    assert_text 'Flight of the Bubblebees'
    click_side 'minus'
    assert_no_text 'Flight of the Bumblebees'

    assert_link 'New Chapter'
    assert_current_path root_url
    visit root_url

    assert_text 'The Phantom'
    click_on 'The Phantom'
    click_side 'expand'
    assert_text 'Publishable'
    click_side 'minus'
    assert_no_text 'Publishable'
  end

  test 'books show key words' do
#    visit Key Words
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    do_menu 'Support', 'Key words'
    assert_text 'stormy'
    assert_current_path root_url
    click_on 'Back'
    assert_link 'New Story'
    assert_current_path root_url
  end

if 1 == 0
  test 'sort books' do
    visit root_url
    assert_text 'The Phantom'

    # save_and_open_page
    # debugger
    # take_screenshot
    assert_match /#{@book.name}.*#{@book_2.name}.*#{@book_3.name}/m, page.html

    draggable = find(:css, "#book-#{@book_3.id}")
    droppable = find(:css, "#book-#{@book_2.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match /#{@book.name}.*#{@book_3.name}.*#{@book_2.name}/m, page.html
    visit current_path

    assert_match /#{@book.name}.*#{@book_3.name}.*#{@book_2.name}/m, page.html
  end
end

  test 'creating a nonfictional Book flow' do
    visit root_url

    # Create book
    #
    click_on 'New Book'

    fill_in 'Name', with: 'Test 1'
    click_on 'Create Book'
    assert_text 'Book was successfully created'
    assert_link 'Test 1'
    click_link 'Test 1'

    assert_text 'Partition'

    # Create chapter
    #
    click_new 'plus'

    assert_text 'Show events'

    fill_in 'Name', with: 'Chapter 1'
    fill_in_rich_text_area 'chapter_body', with: '[[test99]]'
    click_on 'Create Chapter'

    assert_text 'Chapter was successfully created'

    assert_link "Chapter 1"
    click_on "Chapter 1"
    assert_link 'Missing footnote'

    # Fix footnote
    #
    click_on 'Missing footnote'

    assert_text 'Slug'
    fill_in_rich_text_area 'footnote_body', with: 'Now is the time for men to come to the aid of Man'
    click_on 'Create Footnote'

    assert_text 'Footnote was successfully created'

    assert_link "Now is the time"
    click_on "Now is the time"

    click_side 'edit'

    click_on 'Back'
    assert_text 'Text'

    # Add a section
    #
    click_new 'plus'

    fill_in 'Name', with: 'Test 1'
    fill_in_rich_text_area 'section_body', with: 'Deeply the stormy mists'
    click_on 'Create Section'

    assert_text 'Section was successfully created'
    
    assert_text 'Deeply the stormy mists'

    within(:xpath, "//turbo-frame[@id='#{dom_id Section.last}']") do
        Capybara.page.find(".fa-edit").click
    end
 
    assert_text 'Text'
    click_on 'Update Section'

    assert_no_text 'Text'
    assert_text 'Deeply the stormy mists'
  end

  test 'looking at a scene' do
    visit root_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"

    click_side 'newspaper'

    assert_text "A00001"
    click_on "A00001"

    assert_text "a dark and stormy night"

    Capybara.page.find('.fa-backward').click
    assert_current_path root_url
  end

  test 'creating a fictional Book flow' do
    visit root_url
    click_new 'plus'

    fill_in 'Name', with: 'Test 1'
    fill_in_rich_text_area 'book_body', with: 'Test 1'
    find(:css, '#book_fiction').set(true)
    click_on 'Create Book'

    assert_text 'Book was successfully created'
    assert_text 'Test 1'
    click_on "Test 1"

    assert_text "Stories"

    click_new 'plus'

    fill_in_rich_text_area 'story_summary_body', with: 'Chasing Gadout'
    fill_in 'Title', with: 'The Impossible Dream'
    click_on 'Create Story'
    assert_text 'Story was successfully created'

    assert_text 'The Impossible Dream'
    click_on "The Impossible Dream"

    assert_text "Key Points"
    click_new 'plus'

    fill_in 'Hook', with: 'Good points'
    fill_in 'Inciting incident', with: 'Trying times'
    fill_in 'Key element', with: 'Life'
    fill_in 'First plot point', with: 'Snoopy chases the Red Baron'
    click_on 'Create Key point'
    assert_text 'Key Point was successfully created'

    assert_text "Good points"
    click_on "Good points"

    within "#objects" do
      Capybara.page.find('.fa-plus', match: :first).click
    end

    assert_text 'Select Scene'
    assert_selector "a > i.fa-plus"
    assert_selector "turbo-frame", id:  "new_object"

    click_new 'plus'

    assert_text 'Abc'
     take_screenshot

    fill_in 'Abc', with: 'G00001'
    fill_in 'Scene sequel', with: 0
    fill_in 'Time', with: 103

    # fill_in_rich_text_area "scene_summary", with: "Test 2"
    # assert_text "Test 2"
     take_screenshot

    click_on 'Create Scene'

    assert_text 'Scene was successfully created'
    assert_text "First Pinch Point"

    take_screenshot
    click_on 'Back'

    assert_text "Summary"
    take_screenshot
  end
end

  tasks = {
    'Welcome' => %w[ progress tags stats history ],
    'Book' => %w[ books stats scenes key_point resync_stories publish_all plot_point ],
    'Stage' => %w[ act actor location ],
    'Support' => %w[ epoch artifact event_type region author artifact_type character_category ]
  }
  otasks = {
            'Support' => %w[ ]
  }

  tasks.keys.each do |master|
    tasks[master].each do |object|
      test "visiting the #{master}:#{object} menu" do
        title = object.gsub(/_/,' ').camelize
        visit root_url
        assert_text 'The Phantom'
        click_on 'The Phantom'
        assert_link 'The Beginnings'
        click_on 'The Beginnings'

        assert_text 'Summary'

        do_menu master, "#{title.titleize.pluralize}"

        assert_text "#{title.titleize.pluralize}"

        assert_current_path root_url
      end
    end
  end

  if 1 == 0
  test 'should not create a Book' do
    visit root_url
    click_on 'New Book'

    fill_in 'Name', with: ''
    click_on 'Create Book'

    assert_text "can't be blank"

    fill_in 'Name', with: @book.name
    click_on 'Create Book'
    assert_text 'Book was successfully created'
    click_on 'Back'
  end
end
end
