# frozen_string_literal: true

require 'application_system_test_case'

class HoloceneEventsTest < ApplicationSystemTestCase
  setup do
    @holocene_event = holocene_events(:holocene_event_1)
    @chapter = chapters(:chapter_1)
    file = Rails.root.join('test', 'fixtures', 'files', 'image.jpg')
    @holocene_event.image.attach(io: File.open(file), filename: 'image.jpg')
    @user = users(:users_1)
    sign_in @user
  end

  test 'holocene_events display' do
    visit polymorphic_url([@chapter, :display])
#    visit Map
    assert_text 'Map'
    click_on 'Map'
    assert_current_path polymorphic_path([:geo_map, @chapter])
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
#    visit Timeline
    visit polymorphic_url([@chapter, :display])
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path polymorphic_path([@chapter, :timeline])
    click_on 'Back'
    #assert_current_path polymorphic_path([@chapter, :display])
  end

  test 'holocene_events edit' do
    visit edit_holocene_event_url(@holocene_event)
#    visit Show
    assert_text 'Show'
    click_on 'Show'
    assert_current_path holocene_event_path(@holocene_event)
    click_on 'Back'
    assert_current_path holocene_events_path
  end

  test 'holocene_events geo_map' do
    visit geo_map_holocene_event_url(@holocene_event)
#    visit Display
    assert_text 'Display'
    click_on 'Display'
    assert_current_path holocene_event_path(@holocene_event)
    click_on 'Back'
    assert_current_path holocene_events_path
  end

  test 'holocene_events index' do
    visit holocene_events_url
#    visit New Holocene Event
    assert_text 'New Holocene Event'
    click_on 'New Holocene Event'
    assert_current_path new_holocene_event_path
    click_on 'Back'
    assert_current_path holocene_events_path
  end

  test 'holocene_events show' do
    visit holocene_event_url(@holocene_event)
#    visit Edit
    assert_text 'Edit'
    click_on 'Edit'
    assert_current_path edit_holocene_event_path(@holocene_event)
    click_on 'Back'
    #assert_current_path holocene_events_path
#    visit Footnotes
    visit holocene_event_url(@holocene_event)
    assert_text 'Footnotes'
    click_on 'Footnotes'
    assert_current_path holocene_event_footnotes_path(@holocene_event)
    click_on 'Back'
    assert_current_path holocene_event_path(@holocene_event)
#    visit Map
    assert_text 'Map'
    click_on 'Map'
    assert_current_path geo_map_holocene_event_path(@holocene_event)
    click_on 'Back'
    assert_current_path holocene_event_path(@holocene_event)
  end

  test 'searching a Holocene event' do
    [['Impact', 1], ['Volcanic', 1], ['Climate', 1], ['Cultural', 8], ['Epidemic', 0], ['Earth', 1]].each do |item|
      event_type = item[0]
      count = item[1]
      visit holocene_events_url
      select event_type, from: 'Event Type'
      click_on 'Search'
      if count.zero?
        assert_selector 'table.datagrid > tbody > tr', count: 1, text: '――'
      else
        assert_selector 'table.datagrid > tbody > tr', count: count
      end
    end
  end

  test 'creating a Holocene event' do
    visit holocene_events_url
    click_on 'New Holocene Event'

    # fill_in "Body", with: @holocene_event.body
    fill_in 'End year', with: @holocene_event.end_year
    fill_in 'End year mod', with: @holocene_event.end_year_mod
    fill_in 'End year uncert', with: @holocene_event.end_year_uncert
    fill_in 'Name', with: @holocene_event.name
    fill_in 'Start year', with: @holocene_event.start_year
    fill_in 'Start year mod', with: @holocene_event.start_year_mod
    fill_in 'Start year uncert', with: @holocene_event.start_year_uncert
    fill_in_rich_text_area 'holocene_event_body', with: 'Test 1'
    # find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on 'Create Holocene event'

    assert_text 'Holocene event was successfully created'
    click_on 'Back'
  end

  test 'should not create a Holocene event' do
    visit holocene_events_url
    click_on 'New Holocene Event'

    # fill_in "Body", with: @holocene_event.body
    fill_in 'End year', with: @holocene_event.end_year
    fill_in 'End year mod', with: @holocene_event.end_year_mod
    fill_in 'End year uncert', with: @holocene_event.end_year_uncert
    fill_in 'Name', with: ''
    fill_in 'Start year', with: @holocene_event.start_year
    fill_in 'Start year mod', with: @holocene_event.start_year_mod
    fill_in 'Start year uncert', with: @holocene_event.start_year_uncert
    fill_in_rich_text_area 'holocene_event_body', with: 'Test 1'
    # find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on 'Create Holocene event'

    assert_text "can't be blank"

    fill_in 'Name', with: @holocene_event.name
    click_on 'Create Holocene event'

    assert_text 'Holocene event was successfully created'
    click_on 'Back'
  end
end
