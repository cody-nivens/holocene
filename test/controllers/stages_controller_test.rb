require "test_helper"

class StagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage = stages(:stage_1)
    @act = @stage.act
    @book = @act.book
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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

  test "should list stage" do
    get stage_list_url(@stage)
    assert_response :success
  end

  test "should show time by location" do
    get stage_time_by_location_url(@stage)
    assert_response :success
  end

  test "should show time by actor" do
    get stage_time_by_actor_url(@stage)
    assert_response :success
  end

  test "should show actor by location" do
    get stage_actor_by_location_url(@stage)
    assert_response :success
  end

  test "should show scenes" do
    get stage_scenes_url(@stage)
    assert_response :success
  end

    test 'should check scene' do

    get stage_check_path(id: @stage.id), xhr: true,
                                               params: { check: true, op: 'actors' }
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
  test 'should get edit' do
    get edit_stage_path(@stage)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@act, :stage])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show stage TS' do
    get stage_path(@stage, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show stage index TS' do
    get act_stages_url(@act, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create stage TS" do
    assert_difference('Stage.count') do
      post act_stages_url(@act, format: 'turbo_stream'), params: { stage: { name: "Test 1", act_id: @stage.act.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update stage TS" do
    patch  stage_path(@stage, format: :turbo_stream),
            params: { stage: { name: @stage.name, act_id: @stage.act.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @stage}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy stage TS" do
    assert_difference('Stage.count', -1) do
      delete stage_url(@stage, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end

