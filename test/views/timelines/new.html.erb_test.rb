# frozen_string_literal: true

require 'test_helper'

class TimelinesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_timeline_url
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', timelines_path
    assert_template 'timelines/new'
  end
end
