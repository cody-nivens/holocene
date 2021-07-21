require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book_1)
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
    sleep(5)
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

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Name", with: @book.name
    page.execute_script("var wysihtml5Editor = $('#book_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@book.body}')")
    click_on "Create Book"

    assert_text "Book was successfully created"
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
    page.execute_script("var wysihtml5Editor = $('#book_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@book.body}')")
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should not update a Book" do
    visit book_url(@book)

    within(:xpath, "//*[contains(text(),'Fun Events in History ')]") do
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
