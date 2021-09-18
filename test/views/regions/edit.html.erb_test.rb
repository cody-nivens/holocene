require 'test_helper'

class RegionsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @region= regions(:Africa)

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_region_url(@region)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", region_path(@region)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", regions_path
    assert_select ".footer>div>a", 2
    assert_template 'regions/edit'
  end
end
