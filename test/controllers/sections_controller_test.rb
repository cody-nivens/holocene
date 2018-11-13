require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_one)
    @chapter = chapters(:chapter_one)
    @book = books(:book_one)
    @user = users(:one)
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
