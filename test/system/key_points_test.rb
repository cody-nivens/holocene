require "application_system_test_case"

class KeyPointsTest < ApplicationSystemTestCase
  setup do
    @key_point = key_points(:key_point_1)
    @key_point_2 = key_points(:key_point_5)
    @scripted = books(:book_2)
    @story = @key_point.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Keypoint index" do
    #visit polymorphic_url([@story,:key_points])
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    within ".footer" do
      click_on "Key Points"
    end
  end

  test "visiting the Keypoint move" do
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    click_on "Climate Change"
    assert_text "Move"
    click_on "Move"
    select "The Endings", from: "new_story_id"
    click_on "Save"
    assert_text "Key Point successfully moved"
  end

  test "visiting the Keypoint list" do
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    click_on "Climate Change"
    assert_text "A00001"
    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click
    assert_text "Missing 9 scene"
    select "Missing 9 scene", from: "scenes_avail"
    click_on "Save"
    within "#scenes_ids" do
      assert_text "Missing 9 scene"
    end
    select "Missing 9 scene", from: "scenes_ids"
    click_on "Save"
    within "#scenes_avail" do
      assert_text "Missing 9 scene"
    end
    within "#scenes_ids" do
      assert_no_text "Missing 9 scene"
    end
  end

  test "creating a Key point" do
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    within ".footer" do
      click_on "Key Points"
    end
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
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    within ".footer" do
      click_on "Key Points"
    end
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
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    within ".footer" do
      click_on "Key Points"
    end
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
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    within ".footer" do
      click_on "Key Points"
    end
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
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    within ".footer" do
      click_on "Key Points"
    end

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Key point was successfully destroyed"
  end
end
