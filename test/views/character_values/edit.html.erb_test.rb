# frozen_string_literal: true

require 'test_helper'

class CharacterValuesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_character_value_url(@character_value)
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', character_value_path(@character_value)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@character, :character_values])
    assert_select '.footer>div>a', 2
    assert_template 'character_values/edit'
  end
end
