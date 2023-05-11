# frozen_string_literal: true

require 'test_helper'

class HoloceneEventsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event = holocene_events(:holocene_event_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_holocene_event_url(@holocene_event)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', holocene_event_path(@holocene_event)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', holocene_events_path
    assert_template 'holocene_events/edit'
  end
end
