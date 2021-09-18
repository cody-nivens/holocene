require 'test_helper'

class TimelinesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline= timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test "should show timeline" do
    get timeline_path(@timeline)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_timeline_path(@timeline)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 5
    assert_template 'timelines/show'
  end
end
