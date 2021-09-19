# frozen_string_literal: true

require 'test_helper'

class ItinerariesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@tour, :itinerary])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', tour_path(@tour)
    assert_select '.footer>div>a', 1
    assert_template 'itineraries/new'
  end
end
