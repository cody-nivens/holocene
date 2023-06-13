# frozen_string_literal: true

require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test "walk the welcome menus" do
    walk_menu('Welcome')
  end
end
