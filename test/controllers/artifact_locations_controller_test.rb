require 'test_helper'

class ArtifactLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @artifact_location = artifact_locations(:artifact_location_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get artifact_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_artifact_location_url
    assert_response :success
  end

  test "should create artifact_location" do
    assert_difference('ArtifactLocation.count') do
      post artifact_locations_url, params: { artifact_location: { artifact_id: @artifact_location.artifact_id, located_id: @artifact_location.located_id, located_type: @artifact_location.located_type } }
    end

    assert_redirected_to artifact_location_url(ArtifactLocation.last)
  end

  test "should not create artifact_location" do
    assert_difference('ArtifactLocation.count', 0) do
      post artifact_locations_url, params: { artifact_location: { artifact_id: nil, located_id: @artifact_location.located_id, located_type: @artifact_location.located_type } }
    end

    assert_response 422
  end

  test "should show artifact_location" do
    get artifact_location_url(@artifact_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_artifact_location_url(@artifact_location)
    assert_response :success
  end

  test "should update artifact_location" do
    patch artifact_location_url(@artifact_location), params: { artifact_location: { artifact_id: @artifact_location.artifact_id, located_id: @artifact_location.located_id, located_type: @artifact_location.located_type } }
    assert_redirected_to artifact_location_url(@artifact_location)
  end

  test "should not update artifact_location" do
    patch artifact_location_url(@artifact_location), params: { artifact_location: { artifact_id: nil, located_id: @artifact_location.located_id, located_type: @artifact_location.located_type } }
    assert_response 422
  end

  test "should destroy artifact_location" do
    assert_difference('ArtifactLocation.count', -1) do
      delete artifact_location_url(@artifact_location)
    end

    assert_redirected_to artifact_locations_url
  end
end
