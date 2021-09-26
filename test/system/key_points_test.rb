# frozen_string_literal: true

require 'application_system_test_case'

class KeyPointsTest < ApplicationSystemTestCase
  setup do
    @key_point = key_points(:key_point_1)
    @key_point_2 = key_points(:key_point_2)
    @key_point_3 = key_points(:key_point_3)
    @key_point_9 = key_points(:key_point_9)
    @scripted = books(:book_2)
    @story = @key_point.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test 'key_points index' do
    visit polymorphic_url([@scripted, :key_points])
#    visit New Key Point
    assert_text 'New Key Point'
    click_on 'New Key Point'
    assert_current_path new_polymorphic_path([@scripted, KeyPoint])
    click_on 'Back'
    #assert_current_path polymorphic_path([@scripted, :key_points])
    #assert_current_path polymorphic_path([@scripted, :key_points])
#    visit Scenes
    visit polymorphic_url([@scripted, :key_points])
    assert_text 'Scenes'
    click_on 'Scenes'
    assert_current_path polymorphic_path([@scripted, :scenes])
    click_on 'Back'
    assert_current_path polymorphic_path(@scripted)
#    visit Timeline
    visit polymorphic_url([@scripted, :key_points])
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path polymorphic_path([@scripted, :timeline])
    click_on 'Back'
    #assert_current_path polymorphic_path(@scripted)
  end

  test 'key_points list' do
    visit polymorphic_url([@key_point.scripted, @key_point, :list])
#    visit New Scene
    assert_text 'New Scene'
    click_on 'New Scene'
    assert_current_path new_key_point_scene_path(@key_point, selector: @selector.to_i)
    click_on 'Back'
    assert_current_path polymorphic_path([@key_point.scripted, :key_points])
  end

  test 'key_points show' do
    visit key_point_url(@key_point)
#    visit Move
    assert_text 'Move'
    click_on 'Move'
    assert_current_path polymorphic_path([@key_point.scripted, @key_point, :move])
    click_on 'Back'
    assert_current_path polymorphic_path(@key_point.scripted)
  end

  test 'sort key points' do
    visit books_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'
    click_on 'The Beginnings'
    assert_text 'Climate Change'

    Timeout.timeout(Capybara.default_max_wait_time) do
      sleep(0.1) until page.evaluate_script('jQuery.active').zero? && page.has_css?('.ui-sortable')
    end

    assert_match /#{@key_point.name}.*#{@key_point_3.name}.*#{@key_point_9.name}/m, page.html
    draggable = find(:css, "#key_point-#{@key_point_3.id}")
    droppable = find(:css, "#key_point-#{@key_point.id}")

    draggable.drag_to(droppable)
    wait_for_ajax
    assert_match /#{@key_point_3.name}.*#{@key_point.name}.*#{@key_point_9.name}/m, page.html
    visit current_path
    assert_match /#{@key_point_3.name}.*#{@key_point.name}.*#{@key_point_9.name}/m, page.html
  end

  test 'creating a Key point' do
    visit books_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'
    click_on 'The Beginnings'
    assert_text 'Climate Change'
    assert_text 'New Key Point'
    click_on 'New Key Point'

    fill_in 'Climax', with: @key_point.climax
    fill_in 'First pinch point', with: @key_point.first_pinch_point
    fill_in 'First plot point', with: @key_point.first_plot_point
    fill_in 'Hook', with: @key_point.hook
    fill_in 'Inciting incident', with: @key_point.inciting_incident
    fill_in 'Key element', with: @key_point.key_element
    fill_in 'Midpoint', with: @key_point.midpoint
    fill_in 'Second pinch point', with: @key_point.second_pinch_point
    fill_in 'Third plot point', with: @key_point.third_plot_point
    click_on 'Create Key point'

    assert_text 'Key point was successfully created'
    click_on 'Back'
  end

  test 'not creating a Key point' do
    visit books_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'
    click_on 'The Beginnings'
    assert_text 'Climate Change'
    assert_text 'New Key Point'
    click_on 'New Key Point'

    fill_in 'Climax', with: @key_point.climax
    fill_in 'First pinch point', with: @key_point.first_pinch_point
    fill_in 'First plot point', with: @key_point.first_plot_point
    fill_in 'Hook', with: ''
    fill_in 'Inciting incident', with: @key_point.inciting_incident
    fill_in 'Key element', with: @key_point.key_element
    fill_in 'Midpoint', with: @key_point.midpoint
    fill_in 'Second pinch point', with: @key_point.second_pinch_point
    fill_in 'Third plot point', with: @key_point.third_plot_point
    click_on 'Create Key point'

    assert_text "Hook can't be blank"
    click_on 'Back'
  end
end
