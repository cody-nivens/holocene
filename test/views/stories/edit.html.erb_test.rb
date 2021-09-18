require 'test_helper'

class StoriesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story= stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_story_url(@story)
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", story_path(@story)
    assert_select ".footer>div>a", 1
    assert_template 'stories/edit'
  end
end
