require "application_system_test_case"

class PlotPointsTest < ApplicationSystemTestCase
  setup do
    @plot_point = plot_points(:plot_point_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "drive the plot_point cycle" do
    menu_test('Book', 'Plot Points')
  end

  if 1 == 0
  test "visiting the index" do
    visit plot_points_url
    assert_selector "h1", text: "Plot Points"
  end

  test "creating a Plot point" do
    visit plot_points_url
    click_on "New Plot Point"

    fill_in "Name", with: @plot_point.name
    click_on "Create Plot point"

    assert_text "Plot point was successfully created"
    click_on "Back"
  end

  test "updating a Plot point" do
    visit plot_points_url
    click_on "Edit", match: :first

    fill_in "Name", with: @plot_point.name
    click_on "Update Plot point"

    assert_text "Plot point was successfully updated"
    click_on "Back"
  end

  test "destroying a Plot point" do
    visit plot_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plot point was successfully destroyed"
  end
end
end
