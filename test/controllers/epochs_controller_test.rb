require 'test_helper'

class EpochsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:epoch_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get epochs_url
    assert_response :success

    assert_select "a[text()=?]",'New Epoch'
    assert_select "a[href=?]", new_epoch_path
    assert_select ".footer>div>a", 1
  end

  test "should get new" do
    get new_epoch_url
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", epochs_path
    assert_select ".footer>div>a", 1
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

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_epoch_path(@epoch)
    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", epoch_timeline_path(@epoch)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_epoch_path(@epoch)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", epochs_path
    assert_select ".footer>div>a", 4
  end

  test "should map epoch" do
    get geo_map_epoch_url(@epoch)
    assert_response :success

    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", epoch_timeline_path(@epoch)
    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", epoch_display_path(@epoch)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", epochs_path
    assert_select ".footer>div>a", 3
  end

  test "should get edit" do
    get edit_epoch_url(@epoch)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", epoch_path(@epoch)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", epochs_path
    assert_select ".footer>div>a", 2
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
