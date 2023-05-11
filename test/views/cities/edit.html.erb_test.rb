# frozen_string_literal: true

require 'test_helper'

class CitiesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:city_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_city_url(@city)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', city_path
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', cities_path
    assert_template 'cities/edit'
  end
end
