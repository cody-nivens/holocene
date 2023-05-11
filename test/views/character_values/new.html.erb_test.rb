# frozen_string_literal: true

require 'test_helper'

class CharacterValuesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, @character, :character_value])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_character_character_values_path(@book, @character)
    assert_template 'character_values/new'
  end
end
