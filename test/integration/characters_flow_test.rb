require 'test_helper'

class CharactersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @character_2 = characters(:character_2)
    @story = stories(:story_2)
    @character = @story.characters.first
    @book = @story.book
    @key_point = @story.key_points[0]
    @scene = @key_point.scenes[0]
    @user = users(:users_1)
    sign_in @user
  end


  test "create character flow" do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do
        assert_difference('@story.characters.count') do
          debugger if @scene.nil?
          post scene_characters_url(:scene_id => @scene.id), params: { 
            character: { first_name: @character.first_name, nickname: @character.nickname, occupation_class: @character.occupation_class, 
                         race: @character.race, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, 
                         social_class: @character.social_class } }
        end
      end
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'characters/show'

    assert_select ".alert", /.*Character was successfully created.*/
    #assert_select "h2>a", "Sammy goes to Washington"
  end

end
