require "application_system_test_case"

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:scene_1)
    @book = @scene.book
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit book_scenes_url(:book_id => @book.id)
    assert_selector "h1", text: "Scenes"
  end

  test "visiting the scene" do
    visit book_scene_url(:book_id => @book.id, :id => @scene.id)
    assert_text "Abc"
  end

  test "creating a Scene" do
    visit book_scenes_url(:book_id => @book.id)
    click_on "New Scene"

    fill_in "Abc", with: @scene.abc
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: @scene.time

    fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    fill_in_rich_text_area "scene_place", with: @scene.place
    fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary

    click_on "Create Scene"

    assert_text "Scene was successfully created"
    click_on "Back"
  end

  test "not creating a Scene" do
    visit book_scenes_url(:book_id => @book.id)
    click_on "New Scene"

    fill_in "Abc", with: @scene.abc
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: ""

    fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    fill_in_rich_text_area "scene_place", with: @scene.place
    fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary

    click_on "Create Scene"

    assert_text "Time can't be blank"
    click_on "Back"
  end

  test "updating a Scene" do
    visit book_scenes_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "Abc", with: @scene.abc
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: @scene.time

    fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    fill_in_rich_text_area "scene_place", with: @scene.place
    fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary

    fill_in "Time", with: @scene.time
    click_on "Update Scene"

    assert_text "Scene was successfully updated"
    click_on "Back"
  end

  test "not updating a Scene" do
    visit book_scenes_url(:book_id => @book.id)
    click_on "Edit", match: :first

    fill_in "Abc", with: @scene.abc
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: ""

    fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    fill_in_rich_text_area "scene_place", with: @scene.place
    fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary

    click_on "Update Scene"

    assert_text "Time can't be blank"
    click_on "Back"
  end

  test "destroying a Scene" do
    visit book_scenes_url(:book_id => @book.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scene was successfully destroyed"
  end
end
