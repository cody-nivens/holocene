require 'test_helper'

class KeyPointsFlowTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_2)
    @story = @book.stories.last
    @key_point = @story.key_points.last
    @scene = @key_point.scenes.first

    @user = users(:users_1)
    sign_in @user
  end

  test "creating a Story flow" do
    assert_difference('KeyPoint.count') do
      post polymorphic_url([@story, :key_points]), params: { key_point: { scripted_id: @story.id, scripted_type: @story.class.name, climax: @key_point.climax, first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: @key_point.hook, inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'key_points/show'

    key_point = KeyPoint.last

    assert_difference('Scene.count') do
      post polymorphic_url([@story, :scenes]), params: { scene: { key_point_id: key_point.id, situated_type: @story.class.name, situated_id: @story.id, abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, date_string: @scene.date_string },
                                                             t: { t_years: "", t_month: "", t_day: "" } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'scenes/show'
  end
end
