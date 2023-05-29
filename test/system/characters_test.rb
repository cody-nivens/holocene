# frozen_string_literal: true

require 'application_system_test_case'

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:character_1)
    @jill = characters(:character_6)
    @joe = characters(:character_2)
    @book = @character.books[0]
    @story = @book.stories.last
    @key_point = @story.key_points.last
    @scene = @key_point.scenes.last
    @situated = @scene.situated

    @user = users(:users_1)
    sign_in @user
  end

  test 'character_create' do 
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text "The Beginnings"

    do_menu "Characters", "Character Grid"
    assert_text "Characters for Book"

    click_new 'plus'

    assert_text 'Character Characteristics'

    fill_in 'year', with: '100'
    fill_in 'age', with: '25'
    fill_in 'death_age', with: '93'
    fill_in 'Ethnicity', with: 'White'
    select 'Male', from: 'Sex'

    click_on 'Next Step'

    assert_text 'Character Identity'

    fill_in "First name", with: 'John'
    fill_in "Middle name", with: ''
    fill_in "Last name", with: 'Smith'

    click_on 'Next Step'

    assert_text 'Character Attributes'

    fill_in 'Occupation class', with: 'Spy'
    fill_in 'Social class', with: 'High'

    click_on 'Next Step'

    assert_text "Info"
  end

  if 1 == 0
  test 'characters edit' do
    visit edit_book_character_url(@book, @character)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_text 'John Smith'
    assert_current_path polymorphic_path([@book, @character])
    click_on 'Back'
    assert_text 'Joe'
    assert_current_path book_characters_path(@book)
  end

  test 'characters index' do
    visit book_characters_url(@book)
    assert_current_path book_characters_path(@book)
#    visit New Character
    assert_link 'New Character'
    click_on 'New Character'
    assert_text 'Character Characteristics'
    assert_current_path book_character_step_path(@book, Character.last, :characteristics)
  end

  test 'book characters list' do
    visit book_characters_list_url(@book)
#    visit New Character
    assert_link 'New Character'
    take_screenshot
    click_on 'New Character'
    assert_text 'Character Characteristics'
    assert_current_path book_character_step_path(@book, Character.last, :characteristics)
  end

  test 'scene characters list' do
    visit scene_characters_list_url(@scene)
#    visit New Character
    assert_difference('@scene.characters.count', 2) do
      assert_link 'New Character'
      select 'Jill', from: 'characters_avail'
      select 'Joe', from: 'characters_avail'
      click_on 'Save'
      assert_link 'New Character'
      wait_for_ajax
      within '#characters_ids' do
        assert_selector(:xpath, ".//option[contains(text(),'#{@jill.name}')]", count: 1)
        assert_selector(:xpath, ".//option[contains(text(),'#{@joe.name}')]", count: 1)
      end
      page.all('select#characters_ids option').map(&:value) == [@jill.name, @joe.name ]
    end
    take_screenshot
  end

  test 'characters show attributes' do
    visit book_character_url(@book, @character)
#    visit Attributes
    assert_link 'Attributes'
    click_on 'Attributes'
    assert_text 'Character Values'
    assert_current_path polymorphic_path([@book, @character, :character_values])
    click_on 'Back'
    assert_link 'Lineage'
    assert_current_path polymorphic_path([@book, @character])
  end

  test 'characters show edit' do
#    visit Edit
    visit book_character_url(@book, @character)
    within '.footer' do
      assert_link 'Edit'
      click_on 'Edit'
    end
    assert_link 'Show'
    assert_current_path edit_book_character_path(@book, @character)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path book_character_path(@book, @character)
  end

  test 'characters show lineage' do
#    visit Lineage
    visit book_character_url(@book, @character)
    assert_link 'Lineage'
    click_on 'Lineage'
    assert_text @character.name
    assert_current_path polymorphic_path([@book, @character, :lineage])
    click_on 'Back'
    assert_link 'Attributes'
    assert_current_path book_character_path(@book, @character)
  end

  test 'visiting the Character index searching using first name' do
    visit book_url(id: @book.id)
    within '.footer' do
      assert_link 'Characters'
      click_on 'Characters'
    end

    assert_text 'Last Name LIKE'
    assert_text 'Jill'
    assert_text 'Joe'

    fill_in 'First Name LIKE', with: 'ji'
    click_on 'Search'
    assert_text 'Jill'
    assert_no_text 'Joe'
  end

  test 'visiting the Character index searching using last name' do
    visit book_url(id: @book.id)
    within '.footer' do
      assert_link 'Characters'
      click_on 'Characters'
    end

    assert_text 'Last Name LIKE'
    assert_text 'Jill'
    assert_text 'Joe'

    fill_in 'Last Name LIKE', with: 'smi'
    click_on 'Search'
    assert_text 'John'
    assert_no_text 'Joe'
  end

  test 'visiting the Character index for blank ethnicity' do
    visit book_url(id: @book.id)
    assert_link 'Stats'
    click_on 'Stats'
    # assert_text "Ethnicity"
    # click_on "Ethnicity"
    assert_text 'White'
    click_on '<blank>'
    assert_text 'Counsel'
  end

  test 'visiting the Character index for blank occupation_class' do
    visit book_url(id: @book.id)
    assert_link 'Occupation Class'
    click_on 'Occupation Class'
    assert_text 'Educated'
    click_on '<blank>'
    assert_text 'Counsel'
  end

  test 'visiting the Character index for occupation class tab' do
    visit books_url
    assert_link 'The Phantom'
    click_on 'The Phantom'
    assert_link 'Occupation Class'
    click_on 'Occupation Class'
    #binding.pry
    assert_link 'Educated'
    click_on 'Educated'
  end
end
end
