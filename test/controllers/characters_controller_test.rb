require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @character_2 = characters(:character_2)
    @book = @character.books[0]
    @story = @book.stories[0]
    @key_point = @story.key_points[0]
    @scene = @key_point.scenes[0]
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_characters_url(:book_id => @book.id)
    assert_response :success
  end

  test "should get index 2" do
    get book_characters_url(:book_id => @book.id, :ethnicity => 'White')
    assert_response :success
  end

  test "should get index 3" do
    get book_characters_url(:book_id => @book.id, :ethnicity => '')
    assert_response :success
  end

  test "should get index 4" do
    get book_characters_url(:book_id => @book.id, :occupation_class => 'Ship Staff')
    assert_response :success
  end

  test "should get new" do
    get new_book_character_url(:book_id => @book.id)
    assert_response :success
  end

  test "should add characters I" do
    assert_difference('@story.characters.count') do
      post story_characters_add_url(:story_id => @story.id), params: { characters_ids: [  ], characters_avail: [ @character.id ] }
    end

    assert_redirected_to polymorphic_path([@story, 'characters_list'])
  end

  test "should add characters II" do
    assert_difference('@story.characters.count') do
      post story_characters_add_url(:story_id => @story.id), params: { characters_ids: [  ], characters_avail: [ @character.id ] }
    end

    assert_difference('@story.characters.count', -1) do
      post story_characters_add_url(:story_id => @story.id), params: { characters_ids: [ @character.id ], characters_avail: [ ] }
    end

    assert_redirected_to polymorphic_path([@story, 'characters_list'])
  end

  test "should create character" do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do
        post book_characters_url(:book_id => @book.id), params: { character: { first_name: @character.first_name, nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
      end
    end

    assert_redirected_to book_character_url(:book_id => @book.id, :id => Character.last.id)
  end

  test "should create character 2" do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do
        assert_difference('@story.characters.count') do
          post scene_characters_url(:scene_id => @scene.id), params: { character: { first_name: @character.first_name, nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
        end
      end
    end

    assert_redirected_to scene_character_url(:scene_id => @scene.id, :id => Character.last.id)
  end

  test "should not create character" do
    assert_difference('Character.count',0) do
      post book_characters_url(:book_id => @book.id), params: { character: { first_name: "", nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    end

    assert_response :success
  end

  test "should show character" do
    get book_character_url(:book_id => @book.id, :id => @character.id)
    assert_response :success
  end

  test "should show character 2" do
    get book_character_url(:book_id => @book.id, :id => @character_2.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_character_url(:book_id => @book.id, :id => @character.id)
    assert_response :success
  end

  test "should update character" do
    patch book_character_url(:book_id => @book.id, :id => @character.id), params: { character: { first_name: @character.first_name, nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_redirected_to book_character_url(:book_id => @book, :id => @character.id)
  end

  test "should not update character" do
    patch book_character_url(:book_id => @book.id, :id => @character.id), params: { character: { first_name: "", nickname: @character.nickname, occupation_class: @character.occupation_class, race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_response :success
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete book_character_url(:book_id => @book.id, :id => @character.id)
    end

    assert_redirected_to book_characters_url(:book_id => @book.id)
  end
end
