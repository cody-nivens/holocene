# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @book_2 = books(:book_2)
    @book_3 = books(:book_3)
    @user = users(:users_1)
    sign_in @user
  end

if 1 == 0
  test 'should sort books' do
    patch book_sort_url(book_id: @book_2.id), xhr: true, params: { book: { id: @book_2.id, user_id: @book_2.user_id } }
    assert_response :success
  end

  test 'should get resync_stories' do
    get book_resync_stories_url(@book_2)
    assert_redirected_to book_stories_url(@book_2)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should get index 2' do
    get books_url, params: { long: true }
    assert_response :success
  end

  test 'should get toc' do
    get toc_url(@book.id)
    assert_response :success
  end

  #  test "should get export" do
  #    get book_export_url(@book)
  #    assert_response :success
  #  end

  test 'should create book' do
    assert_difference('Book.count') do
      post books_url, params: { book: { body: @book.body, name: @book.name, user_id: @user.id } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test 'should not create book' do
    assert_difference('Book.count', 0) do
      post books_url, params: { book: { body: @book.body, name: '', user_id: @user.id } }
    end

    assert_response :success
  end

  test 'should publish all stories' do
    get book_publish_url(@book_2)
    assert_response :success
  end

  test 'should import characters' do
    post book_import_chars_url(@book_2), params: { characters: [characters(:character_2).id], char_book_id: @book_3.id }
    assert_response :success
  end

  test 'should char imports' do
    get book_chars_import_url(@book_2)
    assert_response :success
  end

  test 'should show book II' do
    get book_url(@book_2)
    assert_response :success
  end

  test 'should view book I' do
    get book_view_url(@book)
    assert_response :success
  end

  test 'should view book II' do
    get book_view_url(@book_2)
    assert_response :success
  end

  test 'should show stats' do
    get book_stats_url(@book_2)
    assert_response :success
  end

  test 'should get timeline' do
    get book_timeline_url(@book_2)
    assert_response :success
  end

  test 'should get timeline 2' do
    get book_timeline_url(@book_2), params: { toggle: 'on' }
    assert_response :success
  end

  test 'should get timeline 3' do
    get book_timeline_url(@book_2), params: { toggle: 'off' }
    assert_response :success
  end

  test 'should show book 2' do
    get book_url(@book_2)
    assert_response :success
  end

  test 'should show pdf book' do
    get book_url(@book, format: :pdf)
    assert_response :success
  end

  test 'should get epub' do
    get book_epub_url(@book)
    assert_response :success
  end

  test 'should get epub 2' do
    get book_epub_url(@book_2)
    assert_response :success
  end

  test 'should get chars' do
    get book_chars_url(@book)
    assert_response :success
  end

  test 'should update book' do
    patch book_url(@book), params: { book: { body: @book.body, name: @book.name, user_id: @user.id } }
    assert_redirected_to book_url(@book)
  end

  test 'should not update book' do
    patch book_url(@book), params: { book: { body: @book.body, name: '', user_id: @user.id } }
    assert_response :success
  end

  test 'should destroy book' do
    if ["0","1"].include?(ENV['PARALLEL_WORKERS'])
      ThinkingSphinx::Test.run do
        assert_difference('Book.count', -1) do
          delete book_url(@book)
        end
      end

      assert_redirected_to books_url
    end
  end
end


  test 'should get edit' do
    get edit_book_url(@book)
    assert_response :success
  end

  test 'should get new' do
    get new_book_url
    assert_select "turbo-frame", id: "new_object", target: "edit"
    assert_response :success
  end

  test 'should show book TS 2' do
    get book_url(@book, format: :turbo_stream)

    assert_select "turbo-frame", id:  "#{dom_id @book}"
    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show book index TS' do
    get books_url(format: :turbo_stream)

    assert_select "turbo-frame", id:  "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test "should show book TS" do
    get book_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

  test "should report book TS" do
    [ "books/stats", "books/scenes"].each do |report|
      get book_report_url(@book, format: :turbo_stream),
        params: { report: report }

      assert_turbo_stream action: :replace, target: "objects"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_response :success
    end
  end

  test "should create book TS" do
    assert_difference('Book.count') do
      post books_url(format: :turbo_stream), params: { book: { body: @book.body, name: @book.name, user_id: @user.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update book TS" do
    patch book_url(@book, format: :turbo_stream), params: { book: { body: @book.body, name: @book.name, user_id: @user.id } }
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"
    assert_response :success
  end

  test "should destroy book TS" do
    assert_difference('Book.count', -1) do
      delete book_url(@book, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
