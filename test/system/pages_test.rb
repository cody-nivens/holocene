require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  setup do
    @page = pages(:page_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "drive the tour cycle" do
    menu_test('Support', 'Pages', debug: false)
  end


  if 1 == 0
  test "visiting the index" do
    visit pages_url
    assert_selector "h1", text: "Pages"
  end

  test "should create page" do
    visit pages_url
    click_on "New page"

    fill_in "Name", with: @page.name
    fill_in "Slug", with: @page.slug
    fill_in "User", with: @page.user_id
    click_on "Create Page"

    assert_text "Page was successfully created"
    click_on "Back"
  end

  test "should update Page" do
    visit page_url(@page)
    click_on "Edit this page", match: :first

    fill_in "Name", with: @page.name
    fill_in "Slug", with: @page.slug
    fill_in "User", with: @page.user_id
    click_on "Update Page"

    assert_text "Page was successfully updated"
    click_on "Back"
  end

  test "should destroy Page" do
    visit page_url(@page)
    click_on "Destroy this page", match: :first

    assert_text "Page was successfully destroyed"
  end
end
end
