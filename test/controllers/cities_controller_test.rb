# frozen_string_literal: true

require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:city_1)
    @user = users(:users_1)
    @tour = tours(:tour_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get cities_url
    assert_response :success
    assert_template 'city_grid/_table'
  end

  test 'should get index 2' do
    get cities_url, params: { cities_grid: { tour_id: @tour.id } }
    assert_response :success
    assert_template 'city_grid/_table'
  end

  test 'should get itinerary' do
    post cities_itinerary_path,
         params: { city: { activated: [cities(:city_1).id, cities(:city_2).id, cities(:city_3).id] } }
    assert_response :success
  end

  test 'should get itinerary 2' do
    post cities_itinerary_path, params: { city: {} }
    assert_response :success
  end

  test 'should get tours' do
    post tour_tours_path(@tour), params: { city: { tour_id: @tour.id, tour_type: "Tour", activated: [@city.id] }, commit: "Add Cities", tour_id: @tour.id }
    assert_redirected_to tour_path(@tour)
  end

  test 'should get add_city' do
    get tour_add_city_url(@tour),
        params: { city: { activated: [cities(:city_1).id, cities(:city_2).id, cities(:city_3).id] } }
    assert_response :success
  end

  test 'should get add_city 2' do
    get tour_add_city_url(@tour), params: { city: { activated: [] } }
    assert_response :success
  end

  test 'should get new' do
    get new_city_url
    assert_response :success
  end

  test 'should create city' do
    assert_difference('City.count') do
      post cities_url,
           params: { city: { admin_name: @city.admin_name, capital: @city.capital, country: @city.country, iso2: @city.iso2,
                             iso3: @city.iso3, lat: @city.lat, lng: @city.lng, name: @city.name, name_ascii: @city.name_ascii, population: @city.population, simple_map_id: @city.simple_map_id } }
    end

    assert_redirected_to city_url(City.last)
  end

  test 'should not create city' do
    assert_difference('City.count', 0) do
      post cities_url,
           params: { city: { admin_name: @city.admin_name, capital: @city.capital, country: @city.country, iso2: @city.iso2,
                             iso3: @city.iso3, lat: @city.lat, lng: @city.lng, name: '', name_ascii: @city.name_ascii, population: @city.population, simple_map_id: @city.simple_map_id } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show city' do
    get city_url(@city)
    assert_response :success
  end

  test 'should get edit' do
    get edit_city_url(@city)
    assert_response :success
  end

  test 'should update city' do
    patch city_url(@city),
          params: { city: { admin_name: @city.admin_name, capital: @city.capital, country: @city.country, iso2: @city.iso2,
                            iso3: @city.iso3, lat: @city.lat, lng: @city.lng, name: @city.name, name_ascii: @city.name_ascii, population: @city.population, simple_map_id: @city.simple_map_id } }
    assert_redirected_to city_url(@city)
  end

  test 'should not update city' do
    patch city_url(@city),
          params: { city: { admin_name: @city.admin_name, capital: @city.capital, country: @city.country, iso2: @city.iso2,
                            iso3: @city.iso3, lat: @city.lat, lng: @city.lng, name: '', name_ascii: @city.name_ascii, population: @city.population, simple_map_id: @city.simple_map_id } }
    assert_response :unprocessable_entity
  end

  test 'should destroy city' do
    assert_difference('City.count', -1) do
      delete city_url(@city)
    end

    assert_redirected_to cities_url
  end
end
  test 'should get edit' do
    get edit_city_path(@city)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_city_path
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show city TS' do
    get city_path(@city, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show city index TS' do
    get cities_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create city TS" do
    assert_difference('City.count') do
      post cities_url(format: 'turbo_stream'),
           params: { city: { admin_name: @city.admin_name, capital: @city.capital, country: @city.country, iso2: @city.iso2,
                             iso3: @city.iso3, lat: @city.lat, lng: @city.lng, name: @city.name, name_ascii: @city.name_ascii, population: @city.population, simple_map_id: @city.simple_map_id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update city TS" do
    patch  city_path(@city, format: :turbo_stream),
          params: { city: { admin_name: @city.admin_name, capital: @city.capital, country: @city.country, iso2: @city.iso2,
                            iso3: @city.iso3, lat: @city.lat, lng: @city.lng, name: @city.name, name_ascii: @city.name_ascii, population: @city.population, simple_map_id: @city.simple_map_id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @city}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy city TS" do
    assert_difference('City.count', -1) do
      delete city_url(@city, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
