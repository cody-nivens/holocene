# frozen_string_literal: true

require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test 'visiting the Welcome index' do
    visit root_url
    
    do_menu 'Welcome', 'Stats'
    assert_current_path root_path
    assert_text 'Holocene Events'
    
    do_menu 'Welcome', 'Tags'
    assert_current_path root_path
    assert_selector "#tag_cloud"
    
    do_menu 'Welcome', 'Progress'
    assert_current_path root_path
  end

end
