# frozen_string_literal: true

require 'test_helper'

class SectionsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_section_url(@section)
    assert_select 'a[text()=?]', 'Back'
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', section_path(@section)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@sectioned)
    assert_select '.footer>div>a', 2
    assert_template 'sections/edit'
  end
end
