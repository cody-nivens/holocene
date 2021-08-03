require 'test_helper'

class ScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @scene_2 = scenes(:scene_2)
    @scene_3 = scenes(:scene_3)
    @scene_6 = scenes(:scene_6)

    @book = books(:book_1)
    @book_2 = books(:book_2)

    @key_point = @scene.key_point
    @key_point_2 = key_points(:key_point_2)

    @situated = @scene.situated
    @situated_2 = @scene_2.situated
    @situated_3 = @scene_3.situated
    @situated_6 = @scene_6.situated

    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@situated, :scenes])

    assert_response :success
  end

  test "should get move" do
    get polymorphic_url([@scene, :move])

    assert_response :success
  end

  test "should move scene" do
    [[1,2],[2,3],[3,4],[4,5],[5,6],[6,1]].each do |x,y|
      post polymorphic_url([@scene, :moved]), params: { new_key_point_id: @key_point_2.id, new_selector: y, selector: x }

      assert_response :redirect
      assert_redirected_to polymorphic_url(@scene)
    end
  end

  test "should not move scene" do
    post polymorphic_url([@scene, :moved]), params: { new_selector: 3 }

    assert_response :success
  end

  test "should get index 2" do
    get polymorphic_url([@situated, :scenes], :toggle => "on")

    assert_response :success
  end

  test "should get index 3" do
    get polymorphic_url([@book, :scenes])

    assert_response :success
  end

  test "should get index 4" do
    get polymorphic_url([@book_2, :scenes])

    assert_response :success
  end

  test "should get index 5" do
    get polymorphic_url([@situated_2, :scenes])

    assert_response :success
  end

  test "should get new" do
    get new_polymorphic_url([@situated, :scene])

    assert_response :success
  end

  test "should create scene" do
    assert_difference('Scene.count') do
      post polymorphic_url([@situated, :scenes]), params: { scene: { key_point_id: @scene.key_point.id, situated_type: @situated.class.name, situated_id: @situated.id, abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, time: @scene.time },
                                                             t: { t_years: "", t_month: "", t_day: "" } }
    end

    assert_redirected_to polymorphic_url([@situated, Scene.last])
  end

  test "should not create scene" do
    assert_difference('Scene.count', 0) do
      post polymorphic_url([@situated, :scenes]), params: { scene: { situated_type: @situated.class.name, situated_id: @situated.id, abc: "", check: @scene.check, scene_sequel: @scene.scene_sequel, time: "" },
                                                             t: { t_years: "", t_month: "", t_day: "" } }
    end

    assert_response :success
  end

  test "should show scene" do
    get polymorphic_url([@situated, @scene])

    assert_response :success
  end

  test "should show scene 2" do
    get polymorphic_url([@situated_2, @scene_2])

    assert_response :success
  end

  test "should show scene 3" do
    get polymorphic_url([@situated_3, @scene_3])

    assert_response :success
  end

  test "should show scene 4" do
    get polymorphic_url([@situated_6, @scene_6])

    assert_response :success
  end

  test "should get edit" do
    get edit_polymorphic_url([@situated, @scene])

    assert_response :success
  end

  test "should update scene" do
    patch polymorphic_url([@situated, @scene]), params: { scene: { abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, time: @scene.time },
                                                             t: { t_years: "", t_month: "", t_day: "" } }
    assert_redirected_to polymorphic_url([@situated, @scene])
  end

  test "should not update scene" do
    patch polymorphic_url([@situated, @scene]), params: { scene: { abc: "", check: @scene.check, scene_sequel: @scene.scene_sequel, time: @scene.time },
                                                             t: { t_years: "", t_month: "", t_day: "" } }
    assert_response :success
  end

  test "should destroy scene" do
    assert_difference('Scene.count', -1) do
      delete polymorphic_url([@situated, @scene])
    end

    assert_redirected_to polymorphic_url([@situated, :scenes])
  end
end
