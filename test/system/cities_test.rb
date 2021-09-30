# frozen_string_literal: true

require 'application_system_test_case'

class CitiesTest < ApplicationSystemTestCase
  setup do
    @city = cities(:city_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'cities edit' do
    visit edit_city_url(@city)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_text 'Name ascii:'
    assert_current_path city_path(@city)
    click_on 'Back'
    assert_link 'New City'
    assert_current_path cities_path
  end

  test 'cities index' do
    visit cities_url
#    visit New City
    assert_link 'New City'
    click_on 'New City'
    assert_no_link 'New City'
    assert_current_path new_city_path
    click_on 'Back'
    assert_link 'New City'
    assert_current_path cities_path
  end

  test 'cities show' do
    visit city_url(@city)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_city_path(@city)
    click_on 'Back'
    assert_link 'New City'
    assert_current_path cities_path
  end

  test 'visiting the index' do
    visit cities_url

    assert_text 'Name LIKE'
    assert_text 'Tokyo'
    assert_text 'Delhi'

    fill_in 'Name LIKE', with: 'to'
    click_on 'Search'

    assert_no_text 'Delhi'
    assert_text 'Tokyo'
  end

  test 'visiting the index 2' do
    visit cities_url

    assert_text 'Name LIKE'
    assert_text 'Tokyo'
    assert_text 'Delhi'

    fill_in 'Lat Near', with: '14.6'
    click_on 'Search'

    assert_no_text 'Bejing'
    assert_text 'Manila'
  end

  test 'visiting the index 3' do
    visit cities_url

    assert_text 'Name LIKE'
    assert_text 'Tokyo'
    assert_text 'Delhi'

    fill_in 'Population', with: '25000000'
    click_on 'Search'

    assert_no_text 'Bejing'
    assert_text 'Jakarta'
  end

  test 'creating a City' do
    visit cities_url
    click_on 'New City'

    fill_in 'Admin name', with: @city.admin_name
    fill_in 'Capital', with: @city.capital
    select @city.country, from: 'Country'
    fill_in 'Iso2', with: @city.iso2
    fill_in 'Iso3', with: @city.iso3
    fill_in 'Lat', with: @city.lat
    fill_in 'Lng', with: @city.lng
    fill_in 'city_name', with: @city.name
    fill_in 'Name ascii', with: @city.name_ascii
    fill_in 'Population', with: @city.population
    fill_in 'Simple map', with: @city.simple_map_id
    click_on 'Create City'

    assert_text 'City was successfully created'
    click_on 'Back'
  end

  test 'updating a City' do
    visit cities_url
    click_on 'Edit', match: :first

    fill_in 'Admin name', with: @city.admin_name
    fill_in 'Capital', with: @city.capital
    select @city.country, from: 'Country'
    fill_in 'Iso2', with: @city.iso2
    fill_in 'Iso3', with: @city.iso3
    fill_in 'Lat', with: @city.lat
    fill_in 'Lng', with: @city.lng
    fill_in 'city_name', with: @city.name
    fill_in 'Name ascii', with: @city.name_ascii
    fill_in 'Population', with: @city.population
    fill_in 'Simple map', with: @city.simple_map_id
    click_on 'Update City'

    assert_text 'City was successfully updated'
    click_on 'Back'
  end

  test 'destroying a City' do
    visit cities_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'City was successfully destroyed'
  end
end
