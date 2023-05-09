# frozen_string_literal: true

require 'test_helper'

class BooksIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get books_url

    assert_response 200
    @books = Book.all

    assert_select 'a[title=?]', 'New Book'
    assert_select 'a[href=?]', new_book_path
    assert_select 'a[title=?]', 'Long View'
    assert_select 'a[href=?]', books_path(long: true)
    assert_template 'books/index'

    assert_select 'h2', 'Books'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
