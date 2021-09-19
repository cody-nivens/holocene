# frozen_string_literal: true

require 'test_helper'

class EventTypesGeoMapHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should map event_type' do
    get geo_map_event_type_url(id: @event_type.id)
    assert_response :success

    assert_select 'a[text()=?]', 'Display'
    assert_select 'a[href=?]', event_type_path(@event_type)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 2
    assert_template 'event_types/geo_map'
  end
end
