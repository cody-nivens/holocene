# frozen_string_literal: true

require 'test_helper'

class RegionsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @region = regions(:Africa)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show region' do
    get region_path(@region)
    assert_response :success

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_region_path(@region)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', regions_path
    assert_select '.footer>div>a', 2
    assert_template 'regions/show'
  end
end
