# frozen_string_literal: true

require 'test_helper'

class CharacterAttributesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_attribute = character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show character_attribute' do
    get character_attribute_path(@character_attribute)
    assert_response :success

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_character_attribute_path(@character_attribute)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 2
    assert_template 'character_attributes/show'
  end
end
