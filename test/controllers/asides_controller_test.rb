require 'test_helper'

class AsidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aside = asides(:aside_1)
    @chapter = @aside.chapter
    @chapter_3 = chapters(:chapter_3)
    @book = @chapter.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_chapter_asides_url(@book,@chapter)
    assert_response :success
  end

  test "should get new" do
    get new_book_chapter_aside_url(@book.id,@chapter)
    assert_response :success
  end

  test "should create aside" do
    assert_difference('Aside.count') do
      post book_chapter_asides_url(@book,@chapter_3), params: { aside: { body: @aside.body, name: @aside.name }, book_id: @book.id, chapter_id: @chapter_3.id }
    end

    assert_redirected_to book_chapter_url(@book,@chapter_3)
  end

  test "should not create aside" do
    assert_difference('Aside.count',0) do
      post book_chapter_asides_url(@book,@chapter), params: { aside: { body: @aside.body, name: @aside.name }, book_id: @book.id, chapter_id: @chapter.id }
    end

    assert_response :success
  end

  test "should show aside" do
    get book_chapter_aside_url(@book,@chapter,@aside)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_chapter_aside_url(@book,@chapter,@aside)
    assert_response :success
  end

  test "should update aside" do
    patch book_chapter_aside_url(@book,@chapter,@aside), params: { aside: { body: @aside.body, name: @aside.name } }
    assert_redirected_to book_chapter_url(@book,@chapter)
  end

  test "should not update aside" do
    patch book_chapter_aside_url(@book,@chapter,@aside), params: { aside: { body: @aside.body, name: '' } }
    assert_response :success
  end

  test "should destroy aside" do
    assert_difference('Aside.count', -1) do
      delete book_chapter_aside_url(@book,@chapter,@aside)
    end

    assert_redirected_to book_chapter_url(@book,@chapter)
  end
end
