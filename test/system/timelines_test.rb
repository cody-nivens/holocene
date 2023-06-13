# frozen_string_literal: true

require 'application_system_test_case'

class TimelinesTest < ApplicationSystemTestCase
  setup do
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "drive the timeline cycle" do
    drive_cycle('Support', 'Timelines')
  end

  test 'visiting the timeline' do
    visit root_url
    setup_page 'Chapter'

    click_side 'calendar'

    assert_text 'Timeline for Chapter: Chapter Two Stuff'
  end

  if 1 == 0
  test 'timelines edit' do
    visit edit_timeline_url(@timeline)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path timeline_path(@timeline)
    click_on 'Back'
    assert_link 'New Timeline'
    assert_current_path timelines_path
  end

  test 'timelines geo_map' do
    visit geo_map_timeline_url(@timeline)
#    visit Display
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Timeline'
    assert_current_path timeline_display_path(@timeline)
    click_on 'Back'
    assert_link 'Map'
    assert_current_path timeline_path(@timeline)
#    visit Timeline
    visit geo_map_timeline_url(@timeline)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    assert_current_path timeline_timeline_path(@timeline)
    click_on 'Back'
    assert_link 'Map'
    assert_current_path timeline_path(@timeline)
  end

  test 'timelines index' do
    visit timelines_url
#    visit New Timeline
    assert_link 'New Timeline'
    click_on 'New Timeline'
    assert_no_link 'New Timeline'
    assert_current_path new_timeline_path
    click_on 'Back'
    assert_link 'New Timeline'
    assert_current_path timelines_path
  end

  test 'timelines show display' do
    visit timeline_url(@timeline)
#    visit Display
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Timeline'
    assert_current_path timeline_display_path(timeline_id: @timeline.id)
    click_on 'Back'
    assert_link 'Display'
    assert_current_path timeline_path(@timeline)
  end

  test 'timelines show edit' do
#    visit Edit
    visit timeline_url(@timeline)
    assert_text 'Edit'
    within ".footer" do
      click_on 'Edit'
    end
    assert_link 'Show'
    assert_current_path edit_timeline_path(@timeline)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path timeline_path(@timeline)
  end

  test 'timelines show map' do
#    visit Map
    visit timeline_url(@timeline)
    assert_link 'Map'
    click_on 'Map'
    assert_link 'Display'
    assert_current_path geo_map_timeline_path(@timeline)
    click_on 'Back'
    assert_link 'Map'
    assert_current_path timeline_path(@timeline)
  end

  test 'timelines show timeline' do
#    visit Timeline
    visit timeline_url(@timeline)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    assert_current_path timeline_timeline_path(timeline_id: @timeline.id)
    click_on 'Back'
    assert_text 'Timeline'
    assert_current_path timeline_path(@timeline)
  end

  test 'timelines timeline' do
    visit timeline_url(@timeline)
#    visit Display
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Timeline'
    assert_current_path timeline_display_path(@timeline)
    click_on 'Back'
    assert_link 'Display'
    assert_current_path timeline_path(@timeline)
  end

  test 'creating a Timeline' do
    visit timelines_url
    click_on 'New Timeline'

    fill_in 'Description', with: @timeline.description
    fill_in 'Name', with: @timeline.name
    click_on 'Create Timeline'

    assert_text 'Timeline was successfully created'
    click_on 'Back'
  end

  test 'should not create a Timeline' do
    visit timelines_url
    click_on 'New Timeline'

    fill_in 'Description', with: @timeline.description
    fill_in 'Name', with: ''
    click_on 'Create Timeline'

    assert_text "can't be blank"

    fill_in 'Name', with: @timeline.name
    click_on 'Create Timeline'
    assert_text 'Timeline was successfully created'
    click_on 'Back'
  end
end
end
