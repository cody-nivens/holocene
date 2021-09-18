require 'test_helper'

class ArtifactsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact= artifacts(:artifact_1)
    @book = @artifact.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should show artifact" do
    get artifact_path(@artifact)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_artifact_path(@artifact)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 2
    assert_template 'artifacts/show'
  end
end
