require "application_system_test_case"

class ActorCharactersTest < ApplicationSystemTestCase
  setup do
    @actor_character = actor_characters(:one)
  end

  test "visiting the index" do
    visit actor_characters_url
    assert_selector "h1", text: "Actor Characters"
  end

  test "creating a Actor character" do
    visit actor_characters_url
    click_on "New Actor Character"

    fill_in "Actor", with: @actor_character.actor_id
    fill_in "Character", with: @actor_character.character_id
    click_on "Create Actor character"

    assert_text "Actor character was successfully created"
    click_on "Back"
  end

  test "updating a Actor character" do
    visit actor_characters_url
    click_on "Edit", match: :first

    fill_in "Actor", with: @actor_character.actor_id
    fill_in "Character", with: @actor_character.character_id
    click_on "Update Actor character"

    assert_text "Actor character was successfully updated"
    click_on "Back"
  end

  test "destroying a Actor character" do
    visit actor_characters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actor character was successfully destroyed"
  end
end
