# frozen_string_literal: true

require 'test_helper'

class BooksStatsHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get stats' do
    get book_stats_url(@book)

    assert_response 200

    assert_template 'books/stats'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
