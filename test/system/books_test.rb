require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book_one)
    @user = users(:one)
    sign_in @user
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "generating PDF" do
    visit book_pdf_url(@book)

    content = DownloadHelpers::download_content
    body = convert_pdf_to_page(content)
    assert_match /MySection/,body
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

    assert_text "Please review the problems below:"
    assert_text "Name can't be blank"

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
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    click_on "Update Book"

    assert_text "Please review the problems below:"
    assert_text "Name can't be blank"

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
