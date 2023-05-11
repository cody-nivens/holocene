# frozen_string_literal: true

require 'test_helper'

class ArtifactTypesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact_type.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :artifact_type])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_artifact_types_path(@book)
    assert_template 'artifact_types/new'
  end
end
