require "application_system_test_case"

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:story_1)
    @book = @story.book
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Story index" do
    visit book_stories_url(:book_id => @book.id)
    assert_text "The Beginnings"
    row = row_containing_cell_with_text("The Beginnings")
    within row do
      click_on "Show"
    end
    assert_text "MyText"
  end

  test "visiting the Story timeline" do
    visit book_stories_url(:book_id => @book.id)
    assert_text "The Endings"
    click_on "The Endings"
    assert_text "Scenes"
    find(:xpath, "//a[text()='Scenes']").click
    assert_text "Timeline"
    click_on "Timeline"
  end

  test "visiting the Story scenes" do
    visit book_stories_url(:book_id => @book.id)
    assert_text "The Beginnings"
    assert_text "Scenes"
    click_on "Scenes"
    assert_text "Order"
  end

  test "resync the Story scenes" do
    visit book_stories_url(:book_id => @book.id)
    assert_text "The Beginnings"
    row = row_containing_cell_with_text("The Beginnings")
    within row do
      click_on "Show"
    end
    assert_text "Resync Scenes"
    click_on "Resync Scenes"
    assert_text "The Beginnings"
  end

  test "creating a Story" do
    visit book_stories_url(:book_id => @book.id)
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

  test "updating a Story" do
    visit book_stories_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "Summary", with: @story.summary
    fill_in "Title", with: @story.title
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
