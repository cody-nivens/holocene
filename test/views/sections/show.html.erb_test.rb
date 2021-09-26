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

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_section_path(@section)
    assert_select 'a[text()=?]', 'Timeline'
    assert_select 'a[href=?]', section_timeline_path(section_id: @section.id)
    assert_select 'a[text()=?]', 'Display'
    assert_select 'a[href=?]', section_display_path(section_id: @section.id)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@sectioned)
    assert_select 'a[text()=?]', 'Map'
    assert_select 'a[href=?]', geo_map_section_path(@section)
    assert_select 'a[text()=?]', 'Footnotes'
    assert_select 'a[href=?]', section_footnotes_path(@section)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@sectioned)

    assert_select '.footer>div>a', 7
    assert_template 'sections/show'
  end
end
