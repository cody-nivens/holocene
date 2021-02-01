require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:character_1)
    @book = @character.books[0]
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit book_characters_url(:book_id => @book.id)
    assert_selector "h1", text: "Characters"
  end

  test "creating a Character" do
    visit book_characters_url(:book_id => @book.id)
    click_on "New Character"

    fill_in "First name", with: @character.first_name
    fill_in "Middle name", with: @character.middle_name
    fill_in "Last name", with: @character.last_name
    fill_in "Nickname", with: @character.nickname
    fill_in "Occupation class", with: @character.occupation_class
    fill_in "Race", with: @character.race
    fill_in "Reason for name", with: @character.reason_for_name
    fill_in "Reason for nickname", with: @character.reason_for_nickname
    fill_in "Social class", with: @character.social_class
    click_on "submit"

    assert_text "Character was successfully created"
    click_on "Back"
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

  test "updating a Character" do
    visit book_characters_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "First name", with: @character.first_name
    fill_in "Middle name", with: @character.middle_name
    fill_in "Last name", with: @character.last_name
    fill_in "Nickname", with: @character.nickname
    fill_in "Occupation class", with: @character.occupation_class
    fill_in "Race", with: @character.race
    fill_in "Reason for name", with: @character.reason_for_name
    fill_in "Reason for nickname", with: @character.reason_for_nickname
    fill_in "Social class", with: @character.social_class
    click_on "submit"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "not updating a Character" do
    visit book_characters_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "First name", with: ""
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

#  test "destroying a Character" do
#    visit book_characters_url(:book_id => @book.id)
#    page.accept_confirm do
#      click_on "Destroy", match: :first
#    end

#    assert_text "Character was successfully destroyed"
#  end
end
