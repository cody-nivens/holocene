require 'test_helper'

class CharacterValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get character_values_url(:character_id => @character.id)
    assert_response :success
  end

  test "should get new" do
    get new_character_value_url(:character_id => @character.id)
    assert_response :success
  end

  test "should create character_value" do
    assert_difference('CharacterValue.count') do
      post character_values_url, params: { character_value: { character_attribute_id: @character_value.character_attribute_id, character_id: @character_value.character_id, value: @character_value.value } }
    end

    assert_redirected_to character_value_url(CharacterValue.last)
  end

  test "should not create character_value" do
    assert_difference('CharacterValue.count',0) do
      post character_values_url, params: { character_value: { character_attribute_id: @character_value.character_attribute_id, character_id: @character_value.character_id, value: "" } }
    end

    assert_response :success
  end

  test "should show character_value" do
    get character_value_url(@character_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_value_url(@character_value)
    assert_response :success
  end

  test "should update character_value" do
    patch character_value_url(@character_value), params: { character_value: { character_attribute_id: @character_value.character_attribute_id, character_id: @character_value.character_id, value: @character_value.value } }
    assert_redirected_to character_value_url(@character_value)
  end

  test "should not update character_value" do
    patch character_value_url(@character_value), params: { character_value: { character_attribute_id: @character_value.character_attribute_id, character_id: @character_value.character_id, value: "" } }
    assert_response :success
  end

  test "should destroy character_value" do
    assert_difference('CharacterValue.count', -1) do
      delete character_value_url(@character_value)
    end

    assert_redirected_to character_values_url(:character_id => @character.id)
  end
end
