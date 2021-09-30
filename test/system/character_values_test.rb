# frozen_string_literal: true

require 'application_system_test_case'

class CharacterValuesTest < ApplicationSystemTestCase
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = @character.books[0]
    @user = users(:users_1)
    sign_in @user
  end

  test 'character_values edit' do
    visit edit_book_character_character_value_url(@book, @character, @character_value)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_text 'Value:'
    assert_current_path book_character_character_value_path(@book, @character, @character_value)
    click_on 'Back'
    assert_link 'New Character Value'
    assert_current_path book_character_character_values_path(@book, @character)
  end

  test 'character_values index' do
    visit book_character_character_values_url(@book, @character)
#    visit New Character Value
    assert_link 'New Character Value'
    click_on 'New Character Value'
    assert_no_link 'New Character Value'
    assert_current_path new_polymorphic_path([@book, @character, :character_value])
    click_on 'Back'
    assert_text 'New Character Value'
    assert_current_path polymorphic_path([@book, @character, :character_values])
  end

  test 'character_values show' do
    visit book_character_character_value_url(@book, @character, @character_value)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_book_character_character_value_path(@book, @character, @character_value)
    click_on 'Back'
    assert_link 'New Character Value'
    assert_current_path book_character_character_values_path(@book, @character)
  end

  test 'creating a Character value' do
    visit book_character_character_values_url(@book, @character)
    click_on 'New Character Value'

    select 'Family', from: 'character_category_id'
    select 'Mother', from: 'character_value_character_attribute_id'
    fill_in 'Value', with: @character_value.value
    click_on 'Create Character value'

    assert_text 'Character value was successfully created'
    # click_on "Back"
  end

  test 'not creating a Character value' do
    visit book_character_character_values_url(@book, @character)
    click_on 'New Character Value'

    select 'Physical appearance', from: 'character_category_id'
    select 'Weight', from: 'character_value_character_attribute_id'
    fill_in 'Value', with: ''
    click_on 'Create Character value'

    assert_text "Value\ncan't be blank"
    # click_on "Back"
  end
end
