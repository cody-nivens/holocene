# frozen_string_literal: true

require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  ['Progress','Stats','Tags','History'].each do |item|
    test "walk the welcome #{item} menu" do
      menu_test 'Welcome', item
    end
  end
  
  test "home" do
    visit root_url
    do_menu 'Welcome', 'Progress'
    assert_link 'Home'
    click_link 'Home'
    assert_text 'Books'
  end
end
