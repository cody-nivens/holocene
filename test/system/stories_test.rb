require "application_system_test_case"

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @story_2 = stories(:story_2)
    @story_4 = stories(:story_4)
    @user = users(:users_1)
    sign_in @user
  end

  test "sort stories" do
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"

    #Timeout.timeout(Capybara.default_max_wait_time) do
    #  sleep(0.1) until page.evaluate_script('jQuery.active') == 0 && page.has_css?('.ui-sortable')
    #end

    #wait_for_dom
    #save_and_open_page
    #take_screenshot
    assert_match %r[#{@story.name}.*#{@story_2.name}.*#{@story_4.name}]m, page.html

    draggable = find(:css, "#story-#{@story_4.id}")
    droppable = find(:css, "#story-#{@story_2.id}")
    draggable.drag_to(droppable)

    assert_match %r[#{@story.name}.*#{@story_4.name}.*#{@story_2.name}]m, page.html
  end

  test "creating a Story" do
    visit book_url(:id => @book.id)
    click_on "New Story"

    fill_in "Summary", with: @story.summary
    fill_in "Title", with: @story.title
    click_on "Create Story"

    assert_text "Story was successfully created"
    click_on "Back"
  end

  test "not creating a Story" do
    visit book_stories_url(:book_id => @book.id)
    click_on "New Story"

    fill_in "Summary", with: @story.summary
    fill_in "Title", with: ""
    click_on "Create Story"

    assert_text "Title can't be blank"
    click_on "Back"
  end
end
