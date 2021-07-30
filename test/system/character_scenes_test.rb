require "application_system_test_case"

class CharacterScenesTest < ApplicationSystemTestCase
  setup do
    @character_scene = character_scenes(:character_scene_1)
    @scene = @character_scene.scene
    @user = users(:users_1)
    sign_in @user
  end

  test "updating a Character scene" do
    visit scene_url(:id => @scene.id)
    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click

    fill_in_rich_text_area "character_scene_summary", with: "Test 1"
    click_on "submit"

    assert_text "Character scene was successfully updated"
    click_on "Back"
  end

  test "not updating a Character scene" do
    visit scene_url(:id => @scene.id)
    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click

    CharacterScene.any_instance.stubs(:update).returns(false)

    fill_in_rich_text_area "character_scene_summary", with: "Test 1"
    click_on "submit"

    page.assert_current_path scene_character_scene_path(:scene_id => @scene.id, :id => @character_scene.id)
    assert_no_text "Character scene was successfully updated"
    click_on "Back"
  end
end