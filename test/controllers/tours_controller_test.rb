# frozen_string_literal: true

require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get story_tours_url(@story)
    assert_response :success
  end

  test 'should get new' do
    get new_story_tour_url(@story)
    assert_response :success
  end

  test 'should map tour' do
    get geo_map_tour_url(@tour)
    assert_response :success
  end

  test 'should create tour' do
    assert_difference('Tour.count') do
      post story_tours_url(@story),
        params: { tour: { name: @tour.name, story_id: @tour.story_id } }
    end

    assert_redirected_to tour_url(Tour.last)
  end

  test 'should not create tour' do
    assert_difference('Tour.count', 0) do
      post story_tours_url(@story), params: { tour: { name: '', story_id: @tour.story_id } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show tour' do
    get tour_url(@tour)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tour_url(@tour)
    assert_response :success
  end

  test 'should update tour' do
    patch tour_url(@tour), params: { tour: { name: @tour.name, story_id: @tour.story_id } }
    assert_redirected_to tour_url(@tour)
  end

  test 'should not update tour' do
    patch tour_url(@tour), params: { tour: { name: '', story_id: @tour.story_id } }
    assert_response :unprocessable_entity
  end

  test 'should destroy tour' do
    assert_difference('Tour.count', -1) do
      delete tour_url(@tour)
    end

    assert_redirected_to story_tours_url(@story)
  end
end
  test 'should get edit' do
    get edit_tour_path(@tour)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_story_tour_path(@story)
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show tour TS' do
    get tour_path(@tour, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show tour index TS' do
    get story_tours_url(@story, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create tour TS" do
    assert_difference('Tour.count') do
      post story_tours_url(@story, format: 'turbo_stream'),
        params: { tour: { name: "Test 1", story_id: @tour.story.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update tour TS" do
    patch  tour_path(@tour, format: :turbo_stream),
            params: { tour: { name: @tour.name, story_id: @tour.story.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @tour}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy tour TS" do
    assert_difference('Tour.count', -1) do
      delete tour_url(@tour, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
