# frozen_string_literal: true

require 'test_helper'

class EpochsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:epoch_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get epochs_url
    assert_response :success
  end

  test 'should get new' do
    get new_epoch_url
    assert_response :success
  end

  test 'should show epoch timeline' do
    get epoch_timeline_url(epoch_id: @epoch.id)
    assert_response :success
  end

  test 'should create epoch' do
    assert_difference('Epoch.count') do
      post epochs_url,
           params: { epoch: { end_date: @epoch.end_date, name: @epoch.name, start_date: @epoch.start_date,
                              user_id: @user.id } }
    end

    assert_redirected_to epoch_url(Epoch.last)
  end

  test 'should not create epoch' do
    assert_difference('Epoch.count', 0) do
      post epochs_url,
           params: { epoch: { end_date: @epoch.end_date, name: '', start_date: @epoch.start_date, user_id: @user.id } }
    end

    assert_response :success
  end

  test 'should show epoch' do
    get epoch_url(@epoch)
    assert_response :success
  end

  test 'should map epoch' do
    get geo_map_epoch_url(@epoch)
    assert_response :success
  end

  test 'should get edit' do
    get edit_epoch_url(@epoch)
    assert_response :success
  end

  test 'should update epoch' do
    patch epoch_url(@epoch),
          params: { epoch: { end_date: @epoch.end_date, name: @epoch.name, start_date: @epoch.start_date,
                             user_id: @user.id } }
    assert_redirected_to epoch_url(@epoch)
  end

  test 'should not update epoch' do
    patch epoch_url(@epoch),
          params: { epoch: { end_date: @epoch.end_date, name: '', start_date: @epoch.start_date, user_id: @user.id } }
    assert_response :success
  end

  test 'should destroy epoch' do
    assert_difference('Epoch.count', -1) do
      delete epoch_url(@epoch)
    end

    assert_redirected_to epochs_url
  end
end

  test 'should get edit' do
    get edit_epoch_path(@epoch)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_epoch_path
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show epoch TS' do
    get epoch_path(@epoch, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show epoch index TS' do
    get epochs_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create epoch TS" do
    assert_difference('Epoch.count') do
      post epochs_url(format: 'turbo_stream'),
           params: { epoch: { end_date: @epoch.end_date, name: @epoch.name, start_date: @epoch.start_date,
                              user_id: @user.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update epoch TS" do
    patch  epoch_path(@epoch, format: :turbo_stream),
          params: { epoch: { end_date: @epoch.end_date, name: @epoch.name, start_date: @epoch.start_date,
                             user_id: @user.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @epoch}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy epoch TS" do
    assert_difference('Epoch.count', -1) do
      delete epoch_url(@epoch, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
