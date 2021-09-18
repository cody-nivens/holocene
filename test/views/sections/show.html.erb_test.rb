require 'test_helper'

class SectionsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section= sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test "should show section" do
    get section_path(@section)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_section_path(@section)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 7
    assert_template 'sections/show'
  end
end
