# frozen_string_literal: true

require 'application_system_test_case'

class ArtifactTypesTest < ApplicationSystemTestCase
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test 'creating a Artifact type' do
    visit book_artifact_types_url(@book)
    click_on 'New Artifact Type'

    fill_in 'Name', with: @artifact_type.name
    click_on 'Create Artifact type'

    assert_text 'Artifact type was successfully created'
    click_on 'Back'
  end

  test 'not creating a Artifact type' do
    visit book_artifact_types_url(@book)
    click_on 'New Artifact Type'

    fill_in 'Name', with: ''
    click_on 'Create Artifact type'

    assert_text "Name\ncan't be blank"
    click_on 'Back'
  end
end
