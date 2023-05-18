# frozen_string_literal: true

require 'test_helper'

class SignetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @signet = signets(:signet_1)
    @chapter = chapters(:chapter_1)
    @chapter_sig = signets(:signet_2)
    @book_sig = signets(:signet_4)
    @section_sig = signets(:signet_3)
    @holocene_event_sig = signets(:signet_5)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get signets_url(chapter_id: @chapter.id)
    assert_response :success
  end

  test 'should get index 2' do
    get book_signets_url(@book)
    assert_response :success
  end

  test 'should get new' do
    get new_chapter_signet_url(chapter_id: @chapter.id)
    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["target"], "edit-signet"
        assert_equal element["id"], "new_signets"
      end
    end
    assert_response :success
  end

  test 'should create signet' do
    assert_difference('Signet.count') do
      post signets_url,
           params: { chapter_id: @chapter.id,
                     signet: { color: @signet.color, message: @signet.message, sigged_id: @signet.sigged_id,
                               sigged_type: @signet.sigged_type } }
    end

    assert_response :success
  end

  test 'should not create signet' do
    assert_difference('Signet.count', 0) do
      post signets_url,
           params: { chapter_id: @chapter.id,
                     signet: { color: @signet.color, message: '', sigged_id: @signet.sigged_id,
                               sigged_type: @signet.sigged_type } }
    end

    assert_response :success
  end

  test 'should show signet' do
    get signet_url(chapter_id: @chapter.id, id: @signet.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_signet_url(chapter_id: @chapter.id, id: @signet.id)
    assert_select "turbo-frame" do |elements|
      debugger if elements.length > 1
      elements.each do |element|
        assert_equal element["id"], (dom_id @signet)
      end
    end
    assert_response :success
  end

  test 'should update signet' do
    patch signet_url(@signet),
          params: { chapter_id: @chapter.id,
                    signet: { color: @signet.color, message: @signet.message, sigged_id: @signet.sigged_id,
                              sigged_type: @signet.sigged_type } }
    assert_response :success
  end

  test 'should not update signet' do
    patch signet_url(@signet),
          params: { chapter_id: @chapter.id,
                    signet: { color: @signet.color, message: '', sigged_id: @signet.sigged_id,
                              sigged_type: @signet.sigged_type } }
    assert_response :success
  end

  test 'should destroy signet' do
    assert_difference('Signet.count', -1) do
      delete signet_url(chapter_id: @chapter.id, id: @signet.id)
    end

    assert_redirected_to polymorphic_url([@chapter, :signets])
  end



  test "should show signet TS" do
    get signet_url(@signet, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "#{dom_id @signet}"
    assert_response :success
  end

  test "should create signet TS" do
    assert_difference('Signet.count') do
      post signets_url(format: :turbo_stream),
           params: { chapter_id: @chapter.id,
                     signet: { color: @signet.color, message: @signet.message, sigged_id: @signet.sigged_id,
                               sigged_type: @signet.sigged_type } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_signets"
    assert_turbo_stream action: :replace, target: "edit_signets"
    assert_turbo_stream action: :replace, target: "signets"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update signet TS" do
    patch signet_url(@signet, format: :turbo_stream),
          params: { chapter_id: @chapter.id,
                    signet: { color: @signet.color, message: @signet.message, sigged_id: @signet.sigged_id,
                              sigged_type: @signet.sigged_type } }
    label = dom_id @signet
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @signet}"
    assert_response :success
  end

  test "should destroy signet TS" do
    assert_difference('Signet.count', -1) do
      delete signet_url(@signet, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "signets"
    assert_response :success
  end

end
