require "application_system_test_case"

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:scene_1)
    @scene_2 = scenes(:scene_2)
    @key_point = @scene.key_point
    @situated = @scene.situated
    @situated_2 = @scene_2.situated
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Scene index 1" do
    visit polymorphic_url([@situated, :scenes])
    assert_selector "h1", text: "Scenes"
  end

  test "visiting the Scene index 2" do
    visit polymorphic_url([@situated, :scenes], toggle: "on")
    assert_selector "h1", text: "Scenes"
  end

  test "visiting the Scene index 3" do
    visit polymorphic_url([@situated, :scenes], print: "on")
    visit polymorphic_url([@situated, :scenes])
    assert_selector "h1", text: "Scenes"
  end

  test "visiting the Scene index 4" do
    visit polymorphic_url([@situated, :scenes], print: "on", toggle: "on")
    visit polymorphic_url([@situated, :scenes])
    assert_selector "h1", text: "Scenes"
  end

  test "visiting the scene" do
    visit polymorphic_url([@situated, @scene])
    assert_text "A00001"
  end

  test "moving a scene" do
    ["First Plot Point","First Pinch Point","Midpoint","Second Pinch Point","Third Plot Point","Climax"].each do |selector|
    visit polymorphic_url([@situated, @scene])
    assert_text "A00001"
    assert_text "Move"
    click_on "Move"
    select "Sleepy village", from: "new_key_point_id"
    select selector, from: "new_selector"
    click_on "Save"
    assert_text "Scene was successfully moved"
    end
  end

  test "not moving a scene" do
    selector = "First Plot Point"
    visit polymorphic_url([@situated, @scene])
    assert_text "A00001"
    assert_text "Move"
    click_on "Move"
    select "Sleepy village", from: "new_key_point_id"
    select selector, from: "new_selector"
    Scene.any_instance.stubs(:update).returns(false)
    click_on "Save"
    page.assert_current_path scene_move_path(@scene)
    assert_no_text "Scene was successfully moved"
  end

  test "creating a Scene" do
    visit polymorphic_url([@situated, @key_point ])
    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click
    click_on "New Scene"

    assert_text "Abc"

    fill_in "Abc", with: "G00001"
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: @scene.time

    fill_in_rich_text_area "scene_summary", with: "Test 1"
    assert_text "Test 1"
    take_screenshot

    #fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    #fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    #fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    #fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    #fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    #fill_in_rich_text_area "scene_place", with: @scene.place
    #fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal

    click_on "Create Scene"
    
    assert_text "Scene was successfully created"
    click_on "Back"
  end

  test "not creating a Scene" do
    visit polymorphic_url([@situated, @key_point ])
    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click
    click_on "New Scene"

    fill_in "Abc", with: ""
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "t_years", with: ""

    #fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    #fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    #fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    #fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    #fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    #fill_in_rich_text_area "scene_place", with: @scene.place
    #fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary
    assert_text @scene.summary.to_plain_text
    take_screenshot

    click_on "Create Scene"

    assert_text "Abc can't be blank"
    click_on "Back"
  end

  test "updating a Scene" do
    visit polymorphic_url([@situated_2, :scenes])
    click_on "A00003"
    click_on "Edit", match: :first

    fill_in "Abc", with: @scene.abc
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: @scene.time

    #fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    #fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    #fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    #fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    #fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    #fill_in_rich_text_area "scene_place", with: @scene.place
    #fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary
    assert_text @scene.summary.to_plain_text
    take_screenshot

    fill_in "Time", with: @scene.time
    click_on "Update Scene"

    assert_text "Scene was successfully updated"
    click_on "Back"
  end

  test "not updating a Scene" do
    visit polymorphic_url([@situated_2, :scenes])
    click_on "A00003"
    click_on "Edit", match: :first

    fill_in "Abc", with: ""
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: "105"

    #fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    #fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    #fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    #fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    #fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    #fill_in_rich_text_area "scene_place", with: @scene.place
    #fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area "scene_summary", with: @scene.summary
    assert_text @scene.summary.to_plain_text
    take_screenshot

    click_on "Update Scene"

    assert_text "Abc can't be blank"
    click_on "Back"
  end

  test "destroying a Scene" do
    visit polymorphic_url([@situated_2, :scenes])
    click_on "A00003"
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scene was successfully destroyed"
  end
end
