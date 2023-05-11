# frozen_string_literal: true

require 'test_helper'

class ChaptersGeoMapHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should map chapter' do
    get geo_map_chapter_url(id: @chapter.id)
    assert_response :success

    assert_select 'a[title=?]', 'Display'
    assert_select 'a[href=?]', chapter_display_path(@chapter)
    assert_select 'a[title=?]', 'Back'
    assert_template 'chapters/geo_map'
  end
end
