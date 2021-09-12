require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chapter_5 = chapters(:chapter_5)
    @chapter_4 = chapters(:chapter_4)
    @chapter_2 = chapters(:chapter_2)
    @chapter = chapters(:chapter_1)
    @section = sections(:section_1)
    @scripted_1 = @chapter.scripted
    @scripted_2 = @chapter_5.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@scripted_1, :chapters])
    assert_response :success

    assert_select "a[text()=?]",'New Chapter'
    assert_select "a[href=?]", new_polymorphic_path([@chapter.scripted, Chapter])
    assert_select "a[href=?]", toc_path(@chapter.scripted)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 4
  end

  test "should get index 2" do
    get polymorphic_url([@scripted_2, :chapters])
    assert_response :success

    assert_select "a[text()=?]",'New Chapter'
    assert_select "a[href=?]", new_polymorphic_path([@chapter_5.scripted, Chapter])
    assert_select "a[href=?]", toc_path(@chapter_5.scripted)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 4
  end

  test "should get holocene events" do
      get chapter_holocene_events_url(@chapter)
    assert_response :success
  end

  test "should get new" do
    get new_polymorphic_url([@scripted_1, Chapter])
    assert_response :success

    assert_select "h1", text: "New Chapter"
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 1
  end

  test "should demote chapter" do
    assert_difference('Chapter.count',-1) do
        get chapter_demote_url(@chapter_4)
    end

    assert_redirected_to polymorphic_url([@scripted_1, :chapters])
  end

  test "should demote chapter 2" do
    assert_difference('Chapter.count',-1) do
        get chapter_demote_url(@chapter)
    end

    assert_redirected_to polymorphic_url([@scripted_1, :chapters])
  end

  test "should promote chapter" do
    assert_difference('Chapter.count',1) do
      get chapter_section_promote_url(:id => @chapter_4.id,:section_id => @chapter_4.sections[1].id)
    end

    assert_redirected_to polymorphic_url([@scripted_1, :chapters])
  end

  test "should not create chapter" do
    assert_difference('Chapter.count', 0) do
        post polymorphic_url([@scripted_1, :chapters]), params: {  chapter: { body: @chapter.body, name: "", position: @chapter.position, scripted_id: @chapter.scripted_id, scripted_type: 'Book' } }
    end

    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count', 1) do
        post polymorphic_url([@scripted_1, :chapters]), params: { chapter: { body: @chapter.body, name: "Test", position: @chapter.position, scripted_type: 'Book', scripted_id: @chapter.scripted_id } }
    end

    assert_redirected_to polymorphic_path([@scripted_1, Chapter.last])
  end

  test "should show chapter" do
    get polymorphic_url([@scripted_1, @chapter])
    assert_response :success

    assert_select "a[text()=?]",'Footnotes'
    assert_select "a[href=?]", chapter_footnotes_path(@chapter)
    assert_select "a[text()=?]",'Citations'
    assert_select "a[href=?]", chapter_citations_path(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@scripted_1, :chapters])
    assert_select ".footer>div>a", 12
  end

  test "should map chapter" do
    get geo_map_chapter_url(:id => @chapter.id)
    assert_response :success

    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", chapter_display_path(@chapter)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 2
  end

#  test "should show pdf chapter" do
#    get polymorphic_url(@scripted_1, @chapter, :format => :pdf)
#    assert_response :success
#  end

  test "should show chapter sections" do
    get chapter_sections_url(:chapter_id => @chapter.id)
    assert_response :success
  end

  test "should show chapter timeline" do
      get chapter_timeline_url(:chapter_id => @chapter.id)
    assert_response :success
  end

  test "should show chapter timeline 2" do
      get chapter_timeline_url(:chapter_id => @chapter.id), params: { toggle: "on" }
    assert_response :success
  end

  test "should show chapter display" do
    get chapter_display_url(chapters(:chapter_3))
    assert_response :success
  end

  test "should get edit" do
    get edit_polymorphic_url([@scripted_1, @chapter])
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", polymorphic_path([@scripted_1,@chapter])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@scripted_1, :chapters])
    assert_select ".footer>div>a", 2
  end

  test "should update chapter" do
    patch polymorphic_url([@scripted_1, @chapter]), params: { chapter: { body: @chapter.body, name: @chapter.name, position: @chapter.position, scripted: @scripted_1 } }
    assert_redirected_to polymorphic_url([@scripted_1, @chapter])
  end

  test "should not update chapter" do
    patch polymorphic_url([@scripted_1, @chapter]), params: { chapter: { body: @chapter.body, name: "", position: @chapter.position, scripted: @scripted_1 } }
    assert_response :success
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete polymorphic_url([@scripted_1, @chapter])
    end

    assert_redirected_to polymorphic_url([@scripted_1, :chapters])
  end
end
