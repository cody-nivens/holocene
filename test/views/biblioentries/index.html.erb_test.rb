# frozen_string_literal: true

require 'test_helper'

class BiblioentriesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = @biblioentry.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_biblioentries_url(book_id: @book.id)

    assert_response 200
    @biblioentries = Biblioentry.all

    assert_select 'a[text()=?]', 'New Biblioentry'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :biblioentry])
    assert_select '.footer>div>a', 2
    assert_template 'biblioentries/index'

    assert_select 'h2', 'Biblioentries'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
