require 'test_helper'

class SignetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signet = signets(:signet_1)
    @chapter = chapters(:chapter_1)
    @chapter_sig = signets(:signet_2)
    @book_sig = signets(:signet_4)
    @section_sig = signets(:signet_3)
    @holocene_event_sig = signets(:signet_5)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get signets_url(:chapter_id => @chapter.id)
    assert_response :success
  end

  test "should get new" do
    get new_chapter_signet_url(:chapter_id => @chapter.id)
    assert_response :success
  end

  test "should create signet" do
    assert_difference('Signet.count') do
      post signets_url, params: { signet: { color: @signet.color, message: @signet.message, sigged_id: @signet.sigged_id, sigged_type: @signet.sigged_type } }
    end

    assert_redirected_to signet_url(Signet.last)
  end

  test "should not create signet" do
    assert_difference('Signet.count',0) do
      post signets_url, params: { signet: { color: @signet.color, message: "", sigged_id: @signet.sigged_id, sigged_type: @signet.sigged_type } }
    end

    assert_response :success
  end

  test "should show signet" do
    get signet_url(@signet)
    assert_response :success
  end

  test "should get edit" do
    get edit_signet_url(@signet)
    assert_response :success
  end

  test "should update signet" do
    patch signet_url(@signet), params: { signet: { color: @signet.color, message: @signet.message, sigged_id: @signet.sigged_id, sigged_type: @signet.sigged_type } }
    assert_redirected_to signet_url(@signet)
  end

  test "should not update signet" do
    patch signet_url(@signet), params: { signet: { color: @signet.color, message: "", sigged_id: @signet.sigged_id, sigged_type: @signet.sigged_type } }
    assert_response :success
  end

  test "should destroy signet" do
    [@signet, @chapter_sig, @section_sig, @book_sig, @holocene_event_sig].each do |obj|
    assert_difference('Signet.count', -1) do
      delete signet_url(obj)
    end

    case obj.class.name
    when "Chapter"
    assert_redirected_to chapter_signets_url(obj)
    when "Section"
    assert_redirected_to section_signets_url(obj)
    when "Book"
    assert_redirected_to book_signets_url(obj)
    when "HoloceneEvent"
    assert_redirected_to holocene_event_signets_url(obj)
    end 
  end
  end
end
