require "test_helper"

class ActorCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor_character = actor_characters(:actor_character_1)
    @actor = @actor_character.actor
    @user = users(:users_1)
    sign_in @user
  end

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
      post actor_actor_characters_url(@actor), params: { actor_character: { actor_id: @actor_character.actor_id, character_id: @actor_character.character_id } }
    end

    assert_redirected_to actor_actor_characters_url(@actor)
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
    patch actor_character_url(@actor_character), params: { actor_character: { actor_id: @actor_character.actor_id, character_id: @actor_character.character_id } }
    assert_redirected_to actor_actor_characters_url(@actor)
  end

  test "should destroy actor_character" do
    assert_difference('ActorCharacter.count', -1) do
      delete actor_character_url(@actor_character)
    end

    assert_redirected_to actor_actor_characters_url(@actor)
  end
end
