# frozen_string_literal: true

require 'test_helper'

class ArtifactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artifact = artifacts(:artifact_1)
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact.book
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_artifacts_url(book_id: @book.id)
    assert_response :success
    assert_template 'artifacts/index'
  end

  test 'should get new' do
    get new_book_artifact_url(book_id: @book.id)
    assert_response :success
    assert_template 'artifacts/new'
  end

  test 'should create artifact' do
    assert_difference('Artifact.count') do
      post book_artifacts_url(book_id: @book.id),
           params: { artifact: { character_id: @artifact.character_id, name: @artifact.name, book_id: @book.id,
                                 artifact_type_id: @artifact_type.id, parent_id: nil } }
    end

    assert_redirected_to artifact_url(Artifact.last)
    # assert_template 'artifacts/show'
  end

  test 'should not create artifact' do
    assert_difference('Artifact.count', 0) do
      post book_artifacts_url(book_id: @book.id),
           params: { artifact: { character_id: @artifact.character_id, name: '', book_id: @book.id,
                                 artifact_type_id: @artifact_type.id, parent_id: nil } }
    end

    assert_response 422
    assert_template 'artifacts/new'
  end

  test 'should show artifact' do
    get artifact_url(@artifact)
    assert_response :success
    assert_template 'artifacts/show'
  end

  test 'should get edit' do
    get edit_artifact_url(@artifact)
    assert_response :success
    assert_template 'artifacts/edit'
  end

  test 'should get tagged 1' do
    get tag_artifacts_url(book_id: @book.id, tag: 'Domestication')
    assert_response :success
  end

  test 'should get tagged 2' do
    get tag_artifacts_url(book_id: @book.id)
    assert_response :success
  end

  test 'should update artifact' do
    patch artifact_url(@artifact),
          params: { artifact: { character_id: @artifact.character_id, name: @artifact.name, book_id: @book.id,
                                artifact_type_id: @artifact_type.id, parent_id: nil } }
    assert_redirected_to artifact_url(@artifact)
    # assert_template 'artifacts/show'
  end

  test 'should not update artifact' do
    patch artifact_url(@artifact),
          params: { artifact: { character_id: @artifact.character_id, name: '', book_id: @book.id,
                                artifact_type_id: @artifact_type.id, parent_id: nil } }
    assert_response 422
    assert_template 'artifacts/edit'
  end

  test 'should destroy artifact' do
    assert_difference('Artifact.count', -1) do
      delete artifact_url(@artifact)
    end

    assert_redirected_to book_artifacts_url(book_id: @book.id)
    # assert_template 'artifacts/index'
  end
end
