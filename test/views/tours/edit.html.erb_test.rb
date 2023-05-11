# frozen_string_literal: true

require 'test_helper'

class ToursEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_tour_url(@tour)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', tour_path(@tour)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', story_tours_path(@story)
    assert_template 'tours/edit'
  end
end
