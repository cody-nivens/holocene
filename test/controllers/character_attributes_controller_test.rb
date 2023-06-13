# frozen_string_literal: true

require 'test_helper'

class CharacterAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_attribute = character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category
    @character_category_2 = character_categories(:character_category_2)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get character_category_character_attributes_url(@character_category)
    assert_response :success
  end

  test 'should get index 2' do
    get character_category_character_attributes_url(@character_category_2)
    assert_response :success
  end

  test 'should get JSON index' do
    get character_category_character_attributes_url(@character_category), xhr: true
  end

  test 'should get new' do
    get new_character_category_character_attribute_url(@character_category)
    assert_response :success
  end

  test 'should sort character_attributes' do
    patch character_attribute_sort_url(character_attribute_id: @character_attribute.id), xhr: true,
                                                                                    params: { character_attribute: { id: @character_attribute.id } }
    assert_response :success
  end

  test 'should create character_attribute' do
    assert_difference('CharacterAttribute.count') do
      post character_category_character_attributes_url(@character_category),
           params: { character_attribute: { character_category_id: @character_attribute.character_category_id,
                                            name: @character_attribute.name, related_id: @character_attribute.related_id } }
    end

    assert_redirected_to character_attribute_url(CharacterAttribute.last)
  end

  test 'should not create character_attribute' do
    assert_difference('CharacterAttribute.count', 0) do
      post character_category_character_attributes_url(@character_category),
           params: { character_attribute: { character_category_id: @character_attribute.character_category_id, name: '',
                                            related_id: @character_attribute.related_id } }
    end

    assert_response :success
  end

  test 'should show character_attribute' do
    get character_attribute_url(@character_attribute)
    assert_response :success
  end

  test 'should get edit' do
    get edit_character_attribute_url(@character_attribute)
    assert_response :success
  end

  test 'should update character_attribute' do
    patch character_attribute_url(@character_attribute),
          params: { character_attribute: { character_category_id: @character_attribute.character_category_id,
                                           name: @character_attribute.name, related_id: @character_attribute.related_id } }
    assert_redirected_to character_attribute_url(@character_attribute)
  end

  test 'should not update character_attribute' do
    patch character_attribute_url(@character_attribute),
          params: { character_attribute: { character_category_id: @character_attribute.character_category_id, name: '',
                                           related_id: @character_attribute.related_id } }
    assert_response :success
  end

  test 'should destroy character_attribute' do
    assert_difference('CharacterAttribute.count', -1) do
      delete character_attribute_url(@character_attribute)
    end

    assert_redirected_to character_category_character_attributes_url(@character_category)
  end
end

  test 'should get edit' do
    get edit_polymorphic_path(@character_attribute)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@character_category, :character_attribute])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show character_attribute TS' do
    get polymorphic_path(@character_attribute, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show character_attribute index TS' do
    get character_category_character_attributes_url(@character_category, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create character_attribute TS" do
    assert_difference('CharacterAttribute.count') do
      post character_category_character_attributes_url(@character_category, format: 'turbo_stream'),
           params: { character_attribute: { character_category_id: @character_attribute.character_category_id,
                                            name: @character_attribute.name, related_id: @character_attribute.related_id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update character_attribute TS" do
    patch  polymorphic_path(@character_attribute, format: :turbo_stream),
          params: { character_attribute: { character_category_id: @character_attribute.character_category_id,
                                           name: @character_attribute.name, related_id: @character_attribute.related_id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @character_attribute}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy character_attribute TS" do
    assert_difference('CharacterAttribute.count', -1) do
      delete character_attribute_url(@character_attribute, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
