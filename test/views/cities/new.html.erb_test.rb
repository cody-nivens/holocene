# frozen_string_literal: true

require 'test_helper'

class CitiesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:city_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_city_url
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', cities_path
    assert_select '.footer>div>a', 1
    assert_template 'cities/new'
  end
end
