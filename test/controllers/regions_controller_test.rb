# frozen_string_literal: true

require 'test_helper'

class RegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @region = regions(:Africa)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get regions_url
    assert_response :success
  end

  test 'should get new' do
    get new_region_url
    assert_response :success
  end

  test 'should create region' do
    assert_difference('Region.count') do
      post regions_url, params: { region: { body: @region.body, name: @region.name, user_id: @user.id } }
    end

    assert_redirected_to region_url(Region.last)
  end

  test 'should not create region' do
    assert_difference('Region.count', 0) do
      post regions_url, params: { region: { body: @region.body, name: '' } }
    end

    assert_response :success
  end

  test 'should show region' do
    get region_url(@region)
    assert_response :success
  end

  test 'should get edit' do
    get edit_region_url(@region)
    assert_response :success
  end

  test 'should update region' do
    patch region_url(@region), params: { region: { body: @region.body, name: @region.name, user_id: @user.id } }
    assert_redirected_to region_url(@region)
  end

  test 'should not update region' do
    patch region_url(@region), params: { region: { body: @region.body, name: '' } }
    assert_response :success
  end

  test 'should destroy region' do
    assert_difference('Region.count', -1) do
      delete region_url(@region)
    end

    assert_redirected_to regions_url
  end
end

  test 'should get edit' do
    get edit_region_path(@region)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_region_path
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show region TS' do
    get region_path(@region, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show region index TS' do
    get regions_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create region TS" do
    assert_difference('Region.count') do
      post regions_url(format: 'turbo_stream'), params: { region: { body: @region.body, name: @region.name, user_id: @user.id } }
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

  test "should update region TS" do
    patch  region_path(@region, format: :turbo_stream), params: { region: { body: @region.body, name: @region.name, user_id: @user.id } }

    assert_turbo_stream action: :replace, target: "#{dom_id @region}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy region TS" do
    assert_difference('Region.count', -1) do
      delete region_url(@region, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
