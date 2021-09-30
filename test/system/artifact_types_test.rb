# frozen_string_literal: true

require 'application_system_test_case'

class ArtifactTypesTest < ApplicationSystemTestCase
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test 'artifact_types edit' do
    visit edit_artifact_type_path(@artifact_type)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_text 'Location:'
    assert_current_path artifact_type_path(@artifact_type)
    click_on 'Back'
    assert_link 'New Artifact Type'
    assert_current_path book_artifact_types_path(@book)
  end

  test 'artifact_types index' do
#    visit New Artifact Type
    visit book_artifact_types_url(@book)
    assert_link 'New Artifact Type'
    click_on 'New Artifact Type'
    assert_no_link 'New Artifact Type'
    assert_current_path new_polymorphic_path([@book, :artifact_type])
    click_on 'Back'
    assert_link 'New Artifact Type'
    assert_current_path book_artifact_types_path(@book)
  end

  test 'artifact_types show' do
#    visit Edit
    visit book_artifact_types_url(@book)
    assert_link 'Edit'
    within row_containing_cell_with_text(@artifact_type.name) do
      click_on 'Edit'
    end
    assert_text 'Editing Artifact Type'
    assert_current_path edit_artifact_type_path(@artifact_type)
    click_on 'Back'
    assert_link 'New Artifact Type'
    assert_current_path book_artifact_types_path(@book)
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
