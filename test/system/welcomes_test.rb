require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end


   test "visiting the Welcome index" do
     visit root_url
     assert_text "Events"
   end

   test "visiting the Welcome stats" do
     visit welcome_stats_url
     assert_text "Events"
   end
end
