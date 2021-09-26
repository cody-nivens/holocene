# frozen_string_literal: true

require 'test_helper'

class AsidesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @aside = asides(:aside_1)
    @chapter = @aside.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_aside_url(@aside)
    assert_select 'a[text()=?]', 'Back'
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', aside_path(@aside)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', chapter_path(@chapter)
    assert_select 'a[text()=?]', 'Destroy'
    assert_select 'a[href=?]', aside_path(@aside)
    assert_select '.footer>div>a', 3
    assert_template 'asides/edit'
  end
end
