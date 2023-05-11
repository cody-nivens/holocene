# frozen_string_literal: true

require 'test_helper'

class CharacterCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_category = character_categories(:character_category_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get character_categories_url
    assert_response :success
  end

  test 'should sort character_categories' do
    patch character_category_sort_url(character_category_id: @character_category.id), xhr: true,
                                                                                    params: { character_category: { id: @character_category.id } }
    assert_response :success
  end

  test 'should get new' do
    get new_character_category_url
    assert_response :success
  end

  test 'should create character_category' do
    assert_difference('CharacterCategory.count') do
      post character_categories_url, params: { character_category: { name: @character_category.name } }
    end

    assert_redirected_to character_category_url(CharacterCategory.last)
  end

  test 'should not create character_category' do
    assert_difference('CharacterCategory.count', 0) do
      post character_categories_url, params: { character_category: { name: '' } }
    end

    assert_response :success
  end

  test 'should show character_category' do
    get character_category_url(@character_category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_character_category_url(@character_category)
    assert_response :success
  end

  test 'should update character_category' do
    patch character_category_url(@character_category),
          params: { character_category: { name: @character_category.name } }
    assert_redirected_to character_category_url(@character_category)
  end

  test 'should not update character_category' do
    patch character_category_url(@character_category), params: { character_category: { name: '' } }
    assert_response :success
  end

  test 'should destroy character_category' do
    assert_difference('CharacterCategory.count', -1) do
      delete character_category_url(@character_category)
    end

    assert_redirected_to character_categories_url
  end
end
