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
    ["White","Black","Asian","Latino","Latino Mixed","Am Indian"].each do |ethnicity|

    post book_characters_url(:book_id => @book.id)
    @character = Character.last
    assert_redirected_to book_character_step_path(:book_id => @book.id,:character_id => @character.id, :id =>"characteristics")
    follow_redirect!
    assert_response :success

    patch book_character_step_url(:book_id => @book.id),
      params: { :book_id=>@book.id, :age=>"55", :year=>"105", :death_age=>"89", :character=>{:ethnicity=>ethnicity, :birth_year=>"50", :death_year=>"139"}, :commit=>"Next Step", :character_id=>@character.id, :id=>"charcteristics"}

    assert_redirected_to book_character_step_path(:book_id => @book.id,:character_id => @character, :id =>"identity")
    follow_redirect!
    assert_response :success

    patch book_character_step_url(:book_id => @book.id),
      params: { :book_id=>@book.id,
                :character=> {:first_name=>"Darren", :middle_name=>"Randall", :last_name=>"Jacobson", :suffix=>"", :reason_for_name=>"", :nickname=>"", :reason_for_nickname=>"", :use_honorific_only=>"0", :honorific=>""},
                :commit=>"Next Step", :character_id=>@character.id, :id=>"identity"}

    assert_redirected_to book_character_step_path(:book_id => @book.id,:character_id => @character, :id =>"attributes")
    follow_redirect!
    assert_response :success

    patch book_character_step_url(:book_id => @book.id),
      params: { :book_id=>@book.id, :age=>"55", :year=>"105", :death_age=>"89",
  :character=>{"occupation_class"=>"Autocrat", "social_class"=>"High", "grouping"=>"Argo", "father_id"=>"", "mother_id"=>""},
  "physical appearance_age_value"=>"", "physical appearance_age appearance_value"=>"", "physical appearance_eye color_value"=>"Blue", "physical appearance_glasses contacts_value"=>"", "physical appearance_hair color_value"=>"Blond",
  "physical appearance_hair style_value"=>"", "physical appearance_weight_value"=>"", "physical appearance_height_value"=>"", "physical appearance_type of body_value"=>"", "physical appearance_skin tone_value"=>"",
  "physical appearance_skin type_value"=>"", "physical appearance_shape of face_value"=>"", "physical appearance_marks_value"=>"", "physical appearance_freckles_value"=>"", "physical appearance_moles_value"=>"",
  "physical appearance_scars_value"=>"", "physical appearance_predominate feature_value"=>"", "physical appearance_looks like_value"=>"", "physical appearance_healthy_value"=>"", "physical appearance_why not_value"=>"",
  "favorites_favorite color_value"=>"", "favorites_least favorite color_value"=>"", "favorites_why_value"=>"", "favorites_favorite music_value"=>"", "favorites_least favorite music_value"=>"",
  "favorites_food_value"=>"", "favorites_literature_value"=>"", "favorites_expressions_value"=>"", "favorites_expletives_value"=>"", "favorites_mode of trans_value"=>"",
  "favorites_daredevil cautious_value"=>"", "favorites_same alone_value"=>"", "favorites_habits_value"=>"", "favorites_drinks_value"=>"", "favorites_what_value"=>"",
  "favorites_when how much_value"=>"", "favorites_hobbies_value"=>"", "favorites_rainy day_value"=>"", "background_hometown_value"=>"", "background_type of childhood_value"=>"",
  "background_first memory_value"=>"", "background_most import childhood_value"=>"", "background_why most import_value"=>"", "background_education_value"=>"", "background_religion_value"=>"",
  "background_finances_value"=>"", "gender_gender_value"=>"Straight", "personality_great strength_value"=>"", "personality_great weakness_value"=>"", "personality_soft spot_value"=>"",
  "personality_obvious to others_value"=>"", "personality_how hide_value"=>"", "personality_biggest vulnerability_value"=>"", "attitude_most at ease_value"=>"", "attitude_ill at ease_value"=>"",
  "attitude_priorities_value"=>"", "attitude_philosophy_value"=>"", "attitude_feel about self_value"=>"", "attitude_past failures_value"=>"", "attitude_why_value"=>"",
  "attitude_one wish_value"=>"", "family_mother_value"=>"", "family_relationship with_value"=>"", "family_father_value"=>"",
  "family_siblings_value"=>"", "family_how many_value"=>"", "family_birth order_value"=>"", "family_relationship with each_value"=>"",
  "family_child of siblings_value"=>"", "family_extended family_value"=>"", "family_close_value"=>"", "family_why why not_value"=>"", "traits_optimist pessimist_value"=>"",
  "traits_why_value"=>"", "traits_introvert extrovert_value"=>"", "traits_drives motivations_value"=>"", "traits_talents_value"=>"", "traits_extremely skilled_value"=>"",
  "traits_extremely unskilled_value"=>"", "traits_good characteristics_value"=>"", "traits_character flaws_value"=>"", "traits_mannerisms_value"=>"", "traits_peculiarities_value"=>"",
  "traits_biggest regret_value"=>"", "traits_minor regrets_value"=>"", "traits_darkest secret_value"=>"", "traits_anybody know_value"=>"", "traits_char tell them_value"=>"",
  "traits_how find out_value"=>"",
                :commit=>"Next Step", :character_id=>@character.id, :id=>"attributes"}

    assert_redirected_to book_character_step_path(:book_id => @book.id,:character_id => @character.id, :id => 'wicked_finish')
    follow_redirect!
    assert_redirected_to book_character_path(:book_id => @book.id,:id => @character.id)
    follow_redirect!
    assert_response :success

  end



##  test "create character flow" do
#    assert_difference('Character.count') do
#      assert_difference('@book.characters.count') do
#        assert_difference('@story.characters.count') do
#          debugger if @scene.nil?
#          post scene_characters_url(:scene_id => @scene.id), params: {
#            character: { first_name: @character.first_name, nickname: @character.nickname, occupation_class: @character.occupation_class,
#                         ethnicity: @character.ethnicity, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname,
#                         social_class: @character.social_class } }
#        end
#      end
#    end
#
#    assert_response :redirect
#    follow_redirect!
#    assert_response :success
#    assert_template 'characters/show'
#
#    assert_select ".alert", /.*Character was successfully created.*/
#    #assert_select "h2>a", "Sammy goes to Washington"
#  end

end
end
