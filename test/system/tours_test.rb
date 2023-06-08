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
    drive_cycle('Story', 'Tours')
  end

  if 1 == 0
  test 'tours edit' do
    visit edit_tour_url(@tour)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path tour_path(@tour)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path story_tours_path(@story)
  end

  test 'tours index' do
    visit story_tours_url(@story)
#    visit New Tour
    assert_link 'New Tour'
    click_on 'New Tour'
    assert_no_link 'New Tour'
    assert_current_path new_story_tour_path(@story)
    click_on 'Back'
    assert_link 'New Tour'
    assert_current_path story_tours_path(@story)
  end

  test 'tours show edit' do
    visit tour_url(@tour)
#    visit Edit
    assert_link 'Edit'
    within ".footer" do
      click_on 'Edit'
    end
    assert_link 'Show'
    assert_current_path edit_tour_path(@tour)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path tour_path(@tour)
  end

  test 'tours show itinerary' do
#    visit Itinerary
    visit tour_url(@tour)
    assert_link 'Itinerary'
    click_on 'Itinerary'
    assert_link 'New Itinerary'
    assert_current_path tour_itineraries_path(@tour)
    click_on 'Back'
    assert_link 'Add City'
    assert_current_path tour_path(@tour)
  end

  test 'tours show map' do
#    visit Map
    visit tour_url(@tour)
    assert_link 'Map'
    click_on 'Map'
    assert_selector '#world-map'
    assert_current_path geo_map_tour_path(@tour)
    click_on 'Back'
    assert_link 'Itinerary'
    assert_current_path tour_path(@tour)
  end

  test 'check multiple cities' do
    visit '/'
    click_link 'Books'
    click_link 'The Phantom'
    click_link 'The Beginnings'
    click_link 'Tours'
    click_link 'New Tour'

    fill_in 'Name', with: 'The Second Voyage'
    click_button 'Create Tour'

    assert_no_text @city_1.name

    click_link 'Add City'

    find(:css, "#city_activated_[value='#{@city_1.id}']").set(true)
    find(:css, "#city_activated_[value='#{@city_2.id}']").set(true)
    find(:css, "#city_activated_[value='#{@city_3.id}']").set(true)
    click_button 'Add Cities'
    assert_text @city_1.name
  end

  test 'visit itinerary page' do
    visit '/'
    click_link 'Books'
    click_link 'The Phantom'
    click_link 'The Beginnings'
    click_link 'Tours'
    click_link 'Show'
    click_link 'Sushi is Rice'
  end

  test 'search itenerary' do
    visit '/'
    click_link 'Books'
    click_link 'The Phantom'
    click_link 'The Endings'
    click_link 'Tours'
    click_link 'Show'
    click_link 'Add City'

    find(:css, "#city_activated_[value='#{@city_3.id}']").set(true)

    click_button 'Add Cities'

    fill_in 'Name LIKE', with: 'delhi'
    click_button 'Search'

    click_link 'Delhi'

    click_link 'Back'

    click_link 'Back'
  end

  test 'visiting the index' do
    visit story_tours_url(@story)
    assert_selector 'h2', text: 'Tours'
  end

  test 'creating a Tour' do
    visit story_tours_url(@story)
    click_on 'New Tour'

    fill_in 'Name', with: @tour.name
    click_on 'Create Tour'

    assert_text 'Tour was successfully created'
    click_on 'Back'
  end

  test 'updating a Tour' do
    visit story_tours_url(@story)
    click_on 'Edit', match: :first

    fill_in 'Name', with: @tour.name
    click_on 'Update Tour'

    assert_text 'Tour was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Tour' do
    visit story_tours_url(@story)
    accept_confirm do
      click_on 'Destroy', match: :first
      page.driver.browser.switch_to.alert.accept
    end

    assert_text 'Tour was successfully destroyed'
  end
end
end
