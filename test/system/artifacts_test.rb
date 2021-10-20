# frozen_string_literal: true

require 'application_system_test_case'

class ArtifactsTest < ApplicationSystemTestCase
  setup do
    @artifact = artifacts(:artifact_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

    test 'artifacts edit' do
#   visit Show
    visit book_artifacts_path(@artifact.book)
    within row_containing_cell_with_text(@artifact.name) do
      find(:xpath, ".//a[contains(@title, 'Edit')]", match: :first).click
    end
    assert_link 'Show'
    click_on 'Show'
    assert_text 'Owner/Controller:'
    assert_current_path artifact_path(@artifact)
    click_on 'Back'
    assert_text 'New Artifact'
    assert_current_path book_artifacts_path(@artifact.book)
  end

  test 'artifacts index' do
#    visit New Artifact
    visit book_artifacts_path(@book)
    assert_link 'New Artifact'
    click_on 'New Artifact'
    assert_no_link 'New Artifact'
    assert_current_path new_book_artifact_path(@book)
    click_on 'Back'
    assert_text 'New Artifact'
    assert_current_path book_artifacts_path(@book)
  end

  test 'artifacts show' do
#    visit Edit
    visit artifact_path(@artifact)
    assert_link 'Edit'
    click_on 'Edit'
    assert_text 'Editing Artifact'
    assert_current_path edit_artifact_path(@artifact)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path artifact_path(@artifact)
  end


  test 'artifact edit' do
    visit edit_artifact_path(@artifact)
    assert_link 'Show'
    click_on 'Show'
    assert_text 'Owner/Controller:'
    assert_current_path artifact_path(@artifact)
  end

  test 'artifact edit 2' do
    visit edit_artifact_path(@artifact)
    assert_link 'Back'
    click_on 'Back'
    assert_text 'New Artifact'
    assert_current_path book_artifacts_path(@artifact.book)
  end

  test 'creating a Artifact' do
    visit book_artifacts_path(@book)
    click_on 'New Artifact'

    select 'John', from: 'artifact_character_id'
    fill_in 'Name', with: @artifact.name
    select 'Ship', from: 'artifact_artifact_type_id'
    click_on 'Create Artifact'

    assert_text 'Artifact was successfully created'
    assert_current_path artifact_path(Artifact.last)
    click_on 'Back'
    assert_text 'New Artifact'
    assert_current_path book_artifacts_path(@book)
  end

  test 'not creating a Artifact' do
    visit book_artifacts_path(@book)
    click_on 'New Artifact'

    select 'John', from: 'artifact_character_id'
    fill_in 'Name', with: ''
    select 'Ship', from: 'artifact_artifact_type_id'
    click_on 'Create Artifact'

    assert_text "Name\ncan't be blank"
    assert_current_path book_artifacts_path(@book)
    click_on 'Back'
    assert_link 'New Artifact'
    assert_current_path book_artifacts_path(@book)
  end
end
