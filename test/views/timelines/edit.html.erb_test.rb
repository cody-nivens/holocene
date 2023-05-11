# frozen_string_literal: true

require 'test_helper'

class TimelinesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_timeline_url(@timeline)
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', timeline_path(@timeline)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', timelines_path
    assert_template 'timelines/edit'
  end
end
