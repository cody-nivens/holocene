# frozen_string_literal: true

require 'application_system_test_case'

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story
    @city_1 = cities(:city_1)
    @city_2 = cities(:city_2)
    @city_3 = cities(:city_3)

    @user = users(:users_1)
    sign_in @user
  end

  test "drive the tour cycle" do
    menu_test('Story', 'Tours')
  end

  test "drive the itinerary cycle" do
    setup_menu_page 'Story', 'Tours'
    assert_link "Mr. Toad's Wild Ride"
    click_on "Mr. Toad's Wild Ride"

    assert_current_path root_url
    assert_no_text "Content missing"

    assert_link "Add City"
    click_on "Add City"

    assert_current_path root_url
    assert_no_text "Content missing"

    assert_text 'Beijing'
    check_line_with 'Beijing'
    assert_button 'Add Cities'
    click_on 'Add Cities'

    assert_current_path root_url
    assert_no_text "Content missing"

    assert_link "Add City"
    assert_text "Mr. Toad's Wild Ride"
    assert_link 'Beijing'
    click_on 'Beijing'

    assert_current_path root_url
    assert_no_text "Content missing"

    assert_text 'Stay:'
    assert_side 'edit', 'Itineraries', 'edit'
    click_side 'edit'

    assert_button 'Update Itinerary'
    click_on 'Update Itinerary'

    assert_text 'Itinerary was successfully updated'
    assert_no_button 'Update Itinerary'

    assert_side 'backward', 'Itineraries', 'backward'
    click_side 'backward'

    assert_text 'Name LIKE'
    assert_text 'Beijing'

    click_on_line 'Beijing', 'edit'
    assert_button 'Update Itinerary'

    assert_new 'backward', 'Itineraries', 'backward'
    click_new 'backward'
    assert_no_button 'Update Itinerary'

    assert_text 'Name LIKE'

    accept_alert do
      click_on_line 'Beijing', 'trash'
    end
    assert_text 'Itinerary was successfully destroyed'
    assert_no_text 'Beijing'

    assert_side 'backward', 'Tour', 'backward'
    click_side 'backward'
    assert_no_button 'Shushi is rice'
  end

  test 'tours show map' do
#    visit Map
    visit root_url
    setup_menu_page 'Story', 'Tours'
    assert_link "Mr. Toad's Wild Ride"
    click_on "Mr. Toad's Wild Ride"

    assert_current_path root_url
    assert_no_text "Content missing"

    assert_side 'map', 'Tour', 'map'
    click_side 'map'
    assert_selector '#world-map'
    assert_current_path root_url
    assert_side 'backward', 'Tour', 'backward'
    click_side 'backward'
    assert_link 'Itinerary'
    assert_current_path root_url
    assert_no_text "Content missing"
  end

  test 'search itenerary' do
    visit root_url
    setup_menu_page 'Story', 'Tours'
    assert_link "Mr. Toad's Wild Ride"
    click_on "Mr. Toad's Wild Ride"

    assert_link "Add City"
    click_on "Add City"

    check_line_with @city_3.name
    click_button 'Add Cities'

    assert_text 'Delhi'
    #assert_side 'backward', 'Itinerary', 'backward'
    #click_side 'backward'
    assert_text 'Name LIKE'

    assert_current_path root_url
    assert_no_text "Content missing"

    fill_in 'Name LIKE', with: 'delhi'
    click_button 'Search'

    click_link 'Delhi'

    click_side 'backward'

    click_side 'backward'
  end

end
