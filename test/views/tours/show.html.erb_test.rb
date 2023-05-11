# frozen_string_literal: true

require 'test_helper'

class ToursShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show tour' do
    get tour_path(@tour)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_tour_path(@tour)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', story_tours_path(@story)
    assert_select 'a[title=?]', 'Itinerary'
    assert_select 'a[href=?]', tour_itineraries_path(@tour)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_tour_path(@tour)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', story_tours_path(@story)

    assert_template 'tours/show'
  end
end
