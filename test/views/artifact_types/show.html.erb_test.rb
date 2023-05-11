# frozen_string_literal: true

require 'test_helper'

class ArtifactTypesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact_type.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show artifact_type' do
    get artifact_type_path(@artifact_type)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_artifact_type_path(@artifact_type)
    assert_select 'a[title=?]', 'Back'
    assert_template 'artifact_types/show'
  end
end
