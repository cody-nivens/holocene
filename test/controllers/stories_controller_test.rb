# frozen_string_literal: true

require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_2)
    @book = @story.book
    @character = characters(:character_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should show stats' do
    get story_stats_url(@story)
    assert_response :success
  end

  test 'should sort stories' do
    patch story_sort_url(story_id: @story.id), xhr: true, params: { story: { id: @story.id, book_id: @story.book.id } }
    assert_response :success
  end

  test 'should get index' do
    get book_stories_url(book_id: @book.id)
    assert_response :success
  end

  test 'should get index 2' do
    get book_stories_url(book_id: @book.id, all: true)
    assert_response :success
  end

  test 'should get resync_scenes' do
    get story_resync_scenes_url(id: @story.id)
    assert_redirected_to story_url(@story)
  end

  test 'should get new' do
    get new_book_story_url(@book)
    assert_response :success
  end

  test 'should create story' do
    assert_difference('Story.count') do
      post book_stories_url(book_id: @book.id),
           params: { story: { book_id: @story.book.id, summary_body: @story.summary_body, title: @story.title } }
    end

    assert_redirected_to story_url(Story.last)
  end

  test 'should not create story' do
    assert_difference('Story.count', 0) do
      post book_stories_url(book_id: @book.id),
           params: { story: { book_id: @story.book.id, summary_body: @story.summary_body, title: '' } }
    end

    assert_response :success
  end

  test 'should get timeline' do
    get story_timeline_url(@story)
    assert_response :success
  end

  test 'should view story' do
    get story_view_url(@story)
    assert_response :success
  end

  test 'should view story outline' do
    get story_view_url(@story, outline: true)
    assert_response :success
  end

  test 'should moved story' do
    post story_moved_url(@story), params: { new_book_id: books(:book_3).id }
    assert_redirected_to book_url(books(:book_3).id)
  end

  test 'should show story' do
    get story_url(@story)
    assert_response :success
  end

  test 'should show chars' do
    get story_chars_url(@story)
    assert_response :success
  end

  test 'should show pdf book' do
    get story_url(@story, format: :pdf)
    assert_response :success
  end

  test 'should get edit' do
    get edit_story_url(@story)
    assert_response :success
  end

  test 'should update story' do
    patch story_url(@story),
          params: { story: { book_id: @story.book.id, summary_body: @story.summary_body, title: @story.title } }
    assert_redirected_to story_url(@story)
  end

  test 'should not update story' do
    patch story_url(@story), params: { story: { book_id: @story.book.id, summary_body: @story.summary_body, title: '' } }
    assert_response :success
  end

  test 'should destroy story' do
    if ["0","1"].include?(ENV['PARALLEL_WORKERS'])
      ThinkingSphinx::Test.run do
        assert_difference('Story.count', -1) do
          delete story_url(@story)
        end
      end

      assert_redirected_to book_stories_url(book_id: @book.id)
    end
  end
end
