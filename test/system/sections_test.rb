require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:section_1)
    @chapter = @section.sectioned
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Section index" do
    visit chapter_sections_url(@chapter)
    assert_selector "h1", text: "Sections"
    assert_link "New Section"
    assert_no_text "link_to"
  end

  test "visiting the map" do
    visit chapter_sections_url(@chapter)
    assert_selector "h1", text: "Sections"
    assert_link "New Section"
    assert_no_text "link_to"
    click_on "Show", match: :first
    Capybara.page.find('.fa-map-o').click
    assert_link "Back"
    click_on "Back"
  end

  test "visiting the timeline" do
    visit section_timeline_url(@section)
    assert_text "Domestication of Goats"
  end

  test "visiting display" do
    visit chapter_section_url(@chapter,@section)

    assert_text "Domestication of the Animals"
    Capybara.page.find('.fa-list').click

    assert_link "Add Event"
    assert_text "Domestication of Goats"

    click_on "Add Event"

    assert_link "Add Event"
    assert_button "Add Events"

    he = HoloceneEvent.find_by_name("Domestication of Cats")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Add Events"
   
    assert_text "Section was successfully updated"

    Capybara.page.find('.fa-list').click
    assert_text "Domestication of Cats"

    assert_button "Delete Events"

    find('#holocene_event_other_id').find(:xpath, 'option[2]').select_option
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)

    assert_button "Move Events"
    click_on "Move Events"
   
    assert_text "Section was successfully updated"
    assert_no_text "Domestication of Cats"

  end

  test "visiting display 2" do
    visit chapter_section_url(@chapter,@section)

    assert_text "Domestication of the Animals"
    Capybara.page.find('.fa-list').click

    assert_link "Add Event"
    assert_text "Domestication of Goats"

    click_on "Add Event"

    assert_link "Add Event"
    assert_button "Add Events"

    he = HoloceneEvent.find_by_name("Domestication of Cats")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Add Events"
   
    assert_text "Section was successfully updated"

    Capybara.page.find('.fa-list').click
    assert_text "Domestication of Cats"

    assert_button "Delete Events"

    #find('#holocene_event_other_id').find(:xpath, 'option[2]').select_option
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)

    assert_button "Delete Events"
    click_on "Delete Events"
   
    assert_text "Section was successfully updated"
    assert_no_text "Domestication of Cats"

  end

  test "creating a Section" do
    visit chapter_sections_url(@chapter)
    click_on "New Section"

    fill_in "Name", with: @section.name
    fill_in_rich_text_area "section_body", with: "Test 1"

    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back", match: :first
  end

  test "should not create a Section" do
    visit chapter_sections_url(@chapter)
    click_on "New Section"

    fill_in "Name", with: ""
    fill_in_rich_text_area "section_body", with: "Test 1"

    click_on "Create Section"

    assert_text "can't be blank"

    fill_in "Name", with: @section.name
    click_on "Create Section"
    assert_text "Section was successfully created"
    click_on "Back", match: :first
  end

  test "updating a Section" do
    visit chapter_section_url(@chapter, @section)
    Capybara.page.find('.fa-pencil').click

    fill_in "Name", with: @section.name
    fill_in_rich_text_area "section_body", with: "Test 1"

    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back", match: :first
  end

  test "should not update a Section" do
    visit chapter_section_url(@chapter, @section)
    Capybara.page.find('.fa-pencil').click

    fill_in "Name", with: ""
    fill_in_rich_text_area "section_body", with: "Test 1"

    click_on "Update Section"

    assert_text "can't be blank"

    fill_in "Name", with: @section.name
    click_on "Update Section"
    assert_text "Section was successfully updated"
    click_on "Back", match: :first
  end

  test "destroying a Section" do
    visit chapter_sections_url(@chapter)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section was successfully destroyed"
  end
end
