# frozen_string_literal: true

require 'test_helper'

class AuthorsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:author_1)
    @book = @author.books[0]

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_authors_url(book_id: @book.id)

    assert_response 200
    @authors = Author.all

    assert_select 'a[text()=?]', 'New Author'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :author])
    assert_select 'a[text()=?]', 'Add Author'
    assert_select 'a[href=?]', polymorphic_path([@book, :authors_list])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@book)
    assert_select '.footer>div>a', 3
    assert_template 'authors/index'

    assert_select 'h1', 'Authors'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
