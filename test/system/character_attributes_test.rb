# frozen_string_literal: true

require 'application_system_test_case'

class CharacterAttributesTest < ApplicationSystemTestCase
  setup do
    @character_attribute = character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category
    @user = users(:users_1)
    sign_in @user
  end

  test 'character_attributes edit' do
    visit edit_character_attribute_url(@character_attribute)
#    visit Show
    assert_text 'Show'
    click_on 'Show'
    assert_current_path character_attribute_path(@character_attribute)
    click_on 'Back'
    assert_current_path character_category_character_attributes_path(@character_category)
  end

  test 'character_attributes index' do
    visit character_category_character_attributes_url(@character_category)
#    visit New Character Attribute
    assert_text 'New Character Attribute'
    click_on 'New Character Attribute'
    assert_current_path new_character_category_character_attribute_path(@character_category)
    click_on 'Back'
    #assert_current_path character_category_character_attributes_path(@character_category)
  end

  test 'character_attributes show' do
    visit character_attribute_url(@character_attribute)
#    visit Edit
    assert_text 'Edit'
    click_on 'Edit'
    assert_current_path edit_character_attribute_path(@character_attribute)
    click_on 'Back'
    assert_current_path character_category_character_attributes_path(@character_category)
  end

  test 'creating a Character attribute' do
    visit character_category_character_attributes_url(@character_category)
    click_on 'New Character Attribute'

    fill_in 'Name', with: @character_attribute.name
    fill_in 'Related', with: @character_attribute.related_id
    click_on 'Create Character attribute'

    assert_text 'Character attribute was successfully created'
    click_on 'Back'
  end

  test 'not creating a Character attribute' do
    visit character_category_character_attributes_url(@character_category)
    click_on 'New Character Attribute'

    fill_in 'Name', with: ''
    click_on 'Create Character attribute'

    assert_text "Name\ncan't be blank"
    click_on 'Back'
  end
end
