# frozen_string_literal: true

require 'test_helper'

class WelcomeShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get show' do
    get welcome_show_url(date: '2022-09-30')

    assert_response 200

    assert_select 'a[text()=?]', 'Stats'
    assert_select 'a[href=?]', welcome_stats_path
    assert_select 'a[text()=?]', 'Tags'
    assert_select 'a[href=?]', welcome_tags_path

    assert_template 'welcome/show'

    assert_select 'h2', '2022-09-30'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end