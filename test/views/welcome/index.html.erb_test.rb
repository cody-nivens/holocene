# frozen_string_literal: true

require 'test_helper'

class WelcomeIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get welcome_index_url

    assert_response 200

    assert_template 'welcome/index'

    #assert_select 'h1', 'Welcome'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
