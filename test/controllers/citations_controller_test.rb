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

  if 1 == 0
  test 'should get index' do
    get chapter_citations_url(chapter_id: @chapter.id)
    assert_response :success
  end

  test 'should update citations' do
    patch chapter_citations_url(chapter_id: @chapter.id),
          params: { cit_ids: [footnotes(:footnote_1).id], biblioentries_ids: [biblioentries(:biblioentry_1).id] }
    assert_redirected_to chapter_citations_url(@chapter)
  end

  test 'should update citations 2' do
    patch chapter_citations_url(chapter_id: @chapter.id),
          params: { }
    assert_redirected_to chapter_citations_url(@chapter)
  end
end

  test 'should show citation index TS' do
    get chapter_citations_url(chapter_id: @chapter.id, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test "should update citation TS" do
    patch chapter_citations_url(chapter_id: @chapter.id, format: :turbo_stream),
          params: { cit_ids: [footnotes(:footnote_1).id], biblioentries_ids: [biblioentries(:biblioentry_1).id] }

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end
end
