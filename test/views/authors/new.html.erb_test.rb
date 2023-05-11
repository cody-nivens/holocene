# frozen_string_literal: true

require 'test_helper'

class AuthorsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:author_1)
    @book = @author.books[0]

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :author])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_authors_path(@book)
    assert_template 'authors/new'
  end
end
