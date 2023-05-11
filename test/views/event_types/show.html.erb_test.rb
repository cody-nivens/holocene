# frozen_string_literal: true

require 'test_helper'

class EventTypesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show event_type' do
    get event_type_path(@event_type)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_event_type_path(@event_type)
    assert_select 'a[title=?]', 'Timeline'
    assert_select 'a[href=?]', event_type_timeline_path(@event_type)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_event_type_path(@event_type)
    assert_select 'a[title=?]', 'Back'
    assert_template 'event_types/show'
  end
end
