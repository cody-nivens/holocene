require "application_system_test_case"

class KeyPointsTest < ApplicationSystemTestCase
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit book_key_points_url(@scripted)
    assert_selector "h1", text: "Key Points"
  end

  test "creating a Key point" do
    visit book_key_points_url(@scripted)
    click_on "New Key Point"

    fill_in "Climax", with: @key_point.climax
    fill_in "First pinch point", with: @key_point.first_pinch_point
    fill_in "First plot point", with: @key_point.first_plot_point
    fill_in "Hook", with: @key_point.hook
    fill_in "Inciting incident", with: @key_point.inciting_incident
    fill_in "Key element", with: @key_point.key_element
    fill_in "Midpoint", with: @key_point.midpoint
    fill_in "Second pinch point", with: @key_point.second_pinch_point
    fill_in "Third plot point", with: @key_point.third_plot_point
    click_on "Create Key point"

    assert_text "Key point was successfully created"
    click_on "Back"
  end

  test "not creating a Key point" do
    visit book_key_points_url(@scripted)
    click_on "New Key Point"

    fill_in "Climax", with: @key_point.climax
    fill_in "First pinch point", with: @key_point.first_pinch_point
    fill_in "First plot point", with: @key_point.first_plot_point
    fill_in "Hook", with: ""
    fill_in "Inciting incident", with: @key_point.inciting_incident
    fill_in "Key element", with: @key_point.key_element
    fill_in "Midpoint", with: @key_point.midpoint
    fill_in "Second pinch point", with: @key_point.second_pinch_point
    fill_in "Third plot point", with: @key_point.third_plot_point
    click_on "Create Key point"

    assert_text "Hook can't be blank"
    click_on "Back"
  end

  test "updating a Key point" do
    visit book_key_points_url(@scripted)
    click_on "Edit", match: :first

    fill_in "Climax", with: @key_point.climax
    fill_in "First pinch point", with: @key_point.first_pinch_point
    fill_in "First plot point", with: @key_point.first_plot_point
    fill_in "Hook", with: @key_point.hook
    fill_in "Inciting incident", with: @key_point.inciting_incident
    fill_in "Key element", with: @key_point.key_element
    fill_in "Midpoint", with: @key_point.midpoint
    fill_in "Second pinch point", with: @key_point.second_pinch_point
    fill_in "Third plot point", with: @key_point.third_plot_point
    click_on "Update Key point"

    assert_text "Key point was successfully updated"
    click_on "Back"
  end

  test "not updating a Key point" do
    visit book_key_points_url(@scripted)
    click_on "Edit", match: :first

    fill_in "Climax", with: @key_point.climax
    fill_in "First pinch point", with: @key_point.first_pinch_point
    fill_in "First plot point", with: @key_point.first_plot_point
    fill_in "Hook", with: ""
    fill_in "Inciting incident", with: @key_point.inciting_incident
    fill_in "Key element", with: @key_point.key_element
    fill_in "Midpoint", with: @key_point.midpoint
    fill_in "Second pinch point", with: @key_point.second_pinch_point
    fill_in "Third plot point", with: @key_point.third_plot_point
    click_on "Update Key point"

    assert_text "Hook can't be blank"
    click_on "Back"
  end

  test "destroying a Key point" do
    visit book_key_points_url(@scripted)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Key point was successfully destroyed"
  end
end
