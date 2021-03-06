require "application_system_test_case"

class CharacterValuesTest < ApplicationSystemTestCase
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = @character.books[0]
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit polymorphic_url([@book, @character, 'character_values'])
    assert_selector "h1", text: "Character Values"
  end

  test "creating a Character value" do
    visit polymorphic_url([@book, @character, 'character_values'])
    click_on "New Character Value"

    select "Family", from: "character_category_id"
    select "Mother", from: "character_value_character_attribute_id"
    fill_in "Value", with: @character_value.value
    click_on "Create Character value"

    assert_text "Character value was successfully created"
    click_on "Back"
  end

  test "not creating a Character value" do
    visit polymorphic_url([@book, @character, 'character_values'])
    click_on "New Character Value"

    select "Weight", from: "character_value_character_attribute_id"
    fill_in "Value", with: ""
    click_on "Create Character value"

    assert_text "Value can't be blank"
    click_on "Back"
  end

  test "updating a Character value" do
    visit polymorphic_url([@book, @character, 'character_values'])
    click_on "Edit", match: :first

    select "Weight", from: "character_value_character_attribute_id"
    fill_in "Value", with: @character_value.value
    click_on "Update Character value"

    assert_text "Character value was successfully updated"
    click_on "Back"
  end

  test "not updating a Character value" do
    visit polymorphic_url([@book, @character, 'character_values'])
    click_on "Edit", match: :first

    select "Weight", from: "character_value_character_attribute_id"
    fill_in "Value", with: ""
    click_on "Update Character value"

    assert_text "Value can't be blank"
    click_on "Back"
  end

  test "destroying a Character value" do
    visit polymorphic_url([@book, @character, 'character_values'])
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character value was successfully destroyed"
  end
end
