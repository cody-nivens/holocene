require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chapter = chapters(:chapter_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_chapters_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'New Chapter'
    assert_select "a[href=?]", new_book_chapter_path(@chapter.book)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 2
  end

  test "should get holocene events" do
      get chapter_holocene_events_url(@chapter)
    assert_response :success
  end

  test "should get new" do
    get new_book_chapter_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_chapters_path(@book)
    assert_select ".footer>div>a", 1
  end

  test "should create chapter" do
    assert_difference('Chapter.count') do
        post book_chapters_url(@book), params: { chapter: { body: @chapter.body, name: @chapter.name, position: @chapter.position, book_id: @chapter.book_id} }
    end

    assert_redirected_to book_chapter_url(@book, Chapter.last)
  end

  test "should not create chapter" do
    assert_difference('Chapter.count', 0) do
        post book_chapters_url(@book), params: {  chapter: { body: @chapter.body, name: "", position: @chapter.position, book_id: @chapter.book_id } }
    end

    assert_response :success
  end

  test "should show chapter" do
    get book_chapter_url(:book_id => @book.id, :id => @chapter.id)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_book_chapter_path(@book,@chapter)
    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", chapter_timeline_path(@chapter)
    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", chapter_display_path(@chapter)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_chapter_path(@chapter)
    assert_select "a[text()=?]",'Footnotes'
    assert_select "a[href=?]", chapter_footnotes_path(@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_chapters_path(@book)
    assert_select ".footer>div>a", 6
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
#    get book_chapter_url(@book, @chapter, :format => :pdf)
#    assert_response :success
#  end

  test "should show chapter sections" do
    get book_chapter_sections_url(:book_id => @book.id, :chapter_id => @chapter.id)
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
    get edit_book_chapter_url(:book_id => @book.id, :id => @chapter.id)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", book_chapter_path(@book,@chapter)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_chapters_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should update chapter" do
    patch book_chapter_url(:book_id => @book.id, :id => @chapter.id), params: { chapter: { body: @chapter.body, name: @chapter.name, position: @chapter.position, book: @book } }
    assert_redirected_to book_chapter_url(@book, @chapter)
  end

  test "should not update chapter" do
    patch book_chapter_url(:book_id => @book.id, :id => @chapter.id), params: { chapter: { body: @chapter.body, name: "", position: @chapter.position, book: @book } }
    assert_response :success
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete book_chapter_url(:book_id => @book.id, :id => @chapter.id)
    end

    assert_redirected_to book_chapters_url(@book)
  end
end
