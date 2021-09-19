# frozen_string_literal: true

require 'application_system_test_case'

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:section_1)
    @chapter = @section.sectioned
    @user = users(:users_1)
    sign_in @user
  end

  test 'creating a Section' do
    visit chapter_sections_url(@chapter)
    click_on 'New Section'

    fill_in 'Name', with: @section.name
    fill_in_rich_text_area 'section_body', with: 'Test 1'

    click_on 'Create Section'

    assert_text 'Section was successfully created'
    click_on 'Back', match: :first
  end

  test 'should not create a Section' do
    visit chapter_sections_url(@chapter)
    click_on 'New Section'

    fill_in 'Name', with: ''
    fill_in_rich_text_area 'section_body', with: 'Test 1'

    click_on 'Create Section'

    assert_text "can't be blank"

    fill_in 'Name', with: @section.name
    click_on 'Create Section'
    assert_text 'Section was successfully created'
    click_on 'Back', match: :first
  end
end
