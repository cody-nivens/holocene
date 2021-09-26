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

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_aside_path(@aside)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 2
    assert_template 'asides/show'
  end
end
