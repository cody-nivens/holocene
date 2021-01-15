require "application_system_test_case"

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:story_1)
    @book = @story.book
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit book_stories_url(:book_id => @book.id)
    assert_selector "h1", text: "Stories"
  end

  test "creating a Story" do
    visit book_stories_url(:book_id => @book.id)
    click_on "New Story"

    fill_in "Summary", with: @story.summary
    fill_in "Title", with: @story.title
    find('#story_character_ids').find(:xpath, 'option[2]').select_option
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

  test "updating a Story" do
    visit book_stories_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "Summary", with: @story.summary
    fill_in "Title", with: @story.title
    find('#story_character_ids').find(:xpath, 'option[2]').select_option
    click_on "Update Story"

    assert_text "Story was successfully updated"
    click_on "Back"
  end

  test "not updating a Story" do
    visit book_stories_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "Summary", with: @story.summary
    fill_in "Title", with: ""
    click_on "Update Story"

    assert_text "Title can't be blank"
    click_on "Back"
  end

  test "destroying a Story" do
    visit book_stories_url(:book_id => @book.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Story was successfully destroyed"
  end
end
