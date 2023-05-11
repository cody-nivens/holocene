# frozen_string_literal: true

require 'test_helper'

class SectionsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show section' do
    get section_path(@section)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_section_path(@section)
    assert_select 'a[title=?]', 'Timeline'
    assert_select 'a[href=?]', section_timeline_path(section_id: @section.id)
    assert_select 'a[title=?]', 'Display'
    assert_select 'a[href=?]', section_display_path(section_id: @section.id)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@sectioned)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_section_path(@section)
    assert_select 'a[title=?]', 'Footnotes'
    assert_select 'a[href=?]', section_footnotes_path(@section)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@sectioned)

    assert_template 'sections/show'
  end
end
