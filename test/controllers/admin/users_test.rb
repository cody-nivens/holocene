# frozen_string_literal: true

require 'test_helper'

class Admin::UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:users_2)
    sign_in @user
  end

  test 'should get index' do
    get admin_users_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post admin_users_url, params: { user: { password: 'test99', password_confirmation: 'test99', email: 'errgy@example.com' } }
    end

    assert_redirected_to admin_user_url(User.last)
  end

  test 'should not create user' do
    assert_difference('User.count', 0) do
      post admin_users_url, params: { user: { email: '' } }
    end

    assert_response :success
  end

  test 'should show user' do
    get admin_user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch admin_user_url(@user), params: { user: { email: @user.email, id: @user.id } }
    assert_redirected_to admin_user_url(@user)
  end

  test 'should not update user' do
    patch admin_user_url(@user), params: { user: { email: '' } }
    assert_response :success
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_url
  end
end
