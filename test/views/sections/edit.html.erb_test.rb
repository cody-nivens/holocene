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
    assert_response :success

    assert_template 'sections/edit'
  end
end
