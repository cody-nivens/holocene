# frozen_string_literal: true

require 'application_system_test_case'

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:story_14)
    @book = @story.book

    @story_2 = stories(:story_3)
    @story_4 = stories(:story_15)
    @user = users(:users_1)
    sign_in @user
  end

  test 'stories index 2' do
    visit book_stories_url(book_id: @book.id)
#    visit New Story
    assert_text 'New Story'
    click_on 'New Story'
    assert_current_path new_book_story_path(book_id: @book.id)
    click_on 'Back'
    assert_current_path book_path(@book)
#    visit Resync Stories
    visit book_stories_url(book_id: @book.id)
    assert_text 'Resync Stories'
    click_on 'Resync Stories'
    assert_current_path book_resync_stories_path(id: @book.id)
    click_on 'Back'
    assert_current_path book_path(@book)
#    visit Timeline
    visit book_stories_url(book_id: @book.id)
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path book_timeline_path(id: @book.id)
    click_on 'Back'
    assert_current_path book_stories_path(@book)
  end

  test 'stories show' do
    visit story_url(@story)
#    visit Characters
    assert_text 'Characters'
    within ".footer" do
      click_on 'Characters'
    end
    assert_current_path polymorphic_path([@story, :characters])
    click_on 'Back'
    #assert_current_path book_path(@book)
#    visit Key Points
    visit story_url(@story)
    assert_text 'Key Points'
    within ".footer" do
      click_on 'Key Points'
    end
    assert_current_path polymorphic_path([@story, :key_points])
    click_on 'Back'
    assert_current_path story_path(@story)
#    visit New Key Point
    assert_text 'New Key Point'
    click_on 'New Key Point'
    assert_current_path new_polymorphic_path([@story, KeyPoint])
    click_on 'Back'
    #assert_current_path story_key_points_path(@story)
#    visit Resync Scenes
    visit story_url(@story)
    assert_text 'Resync Scenes'
    click_on 'Resync Scenes'
    assert_current_path story_resync_scenes_path(id: @story.id)
    click_on 'Back'
    #assert_current_path story_path(@story)
#    visit Scenes
    visit story_url(@story)
    assert_text 'Scenes'
    click_on 'Scenes'
    assert_current_path polymorphic_path([@story, :scenes])
    click_on 'Back'
    #assert_current_path book_path(@book)
#    visit Stats
    visit story_url(@story)
    assert_text 'Stats'
    click_on 'Stats'
    assert_current_path polymorphic_path([@story, :stats])
    click_on 'Back'
    #assert_current_path book_path(@book)
#    visit Timeline
    visit story_url(@story)
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path polymorphic_path([@story, :timeline])
    click_on 'Back'
    assert_current_path story_key_points_path(@story)
#    visit Tours
    visit story_url(@story)
    assert_text 'Tours'
    click_on 'Tours'
    assert_current_path polymorphic_path([@story, :tours])
    click_on 'Back'
    assert_current_path story_path(@story)
  end

  test 'stories index' do
    visit book_stories_url(book_id: @book.id)
#    visit Resync Stories
    assert_text 'Resync Stories'
    click_on 'Resync Stories'
    assert_current_path book_resync_stories_path(id: @book.id)
    click_on 'Back'
    assert_current_path book_path(id: @book.id)
#    visit New Story
    visit book_stories_url(book_id: @book.id)
    assert_text 'New Story'
    click_on 'New Story'
    assert_current_path new_book_story_path(book_id: @book.id)
    click_on 'Back'
    assert_current_path book_path(id: @book.id)
#    visit Scenes
    assert_text 'Scenes'
    click_on 'Scenes'
    assert_current_path book_scenes_path(book_id: @book.id)
    click_on 'Back'
    #assert_current_path book_path(@book)
#    visit Timeline
    visit book_stories_url(book_id: @book.id)
    visit book_stories_url(book_id: @book.id)
    assert_text 'Timeline'
    click_on 'Timeline'
    assert_current_path book_timeline_path(id: @book.id)
    click_on 'Back'
    #assert_current_path book_stories_path(book_id: @book.id)
  end

  test 'sort stories' do
    skip('Works in production')

    visit books_url
    assert_text 'The Scorpion King'
    click_on 'The Scorpion King'
    assert_text 'The Beginnings 2'

    assert_match /#{@story.name}.*#{@story_2.name}.*#{@story_4.name}/m, page.html

    draggable = find(:css, "#story-#{@story_4.id}")
    droppable = find(:css, "#story-#{@story_2.id}")
    draggable.drag_to(droppable)
    # page.execute_script %Q{
    #  $('#story-#{@story_4.id}').simulateDragSortable({move: -1});
    # }
    wait_for_ajax
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match /#{@story.name}.*#{@story_4.name}.*#{@story_2.name}/m, page.html
    visit current_path
    assert_match /#{@story.name}.*#{@story_4.name}.*#{@story_2.name}/m, page.html
  end

  test 'creating a Story' do
    visit book_url(id: @book.id)
    click_on 'New Story'

    fill_in 'Summary', with: @story.summary
    fill_in 'Title', with: @story.title
    click_on 'Create Story'

    assert_text 'Story was successfully created'
    click_on 'Back'
  end

  test 'not creating a Story' do
    visit book_stories_url(book_id: @book.id)
    click_on 'New Story'

    fill_in 'Summary', with: @story.summary
    fill_in 'Title', with: ''
    click_on 'Create Story'

    assert_text "Title\ncan't be blank"
    click_on 'Back'
  end
end
