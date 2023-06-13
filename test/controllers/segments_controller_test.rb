require "test_helper"

class SegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @segment = segments(:segment_1)
    @stage = @segment.stage
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test "should get index" do
    get stage_segments_url(@stage)
    assert_response :success
  end

  test "should get new" do
    get new_stage_segment_url(@stage)
    assert_response :success
  end

  test "should create segment" do
    assert_difference('Segment.count') do
      post stage_segments_url(@stage), params: { segment: { name: "Test 1", stage_id: @segment.stage_id } }
    end

    assert_redirected_to segment_url(Segment.last)
  end

  test "should not create segment" do
    assert_difference('Segment.count', 0) do
      post stage_segments_url(@stage), params: { segment: { name: "", stage_id: @segment.stage_id } }
    end

    assert_response :unprocessable_entity
    assert_template :new
  end

  test "should show segment" do
    get segment_url(@segment)
    assert_response :success
  end

  test "should get edit" do
    get edit_segment_url(@segment)
    assert_response :success
  end

  test "should update segment" do
    patch segment_url(@segment), params: { segment: { name: "Test 2", stage_id: @segment.stage_id } }
    assert_redirected_to segment_url(@segment)
  end

  test "should not update segment" do
    patch segment_url(@segment), params: { segment: { name: "", stage_id: @segment.stage_id } }

    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy segment" do
    assert_difference('Segment.count', -1) do
      delete segment_url(@segment)
    end

    assert_redirected_to stage_segments_url(@stage)
  end
end

  test 'should get edit' do
    get edit_polymorphic_path(@segment)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@stage, :segment])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show segment TS' do
    get polymorphic_path(@segment, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show segment index TS' do
    get stage_segments_url(@stage, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create segment TS" do
    assert_difference('Segment.count') do
      post stage_segments_url(@stage, format: 'turbo_stream'), params: { segment: { name: "Test 1", stage_id: @segment.stage.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update segment TS" do
    patch  segment_path(@segment, format: :turbo_stream),
            params: { segment: { name: "test 2", stage_id: @segment.stage.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @segment}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy segment TS" do
    assert_difference('Segment.count', -1) do
      delete segment_url(@segment, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
