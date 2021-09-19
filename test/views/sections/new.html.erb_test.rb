# frozen_string_literal: true

require 'test_helper'

class SectionsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@sectioned, :section])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@sectioned)
    assert_select '.footer>div>a', 1
    assert_template 'sections/new'
  end
end
