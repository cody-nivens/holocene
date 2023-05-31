# frozen_string_literal: true

require 'test_helper'

class ItinerariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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

    assert_response :unprocessable_entity
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
    assert_response :unprocessable_entity
  end

  test 'should destroy itinerary' do
    assert_difference('Itinerary.count', -1) do
      delete itinerary_url(@itinerary)
    end

    assert_redirected_to tour_itineraries_url(@tour)
  end
end

  test 'should get edit' do
    get edit_itinerary_path(@itinerary)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@tour, :itinerary])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show itinerary TS' do
    get itinerary_path(@itinerary, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show itinerary index TS' do
    get tour_itineraries_url(@tour, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create itinerary TS" do
    assert_difference('Itinerary.count') do
      post tour_itineraries_url(@tour, format: 'turbo_stream'),
           params: { itinerary: { name: @itinerary.name, city_id: @itinerary.city_id, position: @itinerary.position,
                                  stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update itinerary TS" do
    patch  itinerary_path(@itinerary, format: :turbo_stream),
          params: { itinerary: { name: @itinerary.name, city_id: @itinerary.city_id, position: @itinerary.position,
                                 stay: @itinerary.stay, tour_id: @itinerary.tour_id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @itinerary}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy itinerary TS" do
    assert_difference('Itinerary.count', -1) do
      delete itinerary_url(@itinerary, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
