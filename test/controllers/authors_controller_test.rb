require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:authors_1)
    @user = users(:users_1)
    @book = @author.books[0]
    sign_in @user
  end

  test "should get index" do
    get book_authors_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'New Author'
    assert_select "a[href=?]", new_book_author_path(@book)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_authors_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should get new" do
    get new_book_author_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_authors_path(@book)
    assert_select ".footer>div>a", 1
  end

  test "should create author" do
    assert_difference('Author.count') do
        post book_authors_path(@book), params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    end

    assert_redirected_to book_author_url(@book,Author.last)
  end

  test "should not create author" do
    assert_difference('Author.count', 0) do
        post book_authors_url(@book), params: { author: { first_name: "", last_name: @author.last_name, user_id: @user.id } }
    end

    assert_response :success
  end

  test "should show author" do
    get book_author_url(@book,@author)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_book_author_path(@book,@author)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_authors_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should get edit" do
    get edit_book_author_url(@book,@author)
    assert_select "a[text()=?]",'Back'
    assert_response :success


    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", book_author_path(@book, @author)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_authors_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should update author" do
      patch book_author_url(@book,@author), params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    assert_redirected_to book_author_url(@book, @author)
  end

  test "should not update author" do
      patch book_author_url(@book,@author), params: { author: { first_name: "", last_name: @author.last_name, user_id: @user.id } }
    assert_response :success
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete book_author_url(@book,@author)
    end

    assert_redirected_to book_authors_path(@book)
  end
end
