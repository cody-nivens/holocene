require "application_system_test_case"

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:story_14)
    @book = @story.book

    @story_2 = stories(:story_3)
    @story_4 = stories(:story_15)
    @user = users(:users_1)
    sign_in @user
  end

  test "sort stories" do
    skip("Works in production")

    visit books_url
    assert_text "The Scorpion King"
    click_on "The Scorpion King"
    assert_text "The Beginnings 2"

    assert_match %r[#{@story.name}.*#{@story_2.name}.*#{@story_4.name}]m, page.html

    draggable = find(:css, "#story-#{@story_4.id}")
    droppable = find(:css, "#story-#{@story_2.id}")
    draggable.drag_to(droppable)
    #page.execute_script %Q{
    #  $('#story-#{@story_4.id}').simulateDragSortable({move: -1});
    #}
    wait_for_ajax
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match %r[#{@story.name}.*#{@story_4.name}.*#{@story_2.name}]m, page.html
    visit current_path
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
