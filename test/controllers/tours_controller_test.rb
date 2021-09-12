require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get story_tours_url(@story)
    assert_response :success
  end

  test "should get new" do
    get new_story_tour_url(@story)
    assert_response :success
  end

  test "should map tour" do
    get geo_map_story_tour_url(@story,@tour)
    assert_response :success
  end


  test "should create tour" do
    assert_difference('Tour.count') do
      post story_tours_url(@story), params: { tour: { name: @tour.name, story_id: @tour.story_id } }
    end

    assert_redirected_to story_tour_url(@story,Tour.last)
  end

  test "should not create tour" do
    assert_difference('Tour.count',0) do
      post story_tours_url(@story), params: { tour: { name: '', story_id: @tour.story_id } }
    end

    assert_response 422
  end

  test "should show tour" do
    get story_tour_url(@story,@tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_story_tour_url(@story,@tour)
    assert_response :success
  end

  test "should update tour" do
    patch story_tour_url(@story,@tour), params: { tour: { name: @tour.name, story_id: @tour.story_id } }
    assert_redirected_to story_tour_url(@story,@tour)
  end

  test "should not update tour" do
    patch story_tour_url(@story,@tour), params: { tour: { name: '', story_id: @tour.story_id } }
    assert_response 422
  end

  test "should destroy tour" do
    assert_difference('Tour.count', -1) do
      delete story_tour_url(@story,@tour)
    end

    assert_redirected_to story_tours_url(@story)
  end
end
