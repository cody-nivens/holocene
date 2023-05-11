# frozen_string_literal: true

require 'test_helper'

class CharacterValuesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show character_value' do
    get book_character_character_value_path(@book, @character, @character_value)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_book_character_character_value_path(@book, @character, @character_value)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_character_character_values_path(@book,@character)
    assert_template 'character_values/show'
  end
end
