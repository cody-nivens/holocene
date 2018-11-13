require 'test_helper'

class EpochsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get epochs_url
    assert_response :success
  end

  test "should get new" do
    get new_epoch_url
    assert_response :success
  end

  test "should create epoch" do
    assert_difference('Epoch.count') do
      post epochs_url, params: { epoch: { end_date: @epoch.end_date, name: @epoch.name, start_date: @epoch.start_date, user_id: @user.id } }
    end

    assert_redirected_to epoch_url(Epoch.last)
  end

  test "should not create epoch" do
    assert_difference('Epoch.count', 0) do
        post epochs_url, params: { epoch: { end_date: @epoch.end_date, name: "", start_date: @epoch.start_date, user_id: @user.id } }
    end

    assert_response :success
  end

  test "should show epoch" do
    get epoch_url(@epoch)
    assert_response :success
  end

  test "should get edit" do
    get edit_epoch_url(@epoch)
    assert_response :success
  end

  test "should update epoch" do
      patch epoch_url(@epoch), params: { epoch: { end_date: @epoch.end_date, name: @epoch.name, start_date: @epoch.start_date, user_id: @user.id } }
    assert_redirected_to epoch_url(@epoch)
  end

  test "should not update epoch" do
      patch epoch_url(@epoch), params: { epoch: { end_date: @epoch.end_date, name: "", start_date: @epoch.start_date, user_id: @user.id } }
    assert_response :success
  end

  test "should destroy epoch" do
    assert_difference('Epoch.count', -1) do
      delete epoch_url(@epoch)
    end

    assert_redirected_to epochs_url
  end
end
