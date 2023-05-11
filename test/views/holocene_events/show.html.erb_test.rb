# frozen_string_literal: true

require 'test_helper'

class HoloceneEventsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event = holocene_events(:holocene_event_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show holocene_event' do
    get holocene_event_path(@holocene_event)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_holocene_event_path(@holocene_event)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_holocene_event_path(@holocene_event)
    assert_select 'a[title=?]', 'Footnotes'
    assert_select 'a[href=?]', holocene_event_footnotes_path(@holocene_event)
    assert_select 'a[title=?]', 'Back'
    assert_template 'holocene_events/show'
  end
end
