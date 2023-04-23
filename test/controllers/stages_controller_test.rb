require "test_helper"

class StagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage = stages(:stage_1)
    @act = @stage.act
    @book = @act.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get act_stages_url(@act)
    assert_response :success
  end

  test "should get new" do
    get new_act_stage_url(@act)
    assert_response :success
  end

  test "should create stage" do
    assert_difference('Stage.count') do
      post act_stages_url(@act), params: { stage: { name: @stage.name, act_id: @act.id } }
    end

    assert_redirected_to stage_url(Stage.last)
  end

  test "should show stage" do
    get stage_url(@stage)
    assert_response :success
  end

  test "should get edit" do
    get edit_stage_url(@stage)
    assert_response :success
  end

  test "should update stage" do
    patch stage_url(@stage), params: { stage: { name: @stage.name } }
    assert_redirected_to stage_url(@stage)
  end

  test "should destroy stage" do
    assert_difference('Stage.count', -1) do
      delete stage_url(@stage)
    end

    assert_redirected_to act_stages_url(@act)
  end
end
