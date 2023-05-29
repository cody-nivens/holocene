# frozen_string_literal: true

require 'test_helper'

class CharacterCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_category = character_categories(:character_category_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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

  test 'should get edit' do
    get edit_character_category_path(@character_category)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_character_category_path
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show character_category TS' do
    get character_category_path(@character_category, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show character_category index TS' do
    get character_categories_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create character_category TS" do
    assert_difference('CharacterCategory.count') do
      post character_categories_url(format: 'turbo_stream'), params: { character_category: { name: @character_category.name } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update character_category TS" do
    patch  character_category_path(@character_category, format: :turbo_stream),
          params: { character_category: { name: @character_category.name } }
    assert_turbo_stream action: :replace, target: "#{dom_id @character_category}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy character_category TS" do
    assert_difference('CharacterCategory.count', -1) do
      delete character_category_url(@character_category, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
