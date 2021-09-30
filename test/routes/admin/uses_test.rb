# test/routes/admin/users_test.rb
require 'test_helper'

class Admin::UsersRouteTest < ActionDispatch::IntegrationTest
  test 'create' do
    assert_routing({ method: :post, path: '/admin/users' }, { controller: 'admin/users', action: 'create' })
  end

  test 'destroy' do
    assert_routing({ method: :delete, path: '/admin/users/1' }, { controller: 'admin/users', action: 'destroy', id: '1' })
  end

  test 'edit' do
    assert_routing '/admin/users/1/edit', controller: 'admin/users', action: 'edit', id: '1'
  end

  test 'index' do
    assert_routing '/admin/users', controller: 'admin/users', action: 'index'
  end

  test 'new' do
    assert_routing '/admin/users/new', controller: 'admin/users', action: 'new'
  end

  test 'update' do
    assert_routing({ method: 'patch', path: '/admin/users/1' }, { controller: 'admin/users', action: 'update', id: '1' })
  end
end
