require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @book_2 = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get resync_stories" do
    get book_resync_stories_url(@book)
    assert_redirected_to book_stories_url(@book)
  end

  test "should get index" do
    get books_url
    assert_response :success

    assert_select "a[text()=?]",'New Book'
    assert_select "a[href=?]", new_book_path
    assert_select ".footer>div>a", 1
  end

  test "should get toc" do
    get toc_url(@book.id)
    assert_response :success
  end

#  test "should get export" do
#    get book_export_url(@book)
#    assert_response :success
#  end

  test "should get new" do
    get new_book_url
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", books_path
    assert_select ".footer>div>a", 1
  end

  test "should create book" do
    assert_difference('Book.count') do
        post books_url, params: { book: { body: @book.body, name: @book.name, user_id: @user.id} }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should not create book" do
    assert_difference('Book.count', 0) do
        post books_url, params: { book: { body: @book.body, name: "", user_id: @user.id} }
    end

    assert_response :success
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'Chapters, TOC'
    assert_select "a[href=?]", book_chapters_path(@book)
    assert_select "a[text()=?]",'Chapters, Details'
    assert_select "a[href=?]", book_chapters_path(@book)
    assert_select "a[text()=?]",'Back'
    
    # history.back is now used
    # assert_select "a[href=?]", books_path
    assert_select ".footer>div>a", 3
  end

  test "should show pdf book" do
    get book_url(@book, :format => :pdf)
    assert_response :success
  end

  test "should get epub" do
    get book_epub_url(@book)
    assert_response :success
  end

  test "should get epub 2" do
    get book_epub_url(@book_2)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", book_path(@book)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", books_path
    assert_select ".footer>div>a", 2
  end

  test "should update book" do
      patch book_url(@book), params: { book: { body: @book.body, name: @book.name, user_id: @user.id} }
    assert_redirected_to book_url(@book)
  end

  test "should not update book" do
    patch book_url(@book), params: { book: { body: @book.body, name: "", user_id: @user.id} }
    assert_response :success
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
