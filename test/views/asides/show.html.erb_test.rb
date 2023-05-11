# frozen_string_literal: true

require 'test_helper'

class AsidesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @aside = asides(:aside_1)
    @chapter = @aside.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show aside' do
    get aside_path(@aside)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_aside_path(@aside)
    assert_select 'a[title=?]', 'Back'
    assert_template 'asides/show'
  end
end
