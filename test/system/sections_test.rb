# frozen_string_literal: true

require 'application_system_test_case'

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:section_1)
    @chapter = @section.sectioned
    @user = users(:users_1)
    sign_in @user
  end

  test 'sections edit' do
    visit edit_section_url(@section)
#    visit Show
    assert_text 'Show'
    click_on 'Show'
    assert_current_path section_path(@section)
    click_on 'Back'
    assert_current_path polymorphic_path(@chapter)
  end

  test 'sections geo_map' do
    visit geo_map_section_url(@section)
#    visit Display
    assert_text 'Display'
    click_on 'Display'
    assert_current_path section_display_path(section_id: @section.id)
    click_on 'Back'
    assert_current_path polymorphic_path(@chapter)
#    visit Timeline
    visit geo_map_section_url(@section)
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path section_timeline_path(section_id: @section.id)
    click_on 'Back'
    #assert_current_path polymorphic_path(@chapter)
  end

  test 'sections index' do
    visit chapter_sections_url(@chapter)
#    visit New Section
    assert_text 'New Section'
    click_on 'New Section'
    assert_current_path new_polymorphic_path([@chapter, :section])
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
  end

  test 'sections show' do
    visit section_url(@section)
#    visit Display
    assert_text 'Display'
    click_on 'Display'
    assert_current_path section_display_path(section_id: @section.id)
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
#    visit Edit
    visit section_url(@section)
    within ".footer" do
      assert_text 'Edit'
      click_on 'Edit'
    end
    assert_current_path edit_section_path(@section)
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
#    visit Footnotes
    visit section_url(@section)
    assert_text 'Footnotes'
    click_on 'Footnotes'
    assert_current_path section_footnotes_path(@section)
    click_on 'Back'
    assert_current_path section_path(@section)
#    visit Map
    visit section_url(@section)
    assert_text 'Map'
    click_on 'Map'
    assert_current_path geo_map_section_path(@section)
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
#    visit Timeline
    visit section_url(@section)
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path section_timeline_path(section_id: @section.id)
    click_on 'Back'
    #assert_current_path section_path(@section)
  end

  test 'creating a Section' do
    visit chapter_sections_url(@chapter)
    click_on 'New Section'

    fill_in 'Name', with: @section.name
    fill_in_rich_text_area 'section_body', with: 'Test 1'

    click_on 'Create Section'

    assert_text 'Section was successfully created'
    click_on 'Back', match: :first
  end

  test 'should not create a Section' do
    visit chapter_sections_url(@chapter)
    click_on 'New Section'

    fill_in 'Name', with: ''
    fill_in_rich_text_area 'section_body', with: 'Test 1'

    click_on 'Create Section'

    assert_text "can't be blank"

    fill_in 'Name', with: @section.name
    click_on 'Create Section'
    assert_text 'Section was successfully created'
    click_on 'Back', match: :first
  end
end
