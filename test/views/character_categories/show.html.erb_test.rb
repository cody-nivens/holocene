require 'test_helper'

class CharacterCategoriesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_category= character_categories(:character_category_1)

    @user = users(:users_1)
    sign_in @user
  end

  test "should show character_category" do
    get character_category_path(@character_category)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_character_category_path(@character_category)
    assert_select "a[text()=?]",'New Character Attribute'
    assert_select "a[href=?]", new_character_category_character_attribute_path(@character_category)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", character_categories_path
    assert_select ".footer>div>a", 3
    assert_template 'character_categories/show'
  end
end
