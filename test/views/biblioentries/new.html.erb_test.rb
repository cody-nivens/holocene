# frozen_string_literal: true

require 'test_helper'

class BiblioentriesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = @biblioentry.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :biblioentry])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_biblioentries_path(@book)
    assert_template 'biblioentries/new'
  end
end
