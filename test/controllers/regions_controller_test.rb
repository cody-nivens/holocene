require 'test_helper'

class RegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @region = regions(:Africa)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get regions_url
    assert_response :success
  end

  test "should get new" do
    get new_region_url
    assert_response :success
  end

  test "should create region" do
    assert_difference('Region.count') do
        post regions_url, params: { region: { body: @region.body, name: @region.name, user_id: @user.id } }
    end

    assert_redirected_to region_url(Region.last)
  end

  test "should not create region" do
    assert_difference('Region.count', 0) do
      post regions_url, params: { region: { body: @region.body, name: ""} }
    end

    assert_response :success
  end

  test "should show region" do
    get region_url(@region)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_region_path(@region)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", regions_path
    assert_select ".footer>div>a", 2
  end

  test "should get edit" do
    get edit_region_url(@region)
    assert_response :success
  end

  test "should update region" do
    patch region_url(@region), params: { region: { body: @region.body, name: @region.name, user_id: @user.id } }
    assert_redirected_to region_url(@region)
  end

  test "should not update region" do
    patch region_url(@region), params: { region: { body: @region.body, name: ""} }
    assert_response :success
  end

  test "should destroy region" do
    assert_difference('Region.count', -1) do
      delete region_url(@region)
    end

    assert_redirected_to regions_url
  end
end
