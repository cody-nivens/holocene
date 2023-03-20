# frozen_string_literal: true

require 'test_helper'

class SignetsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @signet = signets(:signet_1)
    @sigged = @signet.sigged

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_url([@sigged, :signets])

    assert_response 200
    @signets = Signet.all

    assert_select 'a[title=?]', 'New Signet'
    assert_select 'a[href=?]', new_polymorphic_path([@sigged, :signet])
    assert_template 'signets/index'

    assert_select 'h2', "Signets - #{@sigged.class.name}: #{@sigged.name}"

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
