# frozen_string_literal: true

require 'test_helper'

class RegionsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @region = regions(:Africa)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_region_url
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', regions_path
    assert_template 'regions/new'
  end
end
