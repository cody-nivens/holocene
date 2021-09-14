require "application_system_test_case"

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:scene_1)
    @scene_2 = scenes(:scene_2)
    @scene_3 = scenes(:scene_3)
    @scene_6 = scenes(:scene_6)
    @scene_13 = scenes(:scene_13)
    @scene_11 = scenes(:scene_11)

    @situated = @scene.situated
    @situated_2 = @scene_2.situated
    @situated_3 = @scene_3.situated
    @situated_6 = @scene_6.situated

    @key_point = @scene.key_point
    @user = users(:users_1)
    sign_in @user
  end

  test 'visiting the scenes' do
    visit '/'
    click_link 'Books'
    click_link 'The Phantom'
    click_link 'Scenes'
    select '100', from: 'year'
    click_button 'Go'
    click_link 'Back'
  end

  test "sort scenes" do
    visit books_url
    assert_text "The Phantom"
    click_on "The Phantom"
    assert_text "The Beginnings"
    click_on "The Beginnings"
    assert_text "Climate Change"
    click_on "Climate Change"

    #save_and_open_page
    #debugger
    #take_screenshot
    assert_match %r[#{@scene.name}.*#{@scene_11.name}.*#{@scene_13.name}]m, page.html

    draggable = find(:css, "#scene-#{@scene_13.id}")
    droppable = find(:css, "#scene-#{@scene_11.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match %r[#{@scene.name}.*#{@scene_13.name}.*#{@scene_11.name}]m, page.html
    visit current_path

    assert_match %r[#{@scene.name}.*#{@scene_13.name}.*#{@scene_11.name}]m, page.html
  end

  test "visiting the scene" do
    visit scene_url(@scene)
    assert_text "A00001"
    take_screenshot
    within ".footer" do
      assert_no_text "<"
      assert_text ">"
    end
    take_screenshot
  end

  test "visiting the scene 2" do
    visit scene_url(@scene_2)
    assert_text "A00002"
    within ".footer" do
      assert_text "<"
      assert_text ">"
    end
    take_screenshot
  end

  test "visiting the scene 3" do
    visit scene_url(@scene_3)
    assert_text "A00003"
    within ".footer" do
      assert_text "<"
      assert_no_text ">"
    end
    take_screenshot
  end

  test "visiting the scene 4" do
    visit scene_url(@scene_6)
    assert_text "A00004"
    within ".footer" do
      assert_no_text "<"
      assert_text ">"
    end
    take_screenshot
  end

  test "creating a Scene" do
    visit key_point_url(@key_point)
    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click
    click_on "New Scene"

    assert_text "Abc"

    fill_in "Abc", with: "G00001"
    check "Check" if @scene.check
    fill_in "Scene sequel", with: @scene.scene_sequel
    fill_in "Time", with: @scene.date_string

    #fill_in_rich_text_area "scene_summary", with: "Test 1"
    #assert_text "Test 1"
    #take_screenshot

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
    visit key_point_url(@key_point)
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
