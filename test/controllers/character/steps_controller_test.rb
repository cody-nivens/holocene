# frozen_string_literal: true

require 'test_helper'

class Character
  class StepsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @book = books(:book_2)
      @user = users(:users_1)
      sign_in @user
    end

    test 'should get show' do
      post character_steps_book_url(book_id: @book.id, format: :turbo_stream)
      @character = Character.last
      #assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character.id,
      #                                              id: 'characteristics')
      assert_response :success
      assert_no_turbo_stream action: :update, target: "messages"
      assert_turbo_stream action: :replace, target: "nav-bar"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "header"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_turbo_stream status: :success, action: :replace, target: "objects" do |selected|
        #assert_equal "<template>message_1</template>", selected.children.to_html
      end


      patch character_steps_show_url(book_id: @book.id, format: :turbo_stream),
            params: { book_id: @book.id, age: '55', year: '105', death_age: '89',
                      character: { ethnicity: 'White', birth_year: '50', death_year: '139', sex: 0 }, commit: 'Next Step',
                      character_id: @character.id, wiz_step: 'characteristics' }

      @character.reload
      assert_equal @character.ethnicity, 'White'

      #assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character, id: 'identity')

      assert_response :success
      assert_no_turbo_stream action: :update, target: "messages"
      assert_turbo_stream action: :replace, target: "nav-bar"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "header"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_turbo_stream status: :success, action: :replace, target: "objects" do |selected|
        #assert_equal "<template>message_1</template>", selected.children.to_html
      end

      @character.reload
      assert_equal 'Male', Character.sex_to_text(@character.sex)

      patch character_steps_show_url(book_id: @book.id, character_id: @character.id, format: :turbo_stream),
            params: { character: { first_name: 'Reynaldo', middle_name: 'Michael', last_name: 'James-Lopez',
                                   suffix: '', reason_for_name: '', nickname: '', reason_for_nickname: '',
                                   use_honorific_only: '0', honorific: '' }, wiz_step: :identity, commit: 'Next Step' }

      #assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character,
      #                                              id: 'attributes')
      assert_response :success

      assert_no_turbo_stream action: :update, target: "messages"
      assert_turbo_stream action: :replace, target: "nav-bar"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "header"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_turbo_stream status: :success, action: :replace, target: "objects" do |selected|
        #assert_equal "<template>message_1</template>", selected.children.to_html
      end

      @character.reload
      assert_equal 'Reynaldo', @character.first_name
      assert_equal 'Michael', @character.middle_name
      assert_equal 'James-Lopez', @character.last_name

      patch character_steps_show_url(book_id: @book.id, character_id: @character.id, format: :turbo_stream),
            params: { character: { occupation_class: 'Argo Staff', social_class: 'Middle', grouping: 'Watch', father_id: '', mother_id: '' },
                      'physical appearance_age_value': '', 'physical appearance_eye color_value': 'Blue', 'physical appearance_hair color_value': 'Black',
                      'physical appearance_weight_value': '', 'physical appearance_height_value': '', 'gender_gender_value': 'Straight', 'family_mother_value': '',
                      'family_relationship with_value': '', 'commit': 'Next Step', 'wiz_step': 'attributes' }

      #assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character,
      #                                              id: 'wicked_finish', format: :turbo_stream)
      #assert_redirected_to book_character_path(book_id: @book.id, id: @character)
      assert_response :success
      assert_no_turbo_stream action: :update, target: "messages"
      assert_turbo_stream action: :replace, target: "nav-bar"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "header"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_turbo_stream status: :success, action: :replace, target: "objects" do |selected|
        #assert_equal "<template>message_1</template>", selected.children.to_html
      end


      @character.reload
      assert_equal 'Argo Staff', @character.occupation_class
    end

    if 1 == 0
    test 'should get show 2' do
      post book_characters_url(book_id: @book.id, format: :turbo_stream)
      @character = Character.last
      assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character.id,
                                                    id: 'characteristics')
      follow_redirect!
      assert_response :success

      patch book_character_step_url(book_id: @book.id, format: :turbo_stream),
            params: { book_id: @book.id, age: '55', year: '105', death_age: '89',
                      character: { ethnicity: 'White', birth_year: '50', death_year: '139', sex: 0 }, commit: 'Next Step',
                      character_id: @character.id, id: 'charcteristics' }

      assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character, id: 'identity')
      follow_redirect!
      assert_response :success

      @character.reload
      assert_equal 'Male', Character.sex_to_text(@character.sex)

      patch book_character_step_url(book_id: @book.id, character_id: @character.id, id: 'identity', format: :turbo_stream),
            params: { character: { first_name: 'James', middle_name: '', last_name: '',
                                   suffix: '', reason_for_name: '', nickname: '', reason_for_nickname: '',
                                   use_honorific_only: '0', honorific: '' }, commit: 'Next Step' }
      #assert_redirected_to book_character_step_path(book_id: @book.id, character_id: @character,
      #                                              id: 'attributes')
      #follow_redirect!
      assert_response :success
      @character.reload
      assert_equal 'James', @character.first_name
      assert_equal '', @character.middle_name
      assert_equal '', @character.last_name
    end
  end
end
end
