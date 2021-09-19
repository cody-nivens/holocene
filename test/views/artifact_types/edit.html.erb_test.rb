# frozen_string_literal: true

require 'test_helper'

class ArtifactTypesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact_type.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_artifact_type_url(@artifact_type)
    assert_select 'a[text()=?]', 'Back'
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', artifact_type_path(@artifact_type)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@book, :artifact_types])
    assert_select '.footer>div>a', 2
    assert_template 'artifact_types/edit'
  end
end
