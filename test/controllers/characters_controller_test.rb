require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = @character.books[0]
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_characters_url(:book_id => @book.id)
    assert_response :success
  end

  test "should get new" do
    get new_book_character_url(:book_id => @book.id)
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post book_characters_url(:book_id => @book.id), params: { character: { name: @character.name, nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    end

    assert_redirected_to book_character_url(:book_id => @book.id, :id => Character.last.id)
  end

  test "should not create character" do
    assert_difference('Character.count',0) do
      post book_characters_url(:book_id => @book.id), params: { character: { name: "", nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    end

    assert_response :success
  end

  test "should show character" do
    get book_character_url(:book_id => @book.id, :id => @character.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_character_url(:book_id => @book.id, :id => @character.id)
    assert_response :success
  end

  test "should update character" do
    patch book_character_url(:book_id => @book.id, :id => @character.id), params: { character: { name: @character.name, nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_redirected_to book_character_url(:book_id => @book, :id => @character.id)
  end

  test "should not update character" do
    patch book_character_url(:book_id => @book.id, :id => @character.id), params: { character: { name: "", nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_response :success
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete book_character_url(:book_id => @book.id, :id => @character.id)
    end

    assert_redirected_to book_characters_url(:book_id => @book.id)
  end
end
