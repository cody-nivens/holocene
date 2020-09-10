require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chapter_4 = chapters(:chapter_4)
    @chapter_2 = chapters(:chapter_2)
    @chapter = chapters(:chapter_1)
    @section = sections(:section_1)
    @scripted = @chapter.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@scripted, 'chapters'])
    assert_response :success

    assert_select "a[text()=?]",'New Chapter'
    assert_select "a[href=?]", new_polymorphic_path(@chapter.scripted)
    assert_select "a[href=?]", toc_path(@chapter.scripted)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 3
  end

  test "should get holocene events" do
      get chapter_holocene_events_url(@chapter)
    assert_response :success
  end

  test "should get new" do
    get new_polymorphic_url(@scripted)
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 1
  end

  test "should demote chapter" do
    assert_difference('Chapter.count',-1) do
        get chapter_demote_url(@chapter_4)
    end

    assert_redirected_to polymorphic_url([@scripted, 'chapters'])
  end

  test "should promote chapter" do
    assert_difference('Chapter.count',1) do
      get chapter_section_promote_url(:id => @chapter_2.id,:section_id => @chapter_2.sections[1].id)
    end

    assert_redirected_to polymorphic_url([@scripted, 'chapters'])
  end

  test "should not create chapter" do
    assert_difference('Chapter.count', 0) do
        post polymorphic_url([@scripted, 'chapters']), params: {  chapter: { body: @chapter.body, name: "", position: @chapter.position, scripted_id: @chapter.scripted_id, scripted_type: 'Book' } }
    end

    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count', 1) do
        post polymorphic_url([@scripted, 'chapters']), params: { chapter: { body: @chapter.body, name: "Test", position: @chapter.position, scripted_type: 'Book', scripted_id: @chapter.scripted_id } }
    end

    assert_redirected_to polymorphic_path([@scripted, Chapter.last])
  end

  test "should show chapter" do
    get polymorphic_url([@scripted, @chapter])
    assert_response :success

    assert_select "a[text()=?]",'Footnotes'
    assert_select "a[href=?]", chapter_footnotes_path(@chapter)
    assert_select "a[text()=?]",'Citations'
    assert_select "a[href=?]", chapter_citations_path(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@scripted, 'chapters'])
    assert_select ".footer>div>a", 11
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
#    get polymorphic_url(@scripted, @chapter, :format => :pdf)
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

  test "should show chapter display" do
    get chapter_display_url(chapters(:chapter_3))
    assert_response :success
  end

  test "should get edit" do
    get edit_polymorphic_url([@scripted, @chapter])
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", polymorphic_path([@scripted,@chapter])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@scripted, 'chapters'])
    assert_select ".footer>div>a", 2
  end

  test "should update chapter" do
    patch polymorphic_url([@scripted, @chapter]), params: { chapter: { body: @chapter.body, name: @chapter.name, position: @chapter.position, scripted: @scripted } }
    assert_redirected_to polymorphic_url([@scripted, @chapter])
  end

  test "should not update chapter" do
    patch polymorphic_url([@scripted, @chapter]), params: { chapter: { body: @chapter.body, name: "", position: @chapter.position, scripted: @scripted } }
    assert_response :success
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete polymorphic_url([@scripted, @chapter])
    end

    assert_redirected_to polymorphic_url([@scripted, 'chapters'])
  end
end
