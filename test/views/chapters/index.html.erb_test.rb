require 'test_helper'

class ChaptersIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @chapter= chapters(:chapter_1)
    @scripted = @chapter.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_url([@scripted, :chapters])

    assert_response 200
    @chapters = Chapter.all

    assert_select "a[text()=?]",'New Chapter'
    assert_select "a[href=?]", new_polymorphic_path([@scripted, :chapter])
    assert_select ".footer>div>a", 4
    assert_template 'chapters/index'

    assert_select 'h1','Chapters'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
