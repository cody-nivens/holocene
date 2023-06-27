# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create user without role' do
    user = User.create!(email: 'zalo@alto.com',
                         password: '123456789',
                         password_confirmation: '123456789')
    assert_not_nil user
    assert user.is?(:newuser)
  end

  test 'create user with role' do
    user = User.create!(email: 'zalo@alto.com',
                         password: '123456789',
                         password_confirmation: '123456789')
    user.roles << Role.find_by_name('admin')
    assert user.is?(:admin)
  end

end
