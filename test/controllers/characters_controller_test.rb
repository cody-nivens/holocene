# frozen_string_literal: true

require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @character_2 = characters(:character_2)
    @character_7 = characters(:character_7)
    @book = @character.books[0]
    @story = stories(:story_2)
    @key_point = @story.key_points[0]
    @scene = @key_point.scenes[0]
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get book_characters_url(book_id: @book.id)
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 1' do
    get book_characters_url(book_id: @book.id, characters_grid: { last_name: 'A' })
    assert_response :success
  end

  test 'should get index 2' do
    get book_characters_url(book_id: @book.id, characters_grid: { ethnicity: 'White' })
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 3' do
    get book_characters_url(book_id: @book.id, characters_grid: { ethnicity: '' })
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 4' do
    get book_characters_url(book_id: @book.id, characters_grid: { occupation_class: 'Ship Staff' })
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 5' do
    get book_characters_url(book_id: @book.id), params: { cat1: 'Gender', cat2: 'sex', key1: 'Gay', key2: 'Male' }
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 6' do
    get book_characters_url(book_id: @book.id), params: { category: 'Phyical Appearance', cat1: 'Hair color' }
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 7' do
    get book_characters_url(book_id: @book.id, occupation_class: '')
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 8' do
    get book_characters_url(book_id: @book.id),
        params: { attrib1: 'occupation_class', attrib2: 'sex', key1: 'Autocrat', key2: 'Male' }
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get index 9' do
    get book_characters_url(book_id: @book.id, main: 1)
    assert_response :success
    assert_template 'datagrid/_table'
  end

  test 'should get attributes' do
    get characters_attributes_url(book_id: @book.id, characters_grid: { category: character_categories(:character_category_1).id }),
        xhr: true
    assert_response :success
  end

  test 'should get values' do
    category = character_categories(:character_category_1)
    get characters_attribute_values_url(book_id: @book.id, characters_grid: { category: category.id, attribute: CharacterAttribute.where(character_category_id: category.id).first.id }),
        xhr: true
    assert_response :success
  end

  test 'should get index without values' do
    category = character_categories(:character_category_1)
    get book_characters_url(book_id: @book.id, characters_grid: { category: category.id, attribute: CharacterAttribute.where(character_category_id: category.id).first.id }),
        xhr: true
    assert_response :success
  end

  test 'should get index with values' do
    category = character_categories(:character_category_1)
    get book_characters_url(book_id: @book.id, characters_grid: { category: category.id, attribute: CharacterAttribute.where(character_category_id: category.id).first.id, value: 'five ten' }),
        xhr: true
    assert_response :success
  end

  test 'should get list' do
    get polymorphic_url([@book, :characters, :list])
    assert_response :success
  end

  test 'should get scenes' do
    get character_scenes_url(@book)
    assert_response :success
  end

  test 'should get matrix' do
    get character_matrix_url(@book)
    assert_response :success
  end

  test 'should add characters I' do
    assert_difference('@story.characters.count') do
      post story_characters_add_url(story_id: @story.id),
           params: { characters_ids: [], characters_avail: [@character.id] }
    end

    assert_redirected_to polymorphic_path([@story, :characters_list])
  end

  test 'should add characters II' do
    assert_difference('@story.characters.count') do
      post story_characters_add_url(story_id: @story.id),
           params: { characters_ids: [], characters_avail: [@character.id, @character_7.id] }
    end

    assert_difference('@story.characters.count', -1) do
      post story_characters_add_url(story_id: @story.id),
           params: { characters_ids: [@character.id], characters_avail: [] }
    end

    assert_redirected_to polymorphic_path([@story, :characters_list])
  end

  test 'should add characters III' do
    assert_difference('@story.characters.count', 0) do
      post story_characters_add_url(story_id: @story.id), params: {}
    end

    assert_redirected_to polymorphic_path([@story, :characters_list])
  end

  test 'should create character 1' do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do
        post book_characters_url(book_id: @book.id)
        assert_redirected_to book_character_step_path(book_id: @book.id, character_id: Character.last.id,
                                                      id: 'characteristics')
      end
    end
  end

  test 'should create character 2' do
    assert_difference('Character.count') do
      assert_difference('@story.characters.count') do
        post story_characters_url(story_id: @story.id)
        assert_redirected_to story_character_step_path(story_id: @story.id, character_id: Character.last.id,
                                                       id: 'characteristics')
      end
    end
  end

  test 'should create character 3' do
    assert_difference('Character.count') do
      assert_difference('@story.characters.count') do
        assert_difference('@scene.characters.count') do
          post scene_characters_url(scene_id: @scene.id)
          assert_redirected_to scene_character_step_path(scene_id: @scene.id, character_id: Character.last.id,
                                                         id: 'characteristics')
        end
      end
    end
  end

  test 'should show character' do
    get book_character_url(book_id: @book.id, id: @character.id)
    assert_response :success
  end

  test 'should show character lineage' do
    get book_character_lineage_url(book_id: @book.id, id: @character.id)
    assert_response :success
  end

  test 'should show character 2' do
    get book_character_url(book_id: @book.id, id: @character_2.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_book_character_url(book_id: @book.id, id: @character.id)
    assert_response :success
  end

  test 'should update character 1' do
    patch book_character_url(book_id: @book.id, id: @character.id),
          params: { gender_gender_value: '---',
                    character: { first_name: @character.first_name, nickname: @character.nickname,
                                 occupation_class: @character.occupation_class, ethnicity: @character.ethnicity, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_redirected_to book_character_url(book_id: @book, id: @character.id)
  end

  test 'should update character 2' do
    patch book_character_url(book_id: @book.id, id: @character.id),
          params: { gender_gender_value: 'Gay',
                    character: { first_name: @character.first_name, nickname: @character.nickname,
                                 occupation_class: @character.occupation_class, ethnicity: @character.ethnicity, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_redirected_to book_character_url(book_id: @book, id: @character.id)
  end

  test 'should not update character' do
    patch book_character_url(book_id: @book.id, id: @character.id),
          params: { character: { first_name: '', nickname: @character.nickname, occupation_class: @character.occupation_class,
                                 ethnicity: @character.ethnicity, reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname, social_class: @character.social_class } }
    assert_response :success
  end

  test 'should destroy character' do
    assert_difference('Character.count', -1) do
      delete book_character_url(book_id: @book.id, id: @character.id)
    end

    assert_redirected_to book_characters_url(book_id: @book.id)
  end
end

  test 'should get edit' do
    get edit_book_character_path(@book, @character)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show character TS' do
    get polymorphic_path([@book, @character], format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show character index TS' do
    get book_characters_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test "should update character TS" do
    patch  book_character_path(@book, @character, format: :turbo_stream),
          params: { gender_gender_value: '---',
                    character: { first_name: @character.first_name, nickname: @character.nickname,
                                 occupation_class: @character.occupation_class, ethnicity: @character.ethnicity,
                                 reason_for_name: @character.reason_for_name, reason_for_nickname: @character.reason_for_nickname,
                                 social_class: @character.social_class } }
    assert_turbo_stream action: :replace, target: "#{dom_id @character}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy character TS" do
    assert_difference('Character.count', -1) do
      delete book_character_url(@book, @character, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
