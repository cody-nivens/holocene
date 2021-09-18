require 'test_helper'

class ChaptersEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @chapter= chapters(:chapter_1)
    @scripted = @chapter.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_chapter_url(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", chapter_path(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@scripted, :chapters])
    assert_select ".footer>div>a", 2
    assert_template 'chapters/edit'
  end
end
