# frozen_string_literal: true

require 'test_helper'

class ItinerariesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_itinerary_url(@itinerary)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', itinerary_path(@itinerary)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', tour_path(@tour)
    assert_template 'itineraries/edit'
  end
end
