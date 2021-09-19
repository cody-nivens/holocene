# frozen_string_literal: true

require 'test_helper'

class CharacterValuesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show character_value' do
    get character_value_path(@character_value)
    assert_response :success

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_character_value_path(@character_value)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', character_character_values_path(@character)
    assert_select '.footer>div>a', 2
    assert_template 'character_values/show'
  end
end
