# frozen_string_literal: true

require 'test_helper'

class AsidesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @aside = asides(:aside_1)
    @chapter = @aside.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@chapter, :aside])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', chapter_path(@chapter)
    assert_template 'asides/new'
  end
end
