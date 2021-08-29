require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:character_1)
    @book = @character.books[0]
    @story = @book.stories.last
    @key_point = @story.key_points.last
    @scene = @key_point.scenes.last
    @situated = @scene.situated

    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test "visiting the Character index for ethnicity tab" do
    visit book_characters_url(:book_id => @book.id)
    assert_selector "h1", text: "Characters"
    click_on "Ethnicity"
    click_on "White"
  end

  test "visiting the Character index for blank ethnicity" do
    visit book_url(:id => @book.id)
    assert_text "Ethnicity"
    click_on "Ethnicity"
    assert_text "White"
    click_on "<blank>"
    assert_text "Counsel"
  end

  test "visiting the Character index for blank occupation_class" do
    visit book_url(:id => @book.id)
    assert_text "Occupation Class"
    click_on "Occupation Class"
    assert_text "Educated"
    click_on "<blank>"
    assert_text "Counsel"
  end

  test "visiting the Character index for occupation class tab" do
    visit books_url
    assert_link "The Phantom"
    click_on "The Phantom"
    click_on "Occupation Class"
    click_on "Educated"
  end

  test "creating a Character for book" do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do

        visit book_characters_url(:book_id => @book.id)
        click_on "New Character"


        assert_equal "", find_field("Birth year").value
        assert_equal "", find_field("Death year").value
        fill_in "age", with: 25
        fill_in "year", with: 2021
        fill_in "death_age", with: 89
        fill_in "Occupation class", with: @character.occupation_class
        assert_equal "1996", find_field("Birth year").value
        assert_equal "2085", find_field("Death year").value

        fill_in "Reason for name", with: @character.reason_for_name
        fill_in "Reason for nickname", with: @character.reason_for_nickname
        fill_in "Social class", with: @character.social_class

        click_on "submit"

        assert_text "Character was successfully created"
        #click_on "Attributes", match: :first
        assert_text @character.occupation_class
        click_on "Back"
      end
    end
  end
  end

  test "creating a Character for story" do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do
        assert_difference('@story.characters.count') do

          visit story_characters_url(:story_id => @story.id)
          click_on "Add/Remove Characters"
          assert_text "New Character"
          click_on "New Character"

          assert_text "Race"

          assert_equal "", find_field("Birth year").value
          assert_equal "", find_field("Death year").value
          fill_in "age", with: 25
          fill_in "year", with: 2021
          fill_in "death_age", with: 89
          fill_in "character_race", with: "White"
          assert_equal "1996", find_field("Birth year").value
          assert_equal "2085", find_field("Death year").value
          click_on "Next Step"

          assert_text "First name"
          fill_in "Reason for name", with: @character.reason_for_name
          fill_in "Reason for nickname", with: @character.reason_for_nickname
          click_on "Next Step"

          assert_text "Occupation class"

          fill_in "Occupation class", with: @character.occupation_class
          fill_in "Social class", with: @character.social_class
          fill_in "Grouping", with: "Argo"
          click_on "Next Step"

          #click_on "Attributes", match: :first
          assert_text @character.occupation_class
          click_on "Back"
        end
      end
    end
  end

  if 1 == 0
  test "creating a Character for scene" do
    assert_difference('Character.count') do
      assert_difference('@book.characters.count') do
        assert_difference('@story.characters.count') do
          assert_difference('@scene.characters.count') do

            visit polymorphic_url([@situated, @scene])

            click_on "Characters"
            assert_text "Add/Remove Character"
            click_on "Add/Remove Character"
            assert_text "New Character"
            click_on "New Character"

            assert_equal "", find_field("Birth year").value
            assert_equal "", find_field("Death year").value
            fill_in "age", with: 25
            fill_in "year", with: 2021
            fill_in "death_age", with: 89
            fill_in "Occupation class", with: @character.occupation_class
            assert_equal "1996", find_field("Birth year").value
            assert_equal "2085", find_field("Death year").value

            fill_in "Reason for name", with: @character.reason_for_name
            fill_in "Reason for nickname", with: @character.reason_for_nickname
            fill_in "Social class", with: @character.social_class

            click_on "submit"

            assert_text "Character was successfully created"
            #click_on "Attributes", match: :first
            assert_text @character.occupation_class
            click_on "Back"
          end
        end
      end
    end
  end

  test "not creating a Character" do
    visit book_characters_url(:book_id => @book.id)
    click_on "New Character"

    fill_in "First name", with: ""
    fill_in "Middle name", with: ""
    fill_in "Last name", with: ""
    fill_in "Nickname", with: @character.nickname
    fill_in "Occupation class", with: @character.occupation_class
    fill_in "Race", with: @character.race
    fill_in "Reason for name", with: @character.reason_for_name
    fill_in "Reason for nickname", with: @character.reason_for_nickname
    fill_in "Social class", with: @character.social_class
    click_on "submit"

    assert_text "First name\ncan't be blank"
    click_on "Back"
  end
end
end
