# frozen_string_literal: true

require 'test_helper'

class CitiesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:city_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show city' do
    get city_path(@city)
    assert_response :success

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_city_path(@city)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 2
    assert_template 'cities/show'
  end
end
