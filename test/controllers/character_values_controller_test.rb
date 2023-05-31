# frozen_string_literal: true

require 'test_helper'

class CharacterValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = @character.books[0]
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get polymorphic_url([@book, @character, :character_values])
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_url([@book, @character, :character_value])
    assert_response :success
  end

  test 'should create character_value' do
    assert_difference('CharacterValue.count') do
      post polymorphic_path([@book, @character, :character_values]),
           params: { character_value: { character_attribute_id: @character_value.character_attribute_id,
                                        character_id: @character_value.character_id, value: @character_value.value } }
    end

    assert_redirected_to polymorphic_path([@book, @character, :character_values])
  end

  test 'should not create character_value' do
    assert_difference('CharacterValue.count', 0) do
      post polymorphic_path([@book, @character, :character_values]),
           params: { character_value: { character_attribute_id: @character_value.character_attribute_id,
                                        character_id: @character_value.character_id, value: '' } }
    end

    assert_response :success
  end

  test 'should show character_value' do
    get polymorphic_url([@book, @character, @character_value])
    assert_response :success
  end

  test 'should get edit' do
    get edit_polymorphic_url([@book, @character, @character_value])
    assert_response :success
  end

  test 'should update character_value' do
    patch polymorphic_url([@book, @character, @character_value]),
          params: { character_value: { character_attribute_id: @character_value.character_attribute_id,
                                       character_id: @character_value.character_id, value: @character_value.value } }
    assert_redirected_to polymorphic_url([@book, @character, :character_values])
  end

  test 'should not update character_value' do
    patch polymorphic_url([@book, @character, @character_value]),
          params: { character_value: { character_attribute_id: @character_value.character_attribute_id,
                                       character_id: @character_value.character_id, value: '' } }
    assert_response :success
  end

  test 'should destroy character_value' do
    assert_difference('CharacterValue.count', -1) do
      delete polymorphic_url([@book, @character, @character_value])
    end

    assert_redirected_to polymorphic_url([@book, @character, :character_values])
  end
end
  test 'should get edit' do
    get edit_polymorphic_url([@book, @character, @character_value])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_url([@book, @character, :character_value])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show character_value TS' do
    get polymorphic_url([@book, @character, @character_value], format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show character_value index TS' do
    get polymorphic_url([@book, @character, :character_values], format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create character_value TS" do
    assert_difference('CharacterValue.count') do
      post polymorphic_path([@book, @character, :character_values], format: :turbo_stream),
           params: { character_value: { character_attribute_id: @character_value.character_attribute_id,
                                        character_id: @character_value.character_id, value: @character_value.value } }
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

  test "should update character_value TS" do
    patch polymorphic_url([@book, @character, @character_value], format: :turbo_stream),
          params: { character_value: { character_attribute_id: @character_value.character_attribute_id,
                                       character_id: @character_value.character_id, value: @character_value.value } }
    assert_turbo_stream action: :replace, target: "#{dom_id @character_value}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy character_value TS" do
    assert_difference('CharacterValue.count', -1) do
      delete polymorphic_url([@book, @character, @character_value], format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
