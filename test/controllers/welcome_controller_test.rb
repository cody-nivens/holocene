# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get welcome_index_url
    assert_response :success
  end

  test 'should get history' do
    get welcome_history_url(format: :turbo_stream)
    assert_response :success
  end

  test 'should get show' do
    get welcome_show_url(@section, date: Date.today.beginning_of_day, format: :turbo_stream)
    assert_response :success
  end

  test 'should get stats' do
    get welcome_stats_url(format: :turbo_stream)
    assert_response :success
  end

  test 'should get tags' do
    get welcome_tags_url(format: :turbo_stream)
    assert_response :success
  end
end
