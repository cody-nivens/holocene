require 'test_helper'

class CitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citation = citations(:one)
    @biblioentry = biblioentries(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
      get biblioentry_citations_url(:biblioentry_id => @biblioentry.id)
    assert_response :success
  end

  test "should get new" do
      get new_biblioentry_citation_url(:biblioentry_id => @biblioentry.id)
    assert_response :success
  end

  test "should create citation" do
    assert_difference('Citation.count') do
        post biblioentry_citations_url(:biblioentry_id => @biblioentry.id), params: { citation: { body: @citation.body, name: @citation.name, user_id: @user.id, biblioentry_id: @biblioentry.id } }
    end

    assert_redirected_to biblioentry_citation_url(Citation.last.biblioentry, Citation.last)
  end

  test "should not create citation" do
    assert_difference('Citation.count', 0) do
        post biblioentry_citations_url(:biblioentry_id => @biblioentry.id), params: { citation: { body: @citation.body, name: "", user_id: @user.id, biblioentry_id: @biblioentry.id} }
    end

    assert_response :success
  end

  test "should show citation" do
      get biblioentry_citation_url(:biblioentry_id => @biblioentry.id,:id => @citation.id)
    assert_response :success
  end

  test "should get edit" do
      get edit_biblioentry_citation_url(:biblioentry_id => @biblioentry.id,:id => @citation.id)
    assert_response :success
  end

  test "should update citation" do
      patch biblioentry_citation_url(:biblioentry_id => @biblioentry.id,:id =>  @citation.id), params: { citation: { body: @citation.body, name: @citation.name, biblioentry_id: @biblioentry.id } }
      assert_redirected_to biblioentry_citation_url(@biblioentry,@citation)
  end

  test "should not update citation" do
      patch biblioentry_citation_url(@citation.biblioentry,@citation), params: { citation: { body: @citation.body, name: "", biblioentry_id: @biblioentry.id } }
    assert_response :success
  end

  test "should destroy citation" do
    assert_difference('Citation.count', -1) do
        delete biblioentry_citation_url(:biblioentry_id => @biblioentry.id,:id => @citation.id)
    end

    assert_redirected_to biblioentry_citations_url(:biblioentry_id => @biblioentry.id)
  end
end
