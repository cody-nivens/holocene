# frozen_string_literal: true

require 'test_helper'

class ArtifactTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact_type.book
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_artifact_types_url(@book)
    assert_response :success
    assert_template 'artifact_types/index'
  end

  test 'should get new' do
    get new_book_artifact_type_url(@book)
    assert_response :success
    assert_template 'artifact_types/new'
  end

  test 'should create artifact_type' do
    assert_difference('ArtifactType.count') do
      post book_artifact_types_url(@book),
           params: { artifact_type: { book_id: @artifact_type.book_id, name: @artifact_type.name } }
    end

    assert_redirected_to artifact_type_url(ArtifactType.last)
    # assert_template 'artifact_types/show'
  end

  test 'should not create artifact_type' do
    assert_difference('ArtifactType.count', 0) do
      post book_artifact_types_url(@book), params: { artifact_type: { book_id: @artifact_type.book_id, name: '' } }
    end

    assert_response 422
    assert_template 'artifact_types/new'
  end

  test 'should show artifact_type' do
    get artifact_type_url(@artifact_type)
    assert_response :success
    assert_template 'artifact_types/show'
  end

  test 'should get edit' do
    get edit_artifact_type_url(@artifact_type)
    assert_response :success
    assert_template 'artifact_types/edit'
  end

  test 'should update artifact_type' do
    patch artifact_type_url(@artifact_type),
          params: { artifact_type: { book_id: @artifact_type.book_id, name: @artifact_type.name } }
    assert_redirected_to artifact_type_url(@artifact_type)
    # assert_template 'artifact_types/show'
  end

  test 'should not update artifact_type' do
    patch artifact_type_url(@artifact_type), params: { artifact_type: { book_id: @artifact_type.book_id, name: '' } }
    assert_response 422
    assert_template 'artifact_types/edit'
  end

  test 'should destroy artifact_type' do
    assert_difference('ArtifactType.count', -1) do
      delete artifact_type_url(@artifact_type)
    end

    assert_redirected_to book_artifact_types_url(@book)
    # assert_template 'artifact_types/index'
  end
end
