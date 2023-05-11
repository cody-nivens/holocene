# frozen_string_literal: true

require 'test_helper'

class RegionsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @region = regions(:Africa)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_region_url(@region)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', region_path(@region)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', regions_path
    assert_template 'regions/edit'
  end
end
