# frozen_string_literal: true

require 'test_helper'

class ItinerariesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show itinerary' do
    get itinerary_path(@itinerary)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_itinerary_path(@itinerary)
    assert_select 'a[title=?]', 'Back'
    assert_template 'itineraries/show'
  end
end
