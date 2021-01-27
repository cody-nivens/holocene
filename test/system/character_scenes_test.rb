require "application_system_test_case"

class CharacterScenesTest < ApplicationSystemTestCase
  setup do
    @character_scene = character_scenes(:character_scene_1)
    @scene = @character_scene.scene
    @user = users(:users_1)
    sign_in @user

  end

  test "visiting the index" do
    visit polymorphic_url([@scene, 'character_scenes'])
    assert_selector "h1", text: "Character Scenes"
  end

  test "creating a Character scene" do
    visit polymorphic_url([@scene, 'character_scenes'])
    click_on "New Character Scene"

    click_on "Create Character scene"

    assert_text "Character scene was successfully created"
    click_on "Back"
  end

  test "updating a Character scene" do
    visit polymorphic_url([@scene, 'character_scenes'])
    click_on "Edit", match: :first

    click_on "Update Character scene"

    assert_text "Character scene was successfully updated"
    click_on "Back"
  end

  test "destroying a Character scene" do
    visit polymorphic_url([@scene, 'character_scenes'])
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character scene was successfully destroyed"
  end
end
