# frozen_string_literal: true

require 'test_helper'

class CharacterCategoriesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_category = character_categories(:character_category_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_character_category_url(@character_category)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', character_category_path(@character_category)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', character_categories_path
    assert_template 'character_categories/edit'
  end
end
