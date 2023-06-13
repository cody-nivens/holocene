# frozen_string_literal: true

require 'application_system_test_case'

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:scene_1)
    @scene_2 = scenes(:scene_2)
    @scene_3 = scenes(:scene_3)
    @scene_6 = scenes(:scene_6)
    @scene_9 = scenes(:scene_9)
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

  test "walk the scene side menus" do
    @book = books(:book_2)
    walk_sides('Scene')
  end

  if 1 == 0
  test 'scenes index' do
    visit polymorphic_path([@situated, :scenes])
#    visit Timeline
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_button 'Go'
    assert_current_path polymorphic_path([@situated, :timeline])
    click_on 'Back'
    assert_link 'Timeline'
    assert_current_path polymorphic_path([@situated, :key_points])
  end

  test 'scenes show characters' do
    visit scene_url(@scene)
#    visit Characters
    assert_link 'Characters'
    click_on 'Characters'
    assert_link 'Add/Remove Characters'
    assert_current_path polymorphic_path([@scene, :characters])
    click_on 'Back'
    assert_text 'Word Count:'
    assert_current_path polymorphic_path(@scene)
  end

  test 'scenes show destroy' do
#    visit Destroy
    #Scene.get_scenes(@scene.book)
    visit scene_url(@scene)
    assert_link 'Destroy'
    accept_confirm do
      click_on 'Destroy'
      page.driver.browser.switch_to.alert.accept
    end
    assert_button 'Go'
    assert_current_path polymorphic_path([@situated, :scenes])
    click_on 'Back'
    assert_text @scene.situated.name
    assert_current_path polymorphic_path(@scene.situated)
  end

  test 'scenes show edit' do
#    visit Edit Section
    #Scene.get_scenes(@scene.book)
    visit scene_url(@scene)
    assert_link 'Edit Section'
    click_on 'Edit Section'
    assert_text 'Editing Section'
    assert_current_path edit_section_path(@scene.section)
    click_on 'Back'
    assert_text @scene.abc
    assert_current_path polymorphic_path(@scene)
  end

  test 'scenes show move' do
    #Scene.get_scenes(@scene_13.book)
    visit scene_url(@scene_13)
#    visit Move
    assert_link 'Move'
    click_on 'Move'
    assert_text 'Existing Key Point'
    assert_current_path polymorphic_path([@scene_13, :move])
    click_on 'Back'
    assert_link 'New Key Point'
    assert_current_path polymorphic_path(@scene_13.situated)
  end

  test 'scenes show new section' do
#    visit New Section
    #Scene.get_scenes(@scene_13.book)
    visit scene_url(@scene_13)
    assert_link 'New Section'
    click_on 'New Section'
    assert_no_link 'New Section'
    assert_current_path new_polymorphic_path([@scene_13, :section])
    click_on 'Back'
    assert_text @scene_13.abc
    assert_current_path polymorphic_path(@scene_13)
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

  test 'sort scenes' do
    visit books_url
    assert_link 'The Phantom'
    click_on 'The Phantom'
    assert_link 'The Beginnings'
    click_on 'The Beginnings'
    assert_link 'Climate Change'
    click_on 'Climate Change'

    # save_and_open_page
    # debugger
    # take_screenshot
    assert_match /#{@scene.name}.*#{@scene_11.name}.*#{@scene_13.name}/m, page.html

    draggable = find(:css, "#scene-#{@scene_13.id}")
    droppable = find(:css, "#scene-#{@scene_11.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match /#{@scene.name}.*#{@scene_13.name}.*#{@scene_11.name}/m, page.html
    visit current_path

    assert_match /#{@scene.name}.*#{@scene_13.name}.*#{@scene_11.name}/m, page.html
  end

  test 'visiting the scene' do
    Scene.get_scenes(@scene.book)
    visit scene_url(@scene)
    assert_text 'A00001'
    take_screenshot
    within '#side_controls' do
      assert_no_selector '.fa-angle-left'
      assert_selector '.fa-angle-right'
    end
    take_screenshot
  end

  test 'visiting the scene 2' do
    Scene.get_scenes(@scene_11.book)
    visit scene_url(@scene_11)
    assert_text 'A00011'
    within '#side_controls' do
      assert_selector '.fa-angle-left'
      assert_selector '.fa-angle-right'
    end
    take_screenshot
  end

  test 'visiting the scene 3' do
    Scene.get_scenes(@scene_9.book)
    visit scene_url(@scene_9)
    assert_text 'A00009'
    within '#side_controls' do
      assert_selector '.fa-angle-left'
      assert_no_selector '.fa-angle-right'
    end
    take_screenshot
  end

  test 'visiting the scene 4' do
    Scene.get_scenes(@scene_6.book)
    visit scene_url(@scene_6)
    assert_text 'A00004'
    within '#side_controls' do
      assert_no_selector '.fa-angle-left'
      assert_selector '.fa-angle-right'
    end
    take_screenshot
  end

  test 'creating a Scene' do
    visit key_point_url(@key_point)
    Capybara.page.find('.fa-plus', match: :first).click
    click_on 'New Scene'

    assert_text 'Abc'

    fill_in 'Abc', with: 'G00001'
    check 'Check' if @scene.check
    fill_in 'Scene sequel', with: @scene.scene_sequel
    fill_in 'Time', with: @scene.date_string

    # fill_in_rich_text_area "scene_summary", with: "Test 1"
    # assert_text "Test 1"
    # take_screenshot

    # fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    # fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    # fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    # fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    # fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    # fill_in_rich_text_area "scene_place", with: @scene.place
    # fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal

    click_on 'Create Scene'

    assert_text 'Scene was successfully created'
    click_on 'Back'
  end

  test 'not creating a Scene' do
    visit key_point_url(@key_point)
    Capybara.page.find('.fa-plus', match: :first).click
    click_on 'New Scene'

    fill_in 'Abc', with: ''
    check 'Check' if @scene.check
    fill_in 'Scene sequel', with: @scene.scene_sequel
    fill_in 't_years', with: ''

    # fill_in_rich_text_area "scene_conflict_dilemma", with: @scene.conflict_dilemma
    # fill_in_rich_text_area "scene_disaster_decision", with: @scene.disaster_decision
    # fill_in_rich_text_area "scene_goal_reaction", with: @scene.goal_reaction
    # fill_in_rich_text_area "scene_long_term_goal", with: @scene.long_term_goal
    # fill_in_rich_text_area "scene_over_arching_goal", with: @scene.over_arching_goal
    # fill_in_rich_text_area "scene_place", with: @scene.place
    # fill_in_rich_text_area "scene_short_term_goal", with: @scene.short_term_goal
    fill_in_rich_text_area 'scene_summary', with: @scene.summary
    assert_text @scene.summary.to_plain_text
    take_screenshot

    click_on 'Create Scene'

    assert_text "Abc can't be blank"
    click_on 'Back'
  end
end
end
