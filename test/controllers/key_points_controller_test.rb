require 'test_helper'

class KeyPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@scripted, 'key_points'])
    assert_response :success
  end

  test "should get new" do
    get new_polymorphic_url(@scripted)
    assert_response :success
  end

  test "should create key_point" do
    assert_difference('KeyPoint.count') do
      post polymorphic_url([@scripted, 'key_points']), params: { key_point: { scripted_id: @scripted.id, scripted_type: @scripted.class.name, climax: @key_point.climax, first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: @key_point.hook, inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    end

    assert_redirected_to polymorphic_url([@scripted, KeyPoint.last])
  end

  test "should not create key_point" do
    assert_difference('KeyPoint.count', 0) do
      post polymorphic_url([@scripted, 'key_points']), params: { key_point: { scripted_id: @scripted.id, scripted_type: @scripted.class.name, climax: @key_point.climax, first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: "", inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    end

    assert_response :success
  end

  test "should show key_point" do
    get polymorphic_url([@scripted, @key_point])
    assert_response :success
  end

  test "should get edit" do
    get edit_polymorphic_url([@scripted, @key_point])
    assert_response :success
  end

  test "should update key_point" do
    patch polymorphic_url([@scripted, @key_point]), params: { key_point: { climax: "Climax", first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: @key_point.hook, inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    assert_redirected_to polymorphic_url([@scripted, @key_point])
  end

  test "should not update key_point" do
    patch polymorphic_url([@scripted, @key_point]), params: { key_point: { climax: "Climax", first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: "", inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    assert_response :success
  end

  test "should destroy key_point" do
    assert_difference('KeyPoint.count', -1) do
      delete polymorphic_url([@scripted, @key_point])
    end

    assert_redirected_to polymorphic_url([@scripted, 'key_points'])
  end
end
