require 'test_helper'

class HoloceneEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event = holocene_events(:one)
  end

  test "should get index" do
    get holocene_events_url
    assert_response :success
  end

  test "should get tagged 1" do
    get tag_url(:tag => 'Event')
    assert_response :success
  end

#  test "should get tagged 2" do
#    get tag_url(:tag => nil)
#    assert_response :success
#  end

  test "should get new" do
    get new_holocene_event_url
    assert_response :success
  end

  test "should create holocene_event" do
    assert_difference('HoloceneEvent.count') do
        post holocene_events_url, params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year, end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert, event_type_id: @holocene_event.event_type.id.to_i, name: @holocene_event.name, region_id: @holocene_event.region.id.to_i, start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod, start_year_uncert: @holocene_event.start_year_uncert } }
    end

    assert_redirected_to holocene_event_url(HoloceneEvent.last)
  end

  test "should not create holocene_event" do
    assert_difference('HoloceneEvent.count', 0) do
        post holocene_events_url, params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year, end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert, event_type_id: @holocene_event.event_type.id.to_i, name: "", region_id: @holocene_event.region.id.to_i, start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod, start_year_uncert: @holocene_event.start_year_uncert } }
    end

    assert_response :success
  end

  test "should show holocene_event" do
    get holocene_event_url(@holocene_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_holocene_event_url(@holocene_event)
    assert_response :success
  end

  test "should update holocene_event" do
    patch holocene_event_url(@holocene_event), params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year, end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert, event_type: @holocene_event.event_type, name: @holocene_event.name, region: @holocene_event.region, start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod, start_year_uncert: @holocene_event.start_year_uncert } }
    assert_redirected_to holocene_event_url(@holocene_event)
  end

  test "should not update holocene_event" do
    patch holocene_event_url(@holocene_event), params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year, end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert, event_type: @holocene_event.event_type, name: "", region: @holocene_event.region, start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod, start_year_uncert: @holocene_event.start_year_uncert } }
    assert_response :success
  end

  test "should destroy holocene_event" do
    assert_difference('HoloceneEvent.count', -1) do
      delete holocene_event_url(@holocene_event)
    end

    assert_redirected_to holocene_events_url
  end
end
