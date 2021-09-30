# frozen_string_literal: true

require 'application_system_test_case'

class RegionsTest < ApplicationSystemTestCase
  setup do
    @region = regions(:Africa)
    @user = users(:users_1)
    sign_in @user
  end

  test 'regions edit' do
    visit edit_region_url(@region)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path region_path(@region)
    click_on 'Back'
    assert_link 'New Region'
    assert_current_path regions_path
  end

  test 'regions index' do
    visit regions_url
#    visit New Region
    assert_link 'New Region'
    click_on 'New Region'
    assert_no_link 'New Region'
    assert_current_path new_region_path
    click_on 'Back'
    assert_link 'New Region'
    assert_current_path regions_path
  end

  test 'regions show' do
    visit region_url(@region)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_region_path(@region)
    click_on 'Back'
    assert_link 'New Region'
    assert_current_path regions_path
  end

  test 'creating a Region' do
    visit regions_url
    click_on 'New Region'

    fill_in 'Name', with: @region.name
    fill_in_rich_text_area 'region_body', with: 'Test 1'

    click_on 'Create Region'

    assert_text 'Region was successfully created'
    click_on 'Back'
  end

  test 'should not create a Region' do
    visit regions_url
    click_on 'New Region'

    fill_in 'Name', with: ''
    fill_in_rich_text_area 'region_body', with: 'Test 1'

    click_on 'Create Region'

    assert_text "can't be blank"

    fill_in 'Name', with: @region.name
    click_on 'Create Region'
    assert_text 'Region was successfully created'
    click_on 'Back'
  end
end
