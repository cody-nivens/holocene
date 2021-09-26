# frozen_string_literal: true

require 'test_helper'

class CharacterAttributesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_attribute = character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@character_category, :character_attribute])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', character_category_path(@character_category)
    assert_select '.footer>div>a', 1
    assert_template 'character_attributes/new'
  end
end
