require "application_system_test_case"

class CharacterCategoriesTest < ApplicationSystemTestCase
  setup do
    @character_category = character_categories(:character_category_1)
    @character_category_1 = character_categories(:character_category_2)
    @character_category_2 = character_categories(:character_category_3)
    @user = users(:users_1)
    sign_in @user
  end

  test "sort character categories" do
    skip("Works in production")

    visit character_categories_url
    assert_text "Physical Appearance"

    assert_match %r[#{@character_category.name}.*#{@character_category_1.name}.*#{@character_category_2.name}]m, page.html

    draggable = find(:css, "#character_category-#{@character_category_2.id}")
    droppable = find(:css, "#character_category-#{@character_category_1.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match %r[#{@character_category.name}.*#{@character_category_2.name}.*#{@character_category_1.name}]m, page.html
    visit current_path
    assert_match %r[#{@character_category.name}.*#{@character_category_2.name}.*#{@character_category_1.name}]m, page.html
  end

  test "creating a Character category" do
    visit character_categories_url
    click_on "New Character Category"

    fill_in "Name", with: @character_category.name
    click_on "Create Character category"

    assert_text "Character category was successfully created"
    click_on "Back"
  end

  test "not creating a Character category" do
    visit character_categories_url
    click_on "New Character Category"

    fill_in "Name", with: ""
    click_on "Create Character category"

    assert_text "Name can't be blank"
    click_on "Back"
  end
end
