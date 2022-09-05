# frozen_string_literal: true

require 'test_helper'

class WelcomesTagsHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get tags' do
    get welcome_tags_url

    assert_response 200

    assert_select 'a[text()=?]', 'Progress'
    assert_select 'a[href=?]', welcome_index_path
    assert_select 'a[text()=?]', 'Stats'
    assert_select 'a[href=?]', welcome_stats_path

    assert_template 'welcome/tags'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
