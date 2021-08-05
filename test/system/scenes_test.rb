require "application_system_test_case"

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:scene_1)
    @scene_2 = scenes(:scene_2)
    @scene_3 = scenes(:scene_3)
    @scene_6 = scenes(:scene_6)
    @situated = @scene.situated
    @situated_2 = @scene_2.situated
    @situated_3 = @scene_3.situated
    @situated_6 = @scene_6.situated

    @key_point = @scene.key_point
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the scene" do
    visit polymorphic_url([@situated, @scene])
    assert_text "A00001"
    within ".footer" do
      assert_no_text "<"
      assert_no_text ">"
    end
    take_screenshot
  end

  test "visiting the scene 2" do
    visit polymorphic_url([@situated_2, @scene_2])
    assert_text "A00002"
    within ".footer" do
      assert_text "<"
      assert_text ">"
    end
    take_screenshot
  end

  test "visiting the scene 3" do
    visit polymorphic_url([@situated_3, @scene_3])
    assert_text "A00003"
    within ".footer" do
      assert_text "<"
      assert_no_text ">"
    end
    take_screenshot
  end

  test "visiting the scene 4" do
    visit polymorphic_url([@situated_6, @scene_6])
    assert_text "A00004"
    within ".footer" do
      assert_no_text "<"
      assert_text ">"
    end
    take_screenshot
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
end
