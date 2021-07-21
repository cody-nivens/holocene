require "application_system_test_case"

class CharacterCategoriesTest < ApplicationSystemTestCase
  setup do
    @character_category = character_categories(:character_category_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Character category index" do
    visit character_categories_url
    assert_selector "h1", text: "Character Categories"
  end

  test "creating a Character category" do
    visit character_categories_url
    click_on "New Character Category"

    fill_in "Name", with: @character_category.name
    click_on "Create Character category"

    assert_text "Character category was successfully created"
    click_on "Back"
  end

  test "not creating a Character category" do
    visit character_categories_url
    click_on "New Character Category"

    fill_in "Name", with: ""
    click_on "Create Character category"

    assert_text "Name can't be blank"
    click_on "Back"
  end

  test "updating a Character category" do
    visit character_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @character_category.name
    click_on "Update Character category"

    assert_text "Character category was successfully updated"
    click_on "Back"
  end

  test "not updating a Character category" do
    visit character_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    click_on "Update Character category"

    assert_text "Name can't be blank"
    click_on "Back"
  end

  test "destroying a Character category" do
    visit character_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character category was successfully destroyed"
  end
end
