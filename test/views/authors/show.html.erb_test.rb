# frozen_string_literal: true

require 'test_helper'

class AuthorsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:author_1)
    @book = @author.books[0]

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show author' do
    get polymorphic_path([@book, @author])
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_polymorphic_path([@book, @author])
    assert_select 'a[title=?]', 'Back'
    assert_template 'authors/show'
  end
end
