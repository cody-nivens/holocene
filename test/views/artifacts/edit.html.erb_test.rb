require 'test_helper'

class ArtifactsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact= artifacts(:artifact_1)
    @book = @artifact.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_artifact_url(@artifact)
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", artifact_path(@artifact)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@book, :artifacts])
    assert_select ".footer>div>a", 2
    assert_template 'artifacts/edit'
  end
end
