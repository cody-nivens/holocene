# frozen_string_literal: true

require 'test_helper'

class SectionsDisplayHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should display section events' do
    get section_display_path(@section)
    assert_response :success

    assert_select 'a[title=?]', 'Timeline'
    assert_select 'a[href=?]', section_timeline_path(@section)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_section_path(@section)
    assert_select 'a[title=?]', 'Back'
    assert_template 'holocene_events/display'
  end
end
