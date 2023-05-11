# frozen_string_literal: true

require 'test_helper'

class BiblioentriesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = @biblioentry.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show biblioentry' do
    get biblioentry_path(@biblioentry)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_biblioentry_path(@biblioentry)
    assert_select 'a[title=?]', 'Back'
    assert_template 'biblioentries/show'
  end
end
