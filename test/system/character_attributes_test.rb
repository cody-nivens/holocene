require "application_system_test_case"

class CharacterAttributesTest < ApplicationSystemTestCase
  setup do
    @character_attribute = character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category
    @user = users(:users_1)
    sign_in @user
  end

  test "creating a Character attribute" do
    visit character_attributes_url(:character_category_id => @character_category.id)
    click_on "New Character Attribute"

    fill_in "Name", with: @character_attribute.name
    fill_in "Related", with: @character_attribute.related_id
    click_on "Create Character attribute"

    assert_text "Character attribute was successfully created"
    click_on "Back"
  end

  test "not creating a Character attribute" do
    visit character_attributes_url(:character_category_id => @character_category.id)
    click_on "New Character Attribute"

    fill_in "Name", with: ""
    click_on "Create Character attribute"

    assert_text "Please review the problems below:"
    click_on "Back"
  end
end
