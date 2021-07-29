require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    DownloadHelpers::clear_downloads
    @book = books(:book_1)
    @book_2 = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Books index" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_link "New Book"
    assert_no_text "link_to"
  end

  test "visiting the Book 'The Phantom'" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_link "The Phantom"
    click_on "The Phantom"
  end

  test "visiting the Book 'The Phantom' Resync Stories" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_link "The Phantom"
    click_on "The Phantom"
    assert_link "All Stories"
    click_on "All Stories"
    assert_link "Resync Stories"
    click_on "Resync Stories"
    assert_text "Stories were successfully resynced"
  end

  test "visiting the Book 'The Phantom' Timeline" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_link "The Phantom"
    click_on "The Phantom"
    assert_link "All Stories"
    click_on "All Stories"
    assert_link "Timeline"
    click_on "Timeline"
  end

  test "visiting the Book 'The Phantom' gender" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_link "The Phantom"
    click_on "The Phantom"
    click_on "Stats"
    row = row_containing_cell_with_text("Gay")
    within row do
      click_on "1"
    end
  end

  test "visiting the Book 'The Phantom' hair color" do
    visit books_url
    assert_selector "h1", text: "Books"
    assert_link "The Phantom"
    click_on "The Phantom"
    click_on "Stats"
    row = second_row_containing_cell_with_text("Brown")
    within row do
      click_on "1"
    end
  end

  test "visiting the TOC" do
    visit book_url(@book)

    click_on "Chapters, TOC"
    assert_text "New Chapter"
  end

  test "generating PDF" do
    visit book_url(@book, format: 'pdf')

    content = DownloadHelpers::download_content
    sleep(20)
    body = convert_pdf_to_page(content)
    assert_match /Fun Events in History/,body
  end

  test "generating EPUB" do
    visit book_epub_url(@book)

    content = DownloadHelpers::download_content
    sleep(5)
#    body = convert_pdf_to_page(content)
#    assert_match /Fun Events in History/,body
  end

  test "generating EPUB fiction" do
    visit book_epub_url(@book_2)

    content = DownloadHelpers::download_content
    sleep(5)
#    body = convert_pdf_to_page(content)
#    assert_match /Fun Events in History/,body
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: @book.name
    fill_in_rich_text_area "book_body", with: "Test 1"
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "creating a fictional Book" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: @book.name
    fill_in_rich_text_area "book_body", with: "Test 1"
    find(:css, "#book_fiction").set(true)
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "creating a nonfictional Book flow" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: "Test 1"
    fill_in_rich_text_area "book_body", with: "Test 1"
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

    assert_text "Key Points"
    within(:css, ".footer") do
      click_on "Key Points"
    end

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

    fill_in_rich_text_area "scene_summary", with: "Test 2"
    assert_text "Test 2"
    take_screenshot

    click_on "Create Scene"

    assert_text "Scene was successfully created"
    assert_text "Test 2"

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

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Name", with: @book.name
    fill_in_rich_text_area "book_body", with: "Test 1"
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should not update a Book" do
    visit book_url(@book)

    within(:xpath, "//*[contains(text(),'#{@book.name}')]/..") do
      Capybara.page.find('.fa-pencil').click
    end


    fill_in "Name", with: ""
    click_on "Update Book"

    assert_text "can't be blank"

    fill_in "Name", with: @book.name
    click_on "Update Book"
    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
