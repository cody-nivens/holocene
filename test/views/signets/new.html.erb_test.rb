# frozen_string_literal: true

require 'test_helper'

class SignetsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @signet = signets(:signet_1)
    @sigged = @signet.sigged

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@sigged, :signet])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@sigged, :signets])
    assert_template 'signets/new'
  end
end
