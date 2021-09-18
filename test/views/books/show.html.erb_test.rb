require 'test_helper'

class BooksShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @book_2 = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test "should show book I" do
    get book_path(@book)
    assert_response :success

    assert_select "a[href=?]", edit_book_path(@book)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", books_path
    assert_select ".footer>div>a", 5
    assert_template 'books/show'
  end

  test "should show book II" do
    get book_path(@book_2)
    assert_response :success

    assert_select "a[href=?]", edit_book_path(@book_2)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", books_path
    assert_select ".footer>div>a", 10
    assert_template 'books/show'
  end
end
