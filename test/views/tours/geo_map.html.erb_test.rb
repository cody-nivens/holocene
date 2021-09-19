# frozen_string_literal: true

require 'test_helper'

class ToursGeoMapHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get geo_map' do
    get geo_map_tour_url(@tour)

    assert_response 200

    assert_template 'tours/geo_map'

    # assert_select 'h1','Map'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
