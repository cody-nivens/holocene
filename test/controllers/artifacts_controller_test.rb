require 'test_helper'

class ArtifactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artifact = artifacts(:artifact_1)
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact_type.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_artifacts_url(:book_id => @book.id)
    assert_response :success
  end

  test "should get new" do
    get new_book_artifact_url(:book_id => @book.id)
    assert_response :success
  end

  test "should create artifact" do
    assert_difference('Artifact.count') do
      post book_artifacts_url(:book_id => @book.id), params: { artifact: { character_id: @artifact.character_id, name: @artifact.name, book_id: @book.id, artifact_type_id: @artifact_type.id, parent_id: nil } }
    end

    assert_redirected_to book_artifact_url(@book, Artifact.last)
  end

  test "should not create artifact" do
    assert_difference('Artifact.count', 0) do
      post book_artifacts_url(:book_id => @book.id), params: { artifact: { character_id: @artifact.character_id, name: "", book_id: @book.id, artifact_type_id: @artifact_type.id, parent_id: nil } }
    end

    assert_response 422
  end

  test "should show artifact" do
    get book_artifact_url(@book,@artifact)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_artifact_url(@book,@artifact)
    assert_response :success
  end

  test "should update artifact" do
    patch book_artifact_url(@book,@artifact), params: { artifact: { character_id: @artifact.character_id, name: @artifact.name, book_id: @book.id, artifact_type_id: @artifact_type.id, parent_id: nil } }
    assert_redirected_to book_artifact_url(@book, @artifact)
  end

  test "should not update artifact" do
    patch book_artifact_url(@book,@artifact), params: { artifact: { character_id: @artifact.character_id, name: "", book_id: @book.id, artifact_type_id: @artifact_type.id, parent_id: nil } }
    assert_response 422
  end

  test "should destroy artifact" do
    assert_difference('Artifact.count', -1) do
      delete book_artifact_url(@book,@artifact)
    end

    assert_redirected_to book_artifacts_url(:book_id => @book.id)
  end
end
