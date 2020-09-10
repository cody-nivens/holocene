require 'test_helper'

class ScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_scenes_url(:book_id => @book.id)
    assert_response :success
  end

  test "should get new" do
    get new_book_scene_url(:book_id => @book.id)
    assert_response :success
  end

  test "should create scene" do
    assert_difference('Scene.count') do
      post book_scenes_url(:book_id => @book.id), params: { scene: { book_id: @book.id, abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, time: @scene.time } }
    end

    assert_redirected_to book_scene_url(:book_id => @book.id, :id => Scene.last.id)
  end

  test "should not create scene" do
    assert_difference('Scene.count', 0) do
      post book_scenes_url(:book_id => @book.id), params: { scene: { book_id: @book.id, abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, time: "" } }
    end

    assert_response :success
  end

  test "should show scene" do
    get book_scene_url(:book_id => @book.id, :id => @scene.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_scene_url(:book_id => @book.id, :id => @scene.id)
    assert_response :success
  end

  test "should update scene" do
    patch book_scene_url(:book_id => @book.id, :id => @scene.id), params: { scene: { abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, time: @scene.time } }
    assert_redirected_to book_scene_url(:book_id => @book.id, :id => @scene.id)
  end

  test "should not update scene" do
    patch book_scene_url(:book_id => @book.id, :id => @scene.id), params: { scene: { abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, time: "" } }
    assert_response :success
  end

  test "should destroy scene" do
    assert_difference('Scene.count', -1) do
      delete book_scene_url(:book_id => @book.id, :id => @scene.id)
    end

    assert_redirected_to book_scenes_url(:book_id => @book.id)
  end
end
