require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end


   test "visiting the index" do
     visit root_url
     assert_text "Holocene Events"
   end
end
