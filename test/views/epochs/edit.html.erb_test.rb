# frozen_string_literal: true

require 'test_helper'

class EpochsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:epoch_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_epoch_url(@epoch)
    assert_select 'a[text()=?]', 'Back'
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', epoch_path(@epoch)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', epochs_path
    assert_select '.footer>div>a', 2
    assert_template 'epochs/edit'
  end
end
