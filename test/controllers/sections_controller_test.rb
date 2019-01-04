require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
      @section = sections(:section_1)
      @chapter = chapters(:chapter_1)
      @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
      get book_chapter_sections_url(@book, @chapter)
    assert_response :success
  end

  test "should get new" do
      get new_book_chapter_section_url(@book, @chapter)
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
        post book_chapter_sections_url(@book, @chapter), params: {:chapter_id => @chapter.id, section: { body: @section.body, name: "#{@section.name}1", position: @section.position, chapter_id: @chapter.id } }
    end

    assert_redirected_to book_chapter_section_url(@book, @chapter, Section.last)
  end

  test "should not create section" do
    assert_difference('Section.count', 0) do
        post book_chapter_sections_url(@book, @chapter), params: {:chapter_id => @chapter.id, section: { body: @section.body, name: "", position: @section.position, chapter_id: @chapter.id } }
    end

    assert_response :success
  end

  test "should show section" do
    get book_chapter_section_url(@book, @chapter,@section)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_book_chapter_section_path(@book,@chapter,@section)
    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", section_timeline_path(@section)
    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", section_display_path(@section)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_section_path(@section)
    assert_select "a[text()=?]",'Footnotes'
    assert_select "a[href=?]", section_footnotes_path(@section)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_chapter_path(@section.chapter.book,@section.chapter)
    assert_select ".footer>div>a", 6
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
  end

  test "should show section events" do
    get section_display_url(@section)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_chapter_section_url(@book, @chapter,@section)
    assert_response :success
  end

  test "should update section" do
      patch book_chapter_section_url(@book, @chapter, @section), params: {:chapter_id => @chapter.id,  section: { body: @section.body, name: @section.name, position: @section.position, chapter_id: @chapter.id } }
    assert_redirected_to book_chapter_section_url(@book, @chapter, @section)
  end

  test "should not update section" do
      patch book_chapter_section_url(@book, @chapter, @section), params: { :chapter_id => @chapter.id, section: { body: @section.body, name: "", position: @section.position, chapter: @section.chapter_id } }
      assert_response :success
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete book_chapter_section_url(@book, @chapter, @section)
    end

    assert_redirected_to book_chapter_sections_url(@book, @chapter)
  end
end
