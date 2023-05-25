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

  if 1 == 0
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

    assert_response :unprocessable_entity
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
  end

  test 'should update artifact 2' do
    patch artifact_url(@artifact),
      params: {
        book_id: @artifact.book.id,
        artifact: { book_id: @artifact.book.id,
                    name: 'Port Apollo',
                    character_id: characters(:character_1).id,
                    parent_id: nil,
                    artifact_type_id: artifact_types(:artifact_type_1).id,
                    summary: '<div>Originally an ag ship with rec turned into a training ship for the military.<br>Surface is divided into various training areas.<br>Has an extreme combat cage with media broadcast abilities.<br>Has an Opera house, a Globe Shakespeare Theater</div>',
                    tag_list: 'Rec,Opera,Theater,Training,1ship'},
        commit: 'Update Artifact',
        id: @artifact.id}
    assert_redirected_to artifact_path(@artifact)
  end

  test 'should not update artifact' do
    patch artifact_url(@artifact),
          params: { artifact: { character_id: @artifact.character_id, name: '', book_id: @book.id,
                                artifact_type_id: @artifact_type.id, parent_id: nil } }
    assert_response :unprocessable_entity
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

  test 'should get edit' do
    get edit_artifact_url(@artifact)
    assert_response :success
  end

  test 'should get new' do
    get new_book_artifact_url(@book)
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show artifact TS' do
    get artifact_url(@artifact, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show artifact index TS' do
    get book_artifacts_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test "should create artifact TS" do
    assert_difference('Artifact.count') do
      post book_artifacts_url(book_id: @book.id, format: :turbo_stream),
           params: { artifact: { character_id: @artifact.character_id, name: "Test 1", book_id: @book.id,
                                 artifact_type_id: @artifact_type.id, parent_id: nil } }
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

  test "should update artifact TS" do
    patch artifact_url(@artifact, format: :turbo_stream), params: { artifact: { name: @artifact.name, book_id: @artifact.book.id } }
    label = dom_id @artifact
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @artifact}"
    assert_response :success
  end

  test "should destroy artifact TS" do
    assert_difference('Artifact.count', -1) do
      delete artifact_url(@artifact, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
