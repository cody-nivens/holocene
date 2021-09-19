# frozen_string_literal: true

require 'test_helper'

class CharacterCategoriesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_category = character_categories(:character_category_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_character_category_url
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', character_categories_path
    assert_select '.footer>div>a', 1
    assert_template 'character_categories/new'
  end
end
