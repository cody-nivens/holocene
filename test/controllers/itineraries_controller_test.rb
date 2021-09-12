require 'test_helper'

class ItinerariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour
    @story= @tour.story
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get story_tour_itineraries_url(@story,@tour)
    assert_response :success
  end

  test "should get new" do
    get new_story_tour_itinerary_url(@story,@tour)
    assert_response :success
  end

  test "should create itinerary" do
    assert_difference('Itinerary.count') do
      post story_tour_itineraries_url(@story,@tour), params: { itinerary: { name: @itinerary.name, city_id: @itinerary.city_id, position: @itinerary.position, stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    end

    assert_redirected_to story_tour_itinerary_url(@story,@tour,Itinerary.last)
  end

  test "should not create itinerary" do
    assert_difference('Itinerary.count',0) do
      post story_tour_itineraries_url(@story,@tour), params: { itinerary: { name: '', city_id: @itinerary.city_id, position: @itinerary.position, stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    end

    assert_response 422
  end

  test "should show itinerary" do
    get story_tour_itinerary_url(@story,@tour,@itinerary)
    assert_response :success
  end

  test "should get edit" do
    get edit_story_tour_itinerary_url(@story,@tour,@itinerary)
    assert_response :success
  end

  test "should update itinerary" do
    patch story_tour_itinerary_url(@story,@tour,@itinerary), params: { itinerary: { name: @itinerary.name, city_id: @itinerary.city_id, position: @itinerary.position, stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    assert_redirected_to story_tour_itinerary_url(@story,@tour,@itinerary)
  end

  test "should not update itinerary" do
    patch story_tour_itinerary_url(@story,@tour,@itinerary), params: { itinerary: { name: '', city_id: @itinerary.city_id, position: @itinerary.position, stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    assert_response 422
  end

  test "should destroy itinerary" do
    assert_difference('Itinerary.count', -1) do
      delete story_tour_itinerary_url(@story,@tour,@itinerary)
    end

    assert_redirected_to story_tour_itineraries_url(@story,@tour)
  end
end
