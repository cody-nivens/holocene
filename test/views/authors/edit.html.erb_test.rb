# frozen_string_literal: true

require 'test_helper'

class AuthorsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:author_1)
    @book = @author.books[0]

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_polymorphic_url([@book, @author])
    assert_select 'a[text()=?]', 'Back'
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', polymorphic_path([@book, @author])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@book, :authors])
    assert_select '.footer>div>a', 2
    assert_template 'authors/edit'
  end
end
