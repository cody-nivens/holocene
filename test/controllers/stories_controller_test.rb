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

if 1 == 0
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

  test 'should get new' do
    get new_book_story_url(@book)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get edit' do
    get edit_story_url(@story)
     ids = [ 'objects', 'new_object', 'nav-bar', "#{dom_id @story}"]
    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_includes ids, element["id"]
      end
    end
    assert_response :success
  end

  test "should show story TS" do
    get story_url(@story, format: :turbo_stream)

    assert_select "turbo-frame", id:  "#{dom_id @story}"
    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test "should report story TS" do
    [ "stories/stats", "stories/scenes"].each do |report|
      get story_report_url(@story, format: :turbo_stream),
        params: { report: report }

      assert_turbo_stream action: :replace, target: "objects"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_response :success
    end
  end

  test "should create story TS" do
    assert_difference('Story.count') do
      post book_stories_url(book_id: @book.id, format: :turbo_stream),
           params: { story: { book_id: @story.book.id, summary_body: @story.summary_body, title: @story.title } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "sub_objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update story TS" do
    patch story_url(@story, format: :turbo_stream),
          params: { story: { book_id: @story.book.id, summary_body: @story.summary_body, title: @story.title } }
    label = dom_id @story
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @story}"
    assert_response :success
  end

  test "should destroy story TS" do
    assert_difference('Story.count', -1) do
      delete story_url(@story, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
