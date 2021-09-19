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
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@scripted, :chapters])
    assert_select 'a[text()=?]', 'Footnotes'
    assert_select 'a[href=?]', chapter_footnotes_path(@chapter)
    assert_select 'a[text()=?]', 'Citations'
    assert_select 'a[href=?]', chapter_citations_path(@chapter)
    assert_select '.footer>div>a', 12
    assert_template 'chapters/show'
  end
end
