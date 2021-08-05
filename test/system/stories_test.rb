require "application_system_test_case"

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:story_1)
    @book = @story.book
    @user = users(:users_1)
    sign_in @user
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
