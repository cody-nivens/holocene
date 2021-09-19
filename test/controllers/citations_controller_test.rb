# frozen_string_literal: true

require 'test_helper'

class CitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @footnote = footnotes(:footnote_1)
    @chapter = chapters(:chapter_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get chapter_citations_url(chapter_id: @chapter.id)
    assert_response :success
  end

  test 'should update citations' do
    patch chapter_citations_url(chapter_id: @chapter.id),
          params: { cit_ids: [footnotes(:footnote_1).id], biblioentries_ids: [biblioentries(:biblioentry_1).id] }
    assert_redirected_to chapter_citations_url(@chapter)
  end
end
