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

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_epoch_path(@epoch)
    assert_select 'a[text()=?]', 'Timeline'
    assert_select 'a[href=?]', epoch_timeline_path(@epoch)
    assert_select 'a[text()=?]', 'Map'
    assert_select 'a[href=?]', geo_map_epoch_path(@epoch)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 4
    assert_template 'epochs/show'
  end
end
