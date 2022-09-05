# frozen_string_literal: true

require 'application_system_test_case'

class ItinerariesTest < ApplicationSystemTestCase
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour
    @city = @itinerary.city
    @story = @tour.story
    @user = users(:users_1)
    sign_in @user
  end

  test 'itineraries edit' do
    visit edit_itinerary_url(@itinerary)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path itinerary_path(@itinerary)
    click_on 'Back'
    assert_link 'Itinerary'
    assert_current_path tour_path(@tour)
  end

  test 'itineraries index' do
    visit tour_itineraries_url(@tour)
#    visit New Itinerary
    assert_link 'New Itinerary'
    click_on 'New Itinerary'
    assert_no_link 'New Itinerary'
    assert_current_path new_tour_itinerary_path(@tour)
    click_on 'Back'
    assert_link 'New Itinerary'
    assert_current_path tour_itineraries_path(@tour)
  end

  test 'itineraries show' do
    visit itinerary_url(@itinerary)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_itinerary_path(@itinerary)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path itinerary_path(@itinerary)
  end

  test 'visiting the index' do
    visit tour_itineraries_url(@tour)
    assert_selector 'h2', text: 'Itineraries'
  end

  test 'creating an Itinerary' do
    visit tour_itineraries_url(@tour)
    click_on 'New Itinerary'
    assert_text 'New Itinerary'

    fill_in 'Name', with: @itinerary.name
    select @city.name, from: 'City'
    fill_in 'Stay', with: @itinerary.stay
    click_on 'Create Itinerary'

    assert_text 'Itinerary was successfully created'
    click_on 'Back'
  end

  test 'updating an Itinerary' do
    visit tour_itineraries_url(@tour)
    click_on 'Edit', match: :first
    assert_text 'Editing Itinerary'

    fill_in 'Name', with: @itinerary.name
    select @city.name, from: 'City'
    fill_in 'Stay', with: @itinerary.stay
    click_on 'Update Itinerary'

    assert_text 'Itinerary was successfully updated'
    click_on 'Back'
  end

  test 'destroying an Itinerary' do
    visit tour_itineraries_url(@tour)
    accept_confirm do
      click_on 'Destroy', match: :first
      page.driver.browser.switch_to.alert.accept
    end

    assert_text 'Itinerary was successfully destroyed'
  end
end
