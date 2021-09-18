require 'test_helper'

class ChaptersShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @chapter= chapters(:chapter_1)
    @scripted = @chapter.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test "should show chapter" do
    get chapter_path(@chapter)
    assert_response :success

    assert_select "a[href=?]", edit_chapter_path(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@scripted, :chapters])
    assert_select ".footer>div>a", 12
    assert_template 'chapters/show'
  end
end
