require 'test_helper'

class ScenesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @scene= scenes(:scene_1)
    @key_point = @scene.key_point

    @user = users(:users_1)
    sign_in @user
  end

  test "should show scene" do
    get scene_path(@scene)
    assert_response :success

    assert_select "a[href=?]", edit_scene_path(@scene)
    assert_select "a[href=?]", key_point_path(@key_point)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 6
    assert_template 'scenes/show'
  end
end
