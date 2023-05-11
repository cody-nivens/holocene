# frozen_string_literal: true

require 'test_helper'

class ChaptersShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show chapter' do
    get chapter_path(@chapter)
    assert_response :success

    assert_select 'a[href=?]', edit_chapter_path(@chapter)
    assert_select 'a[title=?]', 'Back'
    assert_template 'chapters/show'
  end
end
