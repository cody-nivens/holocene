# frozen_string_literal: true

require 'test_helper'

class EventTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:Impact)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get event_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_type_url
    assert_response :success
  end

  test 'should show event_type timeline' do
    get event_type_timeline_url(event_type_id: @event_type.id)
    assert_response :success
  end

  test 'should create event_type' do
    assert_difference('EventType.count') do
      post event_types_url,
           params: { event_type: { body: @event_type.body, name: @event_type.name, user_id: @user.id } }
    end

    assert_redirected_to event_type_url(EventType.last)
  end

  test 'should not create event_type' do
    assert_difference('EventType.count', 0) do
      post event_types_url, params: { event_type: { body: @event_type.body, name: '', user_id: @user.id } }
    end

    assert_response :success
  end

  test 'should show event_type' do
    get event_type_url(@event_type)
    assert_response :success
  end

  test 'should map event_type' do
    get geo_map_event_type_url(@event_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_type_url(@event_type)
    assert_response :success
  end

  test 'should update event_type' do
    patch event_type_url(@event_type),
          params: { event_type: { body: @event_type.body, name: @event_type.name, user_id: @user.id } }
    assert_redirected_to event_type_url(@event_type)
  end

  test 'should not update event_type' do
    patch event_type_url(@event_type), params: { event_type: { body: @event_type.body, name: '', user_id: @user.id } }
    assert_response :success
  end

  test 'should destroy event_type' do
    assert_difference('EventType.count', -1) do
      delete event_type_url(@event_type)
    end

    assert_redirected_to event_types_url
  end
end

  test 'should get edit' do
    get edit_event_type_path(@event_type)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_event_type_path
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show event_type TS' do
    get event_type_path(@event_type, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show event_type index TS' do
    get event_types_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create event_type TS" do
    assert_difference('EventType.count') do
      post event_types_url(format: :turbo_stream),
           params: { event_type: { body: @event_type.body, name: @event_type.name, user_id: @user.id } }
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

  test "should update event_type TS" do
    patch  event_type_path(@event_type, format: :turbo_stream),
            params: { event_type: { name: @event_type.name } }
    assert_turbo_stream action: :replace, target: "#{dom_id @event_type}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy event_type TS" do
    assert_difference('EventType.count', -1) do
      delete event_type_url(@event_type, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
