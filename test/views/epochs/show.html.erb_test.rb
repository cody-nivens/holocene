# frozen_string_literal: true

require 'test_helper'

class EpochsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:epoch_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show epoch' do
    get epoch_path(@epoch)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_epoch_path(@epoch)
    assert_select 'a[title=?]', 'Timeline'
    assert_select 'a[href=?]', epoch_timeline_path(@epoch)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_epoch_path(@epoch)
    assert_select 'a[title=?]', 'Back'
    assert_template 'epochs/show'
  end
end
