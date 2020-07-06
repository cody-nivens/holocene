require 'test_helper'

class BiblioentriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = @biblioentry.book
    #@book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_biblioentries_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'New Biblioentry'
    assert_select "a[href=?]", new_book_biblioentry_path(@book)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 2
  end

  test "should get new" do
    get new_book_biblioentry_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_biblioentries_path(@biblioentry.book)
    assert_select ".footer>div>a", 1
  end

  test "should create biblioentry" do
    assert_difference('Biblioentry.count') do
        post book_biblioentries_url(@book), params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year, name: @biblioentry.name, publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel, user_id: @user.id, book_id: @book.id } }
    end

    assert_redirected_to book_biblioentry_url(@book,Biblioentry.last)
  end

  test "should not create biblioentry" do
    assert_difference('Biblioentry.count', 0) do
        post book_biblioentries_url(@book), params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year, name: "", publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel, user_id: @user.id, book_id: @book.id } }
    end

    assert_response :success
  end

  test "should show biblioentry" do
    get book_biblioentry_url(@book,@biblioentry)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_book_biblioentry_path(@book,@biblioentry)
    assert_select "a[text()=?]",'Back'

    # history.back is now used
    #assert_select "a[href=?]", book_biblioentries_path(@biblioentry.book)
    assert_select ".footer>div>a", 2
  end

  test "should get edit" do
    get edit_book_biblioentry_url(@biblioentry.book,@biblioentry)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", book_biblioentry_path(@biblioentry.book,@biblioentry)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_biblioentries_path(@biblioentry.book)
    assert_select ".footer>div>a", 2
  end

  test "should update biblioentry" do
    patch book_biblioentry_url(@book,@biblioentry), params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year, name: @biblioentry.name, publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel } }
    assert_redirected_to book_biblioentry_url(@book,@biblioentry)
  end

  test "should not update biblioentry" do
    patch book_biblioentry_url(@book,@biblioentry), params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year, name: "", publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel } }
    assert_response :success
  end

  test "should destroy biblioentry" do
    assert_difference('Biblioentry.count', -1) do
      delete book_biblioentry_url(@book,@biblioentry)
    end

    assert_redirected_to book_biblioentries_url(@book)
  end
end
