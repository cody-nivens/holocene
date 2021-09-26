# frozen_string_literal: true

require 'application_system_test_case'

class CharacterCategoriesTest < ApplicationSystemTestCase
  setup do
    @character_category = character_categories(:character_category_1)
    @character_category_1 = character_categories(:character_category_2)
    @character_category_2 = character_categories(:character_category_3)
    @user = users(:users_1)
    sign_in @user
  end

  test 'character_categories edit' do
#    visit Show
    visit edit_character_category_url(@character_category)
    assert_text 'Show'
    click_on 'Show'
    assert_current_path character_category_path(@character_category)
    click_on 'Back'
    assert_current_path character_categories_path
  end

  test 'character_categories index' do
    visit character_categories_url
#    visit New Character Category
    assert_text 'New Character Category'
    click_on 'New Character Category'
    assert_current_path new_character_category_path
    click_on 'Back'
    assert_current_path character_categories_path
  end

  test 'character_categories show' do
    visit character_category_url(@character_category)
#    visit Edit
    within ".footer" do
      assert_text 'Edit'
      click_on 'Edit'
    end
    assert_current_path edit_character_category_path(@character_category)
    click_on 'Back'
    assert_current_path character_categories_path
#    visit New Character Attribute
    visit character_category_url(@character_category)
    assert_text 'New Character Attribute'
    click_on 'New Character Attribute'
    assert_current_path new_character_category_character_attribute_path(character_category_id: @character_category.id)
    click_on 'Back'
    assert_current_path character_category_path(@character_category)
  end

  test 'sort character categories' do
    skip('Works in production')

    visit character_categories_url
    assert_text 'Physical Appearance'

    assert_match /#{@character_category.name}.*#{@character_category_1.name}.*#{@character_category_2.name}/m,
                 page.html

    draggable = find(:css, "#character_category-#{@character_category_2.id}")
    droppable = find(:css, "#character_category-#{@character_category_1.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match /#{@character_category.name}.*#{@character_category_2.name}.*#{@character_category_1.name}/m,
                 page.html
    visit current_path
    assert_match /#{@character_category.name}.*#{@character_category_2.name}.*#{@character_category_1.name}/m,
                 page.html
  end

  test 'creating a Character category' do
    visit character_categories_url
    click_on 'New Character Category'

    fill_in 'Name', with: @character_category.name
    click_on 'Create Character category'

    assert_text 'Character category was successfully created'
    click_on 'Back'
  end

  test 'not creating a Character category' do
    visit character_categories_url
    click_on 'New Character Category'

    fill_in 'Name', with: ''
    click_on 'Create Character category'

    assert_text "Name can't be blank"
    click_on 'Back'
  end
end
