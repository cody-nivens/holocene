# frozen_string_literal: true

require 'application_system_test_case'

class EpochsTest < ApplicationSystemTestCase
  setup do
    @epoch = epochs(:epoch_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'epochs edit' do
    visit edit_epoch_url(@epoch)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Timeline'
    assert_current_path epoch_path(@epoch)
    click_on 'Back'
    assert_link 'New Epoch'
    assert_current_path epochs_path
  end

  test 'epochs geo_map' do
    visit geo_map_epoch_url(@epoch)
#    visit Display
    take_screenshot
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Timeline'
    assert_current_path "/epochs/display/#{@epoch.id}"
    click_on 'Back'
    assert_link 'Timeline'
    assert_current_path epoch_path(@epoch)
#    visit Timeline
    visit geo_map_epoch_url(@epoch)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_button 'Go'
    assert_current_path epoch_timeline_path(@epoch)
    click_on 'Back'
    assert_link 'Timeline'
    assert_current_path epoch_path(@epoch)
  end

  test 'epochs index' do
    visit epochs_url
#    visit New Epoch
    assert_link 'New Epoch'
    click_on 'New Epoch'
    assert_no_link 'New Epoch'
    assert_current_path new_epoch_path
    click_on 'Back'
    assert_link 'New Epoch'
    assert_current_path epochs_path
  end

  test 'epochs show edit' do
    visit epoch_url(@epoch)
#    visit Edit
    within '.footer' do
      assert_link 'Edit'
      click_on 'Edit'
    end
    assert_current_path edit_epoch_path(@epoch)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path epoch_path(@epoch)
  end

  test 'epochs show map' do
#    visit Map
    visit epoch_url(@epoch)
    assert_link 'Map'
    click_on 'Map'
    assert_link 'Timeline'
    assert_current_path geo_map_epoch_path(@epoch)
    click_on 'Back'
    assert_link 'Timeline'
    assert_current_path epoch_path(@epoch)
  end

  test 'epochs show timeline' do
#    visit Timeline
    visit epoch_url(@epoch)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    assert_current_path epoch_timeline_path(@epoch)
    click_on 'Back'
    assert_text @epoch.name
    assert_current_path epoch_path(@epoch)
  end

  test 'visiting the Epoch index' do
    visit epochs_url
    assert_selector 'h2', text: 'Epochs'
    assert_link 'New Epoch'
    assert_no_text 'link_to'
    click_on 'Show', match: :first
    assert_text 'Dog buried inside'
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    #click_on 'Back'
  end

  test 'visiting the map' do
    visit epochs_url
    assert_selector 'h2', text: 'Epochs'
    assert_link 'New Epoch'
    assert_no_text 'link_to'
    click_on 'Show', match: :first
    assert_text 'Dog buried inside'
    assert_link 'Map'
    click_on 'Map'
    assert_link 'Back'
    click_on 'Back'
  end

  test 'creating a Epoch' do
    visit epochs_url
    click_on 'New Epoch'

    fill_in 'End date', with: @epoch.end_date
    fill_in 'Name', with: @epoch.name
    fill_in 'Start date', with: @epoch.start_date
    click_on 'Create Epoch'

    assert_text 'Epoch was successfully created'
    click_on 'Back'
  end

  test 'should not create a Epoch' do
    visit epochs_url
    click_on 'New Epoch'

    fill_in 'End date', with: @epoch.end_date
    fill_in 'Name', with: ''
    fill_in 'Start date', with: @epoch.start_date
    click_on 'Create Epoch'

    assert_text "can't be blank"

    fill_in 'Name', with: @epoch.name
    click_on 'Create Epoch'
    assert_text 'Epoch was successfully created'
    click_on 'Back'
  end
end
