# frozen_string_literal: true

require 'test_helper'

class KeyPointsViewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get view' do
    get polymorphic_url([@key_point, :view])

    assert_response 200

    assert_template 'key_points/view'

    assert_select 'h2', 'The PhantomThe BeginningsClimate Change'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
