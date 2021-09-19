# frozen_string_literal: true

require 'test_helper'

class ItinerariesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get tour_itineraries_url(tour_id: @tour.id)

    assert_response 200
    @itineraries = Itinerary.all

    assert_select 'a[text()=?]', 'New Itinerary'
    assert_select 'a[href=?]', new_polymorphic_path([@tour, :itinerary])
    assert_select '.footer>div>a', 2
    assert_template 'itineraries/index'

    assert_select 'h1', 'Itineraries'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
