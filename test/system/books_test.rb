require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    DownloadHelpers::clear_downloads
    @book = books(:book_1)
    @book_2 = books(:book_2)
    @book_3 = books(:book_3)
    @user = users(:users_1)
    sign_in @user
  end

  test "sort books" do
    visit books_url
    assert_text "The Phantom"

    #save_and_open_page
    #debugger
    #take_screenshot
    assert_match %r[#{@book.name}.*#{@book_2.name}.*#{@book_3.name}]m, page.html

    draggable = find(:css, "#book-#{@book_3.id}")
    droppable = find(:css, "#book-#{@book_2.id}")
    draggable.drag_to(droppable)

    assert_match %r[#{@book.name}.*#{@book_3.name}.*#{@book_2.name}]m, page.html
  end


  test "creating a nonfictional Book flow" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: "Test 1"
    #fill_in_rich_text_area "book_body", with: "Test 1"
    click_on "Create Book"
    assert_text "Book was successfully created"
    assert_text "Test 1"

    assert_text "New Chapter"
    click_on "New Chapter"
    assert_text "Show events"

    fill_in "Name", with: "Chapter 1"
    fill_in_rich_text_area "chapter_body", with: "[[test99]]"
    click_on "Create Chapter"

    assert_text "Chapter was successfully created"
    assert_text "Chapter 1"

    assert_link "Missing footnote"
    click_on "Missing footnote"

    assert_text "New Footnote"
    fill_in_rich_text_area "footnote_body", with: "Now is the time for men to come to the aid of Man"
    click_on "Create Footnote"

    assert_text "Footnote was successfully created"

    click_on "Back"
  end

  test "creating a fictional Book flow" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: "Test 1"
    fill_in_rich_text_area "book_body", with: "Test 1"
    find(:css, "#book_fiction").set(true)
    click_on "Create Book"

    assert_text "Book was successfully created"
    assert_text "Test 1"

    click_on "All Stories"
    assert_text "New Story"
    click_on "New Story"

    fill_in "Summary", with: "Chasing Gadout"
    fill_in "Title", with: "The Impossible Dream"
    click_on "Create Story"
    assert_text "Story was successfully created"

    assert_text "New Key Point"
    click_on "New Key Point"

    fill_in "Hook", with: "Good points"
    fill_in "Inciting incident", with: "Trying times"
    fill_in "Key element", with: "Life"
    fill_in "First plot point", with: "Snoopy chases the Red Baron"
    click_on "Create Key point"
    assert_text "Key point was successfully created"

    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click
    assert_text "New Scene"
    click_on "New Scene"

    assert_text "Abc"

    fill_in "Abc", with: "G00001"
    fill_in "Scene sequel", with: 0
    fill_in "Time", with: 103

    #fill_in_rich_text_area "scene_summary", with: "Test 2"
    #assert_text "Test 2"
    #take_screenshot

    click_on "Create Scene"

    assert_text "Scene was successfully created"
    #assert_text "Test 2"

    click_on "Back"
  end

  test "should not create a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: ""
    click_on "Create Book"

    assert_text "can't be blank"

    fill_in "Name", with: @book.name
    click_on "Create Book"
    assert_text "Book was successfully created"
    click_on "Back"
  end
end
