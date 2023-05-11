# frozen_string_literal: true

require 'test_helper'

class EventTypesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_event_type_url(@event_type)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', event_type_path(@event_type)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', event_type_path
    assert_template 'event_types/edit'
  end
end
