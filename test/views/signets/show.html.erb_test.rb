# frozen_string_literal: true

require 'test_helper'

class SignetsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @signet = signets(:signet_1)
    @sigged = @signet.sigged

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show signet' do
    get polymorphic_path([@sigged, @signet])
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_signet_path(@signet)
    assert_template 'signets/show'
  end
end
