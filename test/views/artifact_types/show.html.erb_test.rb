require 'test_helper'

class ArtifactTypesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type= artifact_types(:artifact_type_1)
    @book = @artifact_type.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should show artifact_type" do
    get artifact_type_path(@artifact_type)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_artifact_type_path(@artifact_type)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 2
    assert_template 'artifact_types/show'
  end
end
