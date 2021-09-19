require 'test_helper'

class CitiesItineraryHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @city_1 = cities(:city_1)
    @city_2 = cities(:city_2)
    @city_3 = cities(:city_3)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get itinerary' do
    post cities_itinerary_url,
         params: { city: { activated: [cities(:city_1).id, cities(:city_2).id, cities(:city_3).id] } }

    assert_response 200

    assert_template 'cities/itinerary'

    # assert_select 'h1','Itinerary'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
