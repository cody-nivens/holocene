# frozen_string_literal: true

require 'test_helper'

class Admin::DashboardTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:users_2)
    sign_in @user
  end

  test 'should get dashboard' do
    get admin_dashboard_url
    assert_response :success
  end

end
