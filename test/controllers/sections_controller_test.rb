require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get chapter_sections_url( @chapter)
    assert_response :success

    assert_select "a[text()=?]",'New Section'
    assert_select "a[href=?]", new_chapter_section_path(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", chapter_path(@section.chapter)
    assert_select ".footer>div>a", 2
  end

  test "should get new" do
    get new_chapter_section_url( @chapter)
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", chapter_sections_path(@section.chapter)
    assert_select ".footer>div>a", 1
  end

  test "should create section" do
    assert_difference('Section.count') do
        post chapter_sections_url( @chapter), params: {:chapter_id => @chapter.id, section: { body: @section.body, name: "#{@section.name}1", position: @section.position, chapter_id: @chapter.id } }
    end

    assert_redirected_to chapter_section_url( @chapter, Section.last)
  end

  test "should not create section" do
    assert_difference('Section.count', 0) do
        post chapter_sections_url( @chapter), params: {:chapter_id => @chapter.id, section: { body: @section.body, name: "", position: @section.position, chapter_id: @chapter.id } }
    end

    assert_response :success
  end

  test "should show section" do
    get chapter_section_url( @chapter,@section)
    assert_response :success

    assert_select "a[text()=?]",'Footnotes'
    assert_select "a[href=?]", section_footnotes_path(@section)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", chapter_path(@section.chapter)
    assert_select ".footer>div>a", 7
  end

  test "should map section" do
    get geo_map_section_url(@section)
    assert_response :success
  end

  test "should add event for section" do
      get section_add_event_url(:section_id => @section.id)
    assert_response :success
  end

  test "should show section timeline" do
    get section_timeline_url(@section)
    assert_response :success

    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", timeline_display_path(@section)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 2
  end

  test "should show section events" do
    get section_display_url(@section)
    assert_response :success

    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", section_timeline_path(@section)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_section_path(@section)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 3
  end

  test "should get edit" do
    get edit_chapter_section_url( @chapter,@section)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", chapter_section_path(@chapter,@section)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", chapter_sections_path(@section.chapter)
    assert_select ".footer>div>a", 2
  end

  test "should update section" do
      patch chapter_section_url( @chapter, @section), params: {:chapter_id => @chapter.id,  section: { body: @section.body, name: @section.name, position: @section.position, chapter_id: @chapter.id } }
      assert_redirected_to chapter_path(@chapter)
  end

  test "should not update section" do
      patch chapter_section_url(@chapter, @section), params: { :chapter_id => @chapter.id, section: { body: @section.body, name: "", position: @section.position, chapter: @section.chapter_id } }
      assert_response :success
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete chapter_section_url(@chapter, @section)
    end

    assert_redirected_to chapter_sections_url(@chapter)
  end
end
