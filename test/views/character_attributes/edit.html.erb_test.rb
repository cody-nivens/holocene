# frozen_string_literal: true

require 'test_helper'

class CharacterAttributesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_attribute = character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_character_attribute_url(@character_attribute)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', character_attribute_path(@character_attribute)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@character_category, :character_attributes])
    assert_template 'character_attributes/edit'
  end
end
