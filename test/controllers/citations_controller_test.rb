require 'test_helper'

class CitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citation = citations(:one)
  end

  test "should get index" do
    get citations_url
    assert_response :success
  end

  test "should get new" do
    get new_citation_url
    assert_response :success
  end

  test "should create citation" do
    assert_difference('Citation.count') do
      post citations_url, params: { citation: { body: @citation.body, name: @citation.name } }
    end

    assert_redirected_to citation_url(Citation.last)
  end

  test "should not create citation" do
    assert_difference('Citation.count', 0) do
      post citations_url, params: { citation: { body: @citation.body, name: ""} }
    end

    assert_response :success
  end

  test "should show citation" do
    get citation_url(@citation)
    assert_response :success
  end

  test "should get edit" do
    get edit_citation_url(@citation)
    assert_response :success
  end

  test "should update citation" do
    patch citation_url(@citation), params: { citation: { body: @citation.body, name: @citation.name } }
    assert_redirected_to citation_url(@citation)
  end

  test "should not update citation" do
    patch citation_url(@citation), params: { citation: { body: @citation.body, name: "" } }
    assert_response :success
  end

  test "should destroy citation" do
    assert_difference('Citation.count', -1) do
      delete citation_url(@citation)
    end

    assert_redirected_to citations_url
  end
end
