# frozen_string_literal: true

require 'test_helper'

class ItinerariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get tour_itineraries_url(@tour)
    assert_response :success
  end

  test 'should get new' do
    get new_tour_itinerary_url(@tour)
    assert_response :success
  end

  test 'should create itinerary' do
    assert_difference('Itinerary.count') do
      post tour_itineraries_url(@tour),
           params: { itinerary: { name: @itinerary.name, city_id: @itinerary.city_id, position: @itinerary.position,
                                  stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    end

    assert_redirected_to itinerary_url(Itinerary.last)
  end

  test 'should not create itinerary' do
    assert_difference('Itinerary.count', 0) do
      post tour_itineraries_url(@tour),
           params: { itinerary: { name: '', city_id: @itinerary.city_id, position: @itinerary.position, stay: @itinerary.stay,
                                  tour_id: @itinerary.tour_id } }
    end

    assert_response 422
  end

  test 'should show itinerary' do
    get itinerary_url(@itinerary)
    assert_response :success
  end

  test 'should get edit' do
    get edit_itinerary_url(@itinerary)
    assert_response :success
  end

  test 'should update itinerary' do
    patch itinerary_url(@itinerary),
          params: { itinerary: { name: @itinerary.name, city_id: @itinerary.city_id, position: @itinerary.position,
                                 stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    assert_redirected_to itinerary_url(@itinerary)
  end

  test 'should not update itinerary' do
    patch itinerary_url(@itinerary),
          params: { itinerary: { name: '', city_id: @itinerary.city_id, position: @itinerary.position, stay: @itinerary.stay,
                                 tour_id: @itinerary.tour_id } }
    assert_response 422
  end

  test 'should destroy itinerary' do
    assert_difference('Itinerary.count', -1) do
      delete itinerary_url(@itinerary)
    end

    assert_redirected_to tour_itineraries_url(@tour)
  end
end
