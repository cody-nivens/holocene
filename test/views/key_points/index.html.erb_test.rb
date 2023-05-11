# frozen_string_literal: true

require 'test_helper'

class KeyPointsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_url([@scripted, :key_points])

    assert_response 200
    @key_points = KeyPoint.all

    assert_select 'a[title=?]', 'New Key Point'
    assert_select 'a[href=?]', new_polymorphic_path([@scripted, :key_point])
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@scripted)
    assert_select 'a[title=?]', 'Timeline'
    assert_select 'a[href=?]', polymorphic_path([@scripted, :timeline])
    assert_select 'a[title=?]', 'Scenes'
    assert_select 'a[href=?]', polymorphic_path([@scripted, :scenes])
    assert_template 'key_points/index'

    assert_select 'h2', 'Key Points'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
