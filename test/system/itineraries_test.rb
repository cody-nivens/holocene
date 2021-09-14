require "application_system_test_case"

class ItinerariesTest < ApplicationSystemTestCase
  setup do
    @itinerary = itineraries(:itinerary_1)
    @tour = @itinerary.tour
    @city = @itinerary.city
    @story= @tour.story
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit tour_itineraries_url(@tour)
    assert_selector "h1", text: "Itineraries"
  end

  test "creating an Itinerary" do
    visit tour_itineraries_url(@tour)
    click_on "New Itinerary"

    fill_in "Name", with: @itinerary.name
    select @city.name, from: "City"
    fill_in "Stay", with: @itinerary.stay
    click_on "Create Itinerary"

    assert_text "Itinerary was successfully created"
    click_on "Back"
  end

  test "updating an Itinerary" do
    visit tour_itineraries_url(@tour)
    click_on "Edit", match: :first

    fill_in "Name", with: @itinerary.name
    select @city.name, from: "City"
    fill_in "Stay", with: @itinerary.stay
    click_on "Update Itinerary"

    assert_text "Itinerary was successfully updated"
    click_on "Back"
  end

  test "destroying an Itinerary" do
    visit tour_itineraries_url(@tour)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Itinerary was successfully destroyed"
  end
end
