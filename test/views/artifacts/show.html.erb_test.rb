# frozen_string_literal: true

require 'test_helper'

class ArtifactsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact = artifacts(:artifact_1)
    @book = @artifact.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show artifact' do
    get artifact_path(@artifact)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_artifact_path(@artifact)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_artifacts_path(@book)
    assert_template 'artifacts/show'
  end
end
