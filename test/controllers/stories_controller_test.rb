require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book
    @character = characters(:character_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_stories_url(:book_id => @book.id)
    assert_response :success
  end

  test "should get resync_scenes" do
    get story_resync_scenes_url(:id => @story.id)
    assert_redirected_to book_story_url(:book_id => @book.id, :id => @story.id)
  end

  test "should get new" do
    get new_book_story_url(:book_id => @book.id)
    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post book_stories_url(:book_id => @book.id), params: { story: { book_id: @story.book.id, summary: @story.summary, title: @story.title, character_ids: [ @character.id ] } }
    end

    assert_redirected_to book_story_url(:book_id => @book.id, :id => Story.last.id)
  end

  test "should not create story" do
    assert_difference('Story.count', 0) do
      post book_stories_url(:book_id => @book.id), params: { story: { book_id: @story.book.id, summary: @story.summary, title: "", character_ids: [ @character.id ] } }
    end

    assert_response :success
  end

  test "should show story" do
    get book_story_url(@book, @story)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_story_url(@book, @story)
    assert_response :success
  end

  test "should update story" do
    patch book_story_url(@book, @story), params: { story: { book_id: @story.book.id, summary: @story.summary, title: @story.title, character_ids: [ @character.id ] } }
    assert_redirected_to book_story_url(@book, @story)
  end

  test "should not update story" do
    patch book_story_url(@book, @story), params: { story: { book_id: @story.book.id, summary: @story.summary, title: "", character_ids: [ @character.id ] } }
    assert_response :success
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete book_story_url(@book, @story)
    end

    assert_redirected_to book_stories_url(:book_id => @book.id)
  end
end
