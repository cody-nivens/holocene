require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    sign_in @user
  end


   test "visiting the index" do
     visit root_url
     assert_selector "h1", text: "Welcome"
   end
end
