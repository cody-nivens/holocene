require "test_helper"

class ActorCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor_character = actor_characters(:actor_character_1)
    @actor = @actor_character.actor
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test "should get index" do
    get actor_actor_characters_url(@actor)
    assert_response :success
  end

  test "should get new" do
    get new_actor_actor_character_url(@actor)
    assert_response :success
  end

  test "should create actor_character" do
    assert_difference('ActorCharacter.count') do
      post actor_actor_characters_url(@actor),
        params: { actor_character: { actor_id: @actor_character.actor_id, character_id: @actor_character.character_id } }
    end

    assert_redirected_to actor_actor_characters_url(@actor)
  end

  test "should not create actor_character" do
    assert_difference('ActorCharacter.count', 0) do
      post actor_actor_characters_url(@actor), params: { actor_character: { actor_id: @actor_character.actor_id, character_id: nil } }
    end

    assert_response :unprocessable_entity
    assert_template :new
  end

  test "should show actor_character" do
    get actor_character_url(@actor_character)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_character_url(@actor_character)
    assert_response :success
  end

  test "should update actor_character" do
    patch actor_character_url(@actor_character),
      params: { actor_character: { actor_id: @actor_character.actor_id, character_id: @actor_character.character_id } }
    assert_redirected_to actor_actor_characters_url(@actor)
  end

  test "should not update actor_character" do
    patch actor_character_url(@actor_character), params: { actor_character: { actor_id: @actor_character.actor_id, character_id: nil } }
    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy actor_character" do
    assert_difference('ActorCharacter.count', -1) do
      delete actor_character_url(@actor_character)
    end

    assert_redirected_to actor_actor_characters_url(@actor)
  end
end
  test 'should get edit' do
    get edit_polymorphic_path(@actor_character)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@actor, :actor_character])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test "should create actor_character TS" do
    assert_difference('ActorCharacter.count') do
      post actor_actor_characters_url(@actor, format: 'turbo_stream'),
        params: { actor_character: { actor_id: @actor_character.actor_id, character_id: @actor_character.character_id } }
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

  test "should update actor_character TS" do
    patch  polymorphic_path(@actor_character, format: :turbo_stream),
      params: { actor_character: { actor_id: @actor_character.actor_id, character_id: @actor_character.character_id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @actor_character}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy actor_character TS" do
    assert_difference('ActorCharacter.count', -1) do
      delete actor_character_url(@actor_character, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
