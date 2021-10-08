# frozen_string_literal: true

require 'application_system_test_case'

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:section_1)
    @chapter = @section.sectioned
    @chapter2 = chapters(:chapter_2)
    sections = @chapter2.sections.order(:position)
    @section1 = sections[0]
    @section2 = sections[1]
    @section3 = sections[2]

    @user = users(:users_1)
    sign_in @user
  end

  test 'sort sections' do
    visit chapter_sections_path(@chapter2)
    assert_text 'Chapter Two Stuff'

    # save_and_open_page
    # debugger
    # take_screenshot
    assert_match /#{@section1.name}.*#{@section2.name}.*#{@section3.name}/m, page.html

    draggable = find(:css, "#section-#{@section2.id}")
    droppable = find(:css, "#section-#{@section1.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_text @section1.name

    assert_match /#{@section2.name}.*#{@section1.name}.*#{@section3.name}/m, page.html
    visit current_path

    assert_text @section1.name
    assert_match /#{@section2.name}.*#{@section1.name}.*#{@section3.name}/m, page.html
  end


  test 'sections edit' do
    visit edit_section_url(@section)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Timeline'
    assert_current_path section_path(@section)
    click_on 'Back'
    assert_link 'Citations'
    assert_current_path polymorphic_path(@chapter)
  end

  test 'sections geo_map display' do
    visit geo_map_section_url(@section)
#    visit Display
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Timeline'
    assert_current_path section_display_path(section_id: @section.id)
    click_on 'Back'
    assert_link 'Display'
    assert_current_path polymorphic_path(@section)
  end

  test 'sections geo_map timeline' do
#    visit Timeline
    visit geo_map_section_url(@section)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    assert_current_path section_timeline_path(section_id: @section.id)
    click_on 'Back'
    assert_link 'Timeline'
    assert_current_path section_path(@section)
  end

  test 'sections index' do
    visit chapter_sections_url(@chapter)
#    visit New Section
    assert_link 'New Section'
    click_on 'New Section'
    assert_no_link 'New Section'
    assert_current_path new_polymorphic_path([@chapter, :section])
    click_on 'Back'
    assert_link 'New Section'
    assert_current_path chapter_sections_path(@chapter)
  end

  test 'sections show display' do
    visit section_url(@section)
#    visit Display
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Add Event'
    assert_current_path section_display_path(section_id: @section.id)
    click_on 'Back'
    assert_link 'Map'
    assert_current_path section_path(@section)
  end

  test 'sections show edit' do
#    visit Edit
    visit section_url(@section)
    within ".footer" do
      assert_link 'Edit'
      click_on 'Edit'
    end
    assert_text 'Editing Section'
    assert_current_path edit_section_path(@section)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path section_path(@section)
  end

  test 'sections show footnotes' do
#    visit Footnotes
    visit section_url(@section)
    assert_link 'Footnotes'
    click_on 'Footnotes'
    assert_no_link 'Footnotes'
    assert_current_path section_footnotes_path(@section)
    click_on 'Back'
    assert_text @section.name
    assert_current_path section_path(@section)
  end

  test 'sections show map' do
#    visit Map
    visit section_url(@section)
    assert_link 'Map'
    click_on 'Map'
    assert_selector '#world-map'
    assert_current_path geo_map_section_path(@section)
    click_on 'Back'
    assert_link 'Partition'
    assert_current_path chapter_path(@chapter)
  end

  test 'sections show timeline' do
#    visit Timeline
    visit section_url(@section)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    assert_current_path section_timeline_path(section_id: @section.id)
    click_on 'Back'
    assert_text 'Word Count'
    assert_current_path section_path(@section)
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
