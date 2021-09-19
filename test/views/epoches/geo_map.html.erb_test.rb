# frozen_string_literal: true

require 'test_helper'

class EpochsGeoMapHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:epoch_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should map epoch' do
    get geo_map_epoch_url(id: @epoch.id)
    assert_response :success

    assert_select 'a[text()=?]', 'Timeline'
    assert_select 'a[href=?]', epoch_timeline_path(@epoch)
    assert_select 'a[text()=?]', 'Display'
    assert_select 'a[href=?]', epoch_display_path(@epoch)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 3
    assert_template 'epochs/geo_map'
  end
end
