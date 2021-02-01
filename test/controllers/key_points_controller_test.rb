require 'test_helper'

class KeyPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @key_point_2 = key_points(:key_point_3)
    @key_point_4 = key_points(:key_point_4)
    @scripted = @key_point.scripted
    @scene_2 = scenes(:scene_2)
    @scene_3 = scenes(:scene_3)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@scripted, 'key_points'])
    assert_response :success
  end

  test "should get list" do
    get polymorphic_url([@scripted, @key_point, 'list']), params: { selector: 1 }
    assert_response :success
  end

  test "should add key_points" do
    assert_difference('KeyPoint.count', 0) do
      post polymorphic_url([@scripted, @key_point, 'add']), params: { scenes_ids: [ ], scenes_avail: [ ],
                                                                     selector: 1, "#{@scripted.class.name.underscore}_id" => @scripted.id }
    end
    assert_redirected_to polymorphic_url([@scripted, 'key_point_list'])
  end

  test "should add key_points II" do
    assert_difference('@key_point.scenes.where(selector: 1).count') do
      post polymorphic_url([@scripted, @key_point, 'add']), params: { scenes_ids: [ ], scenes_avail: [ @scene_3.id ],
                                                                     selector: 1, "#{@scripted.class.name.underscore}_id" => @scripted.id }
    end
    assert_redirected_to polymorphic_url([@scripted, 'key_point_list'])
  end

  test "should add key_points III" do
    assert_difference('@key_point.scenes.where(selector: 1).count', -1) do
      post polymorphic_url([@scripted, @key_point, 'add']), params: { scenes_ids: [ @scene_2.id ], scenes_avail: [ ],
                                                                     selector: 1, "#{@scripted.class.name.underscore}_id" => @scripted.id }
    end
    assert_redirected_to polymorphic_url([@scripted, 'key_point_list'])
  end

  test "should get new" do
    get new_polymorphic_url([@scripted, KeyPoint])
    assert_response :success

    assert_select "h1", text: "New Key Point"
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

  test "should show key_point 2" do
    get polymorphic_url([@scripted, @key_point_1])
    assert_response :success
  end

  test "should show key_point 3" do
    get polymorphic_url([@scripted, @key_point_4])
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
