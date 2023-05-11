# frozen_string_literal: true

require 'test_helper'

class CharacterValuesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_book_character_character_value_url(@book, @character, @character_value)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', book_character_character_value_path(@book, @character, @character_value)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@book, @character, :character_values])
    assert_template 'character_values/edit'
  end
end
