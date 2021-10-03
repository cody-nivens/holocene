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

  test 'stories index new story' do
    visit book_stories_url(book_id: @book.id)
#    visit New Story
    assert_link 'New Story'
    click_on 'New Story'
    assert_no_link 'New Story'
    assert_current_path new_book_story_path(book_id: @book.id)
    click_on 'Back'
    assert_link 'New Story'
    assert_current_path book_stories_path(@book)
  end

  test 'stories index resync stories' do
#    visit Resync Stories
    visit book_stories_url(book_id: @book.id)
    assert_link 'Resync Stories'
    click_on 'Resync Stories'
    assert_text 'Stories were successfully resynced.'
    assert_current_path book_stories_path(@book)
    click_on 'Back'
    assert_link 'New Story'
    assert_current_path book_path(@book)
  end

  test 'stories index timeline' do
#    visit Timeline
    visit book_stories_url(book_id: @book.id)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_button 'Go'
    assert_current_path book_timeline_path(id: @book.id)
    click_on 'Back'
    assert_text 'New Story'
    assert_current_path book_stories_path(@book)
  end

  test 'stories show characters' do
    visit story_url(@story)
#    visit Characters
    assert_text 'Characters'
    within ".footer" do
      click_on 'Characters'
    end
    assert_text 'Add/Remove Characters'
    assert_current_path polymorphic_path([@story, :characters])
    click_on 'Back'
    assert_text 'New Key Point'
    assert_current_path story_path(@story)
  end

  test 'stories show key points' do
#    visit Key Points
    visit story_url(@story)
    within ".footer" do
      assert_link 'Key Points'
      click_on 'Key Points'
    end
    assert_text 'New Key Point'
    assert_current_path polymorphic_path([@story, :key_points])
    click_on 'Back'
    assert_link 'New Key Point'
    assert_current_path story_path(@story)
  end

  test 'stories show new key point' do
#    visit New Key Point
    visit story_url(@story)
    assert_link 'New Key Point'
    click_on 'New Key Point'
    assert_no_link 'New Key Point'
    assert_current_path new_polymorphic_path([@story, KeyPoint])
    click_on 'Back'
    assert_link 'Scenes'
    assert_current_path story_path(@story)
  end

  test 'stories show resync scenes' do
#    visit Resync Scenes
    visit story_url(@story)
    assert_link 'Resync Scenes'
    click_on 'Resync Scenes'
    assert_text 'Story was successfully resynced.'
    assert_current_path story_path(id: @story.id)
    click_on 'Back'
    assert_link 'New Story'
    assert_current_path book_path(@book)
  end

  test 'stories show scenes' do
#    visit Scenes
    visit story_url(@story)
    assert_link 'Scenes'
    click_on 'Scenes'
    assert_no_link 'Scenes'
    assert_current_path polymorphic_path([@story, :scenes])
    click_on 'Back'
    assert_link 'New Key Point'
    assert_current_path story_path(@story)
  end

  test 'stories show stats' do
#    visit Stats
    visit story_url(@story)
    assert_link 'Stats'
    click_on 'Stats'
    assert_no_link 'Stats'
    assert_current_path polymorphic_path([@story, :stats])
    click_on 'Back'
    assert_link 'New Key Point'
    assert_current_path story_path(@story)
  end

  test 'stories show timeline' do
#    visit Timeline
    visit story_url(@story)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_button 'Go'
    assert_current_path polymorphic_path([@story, :timeline])
    click_on 'Back'
    assert_link 'New Key Point'
    assert_current_path story_key_points_path(@story)
  end

  test 'stories show tours' do
#    visit Tours
    visit story_url(@story)
    assert_link 'Tours'
    click_on 'Tours'
    assert_no_link 'Tours'
    assert_current_path polymorphic_path([@story, :tours])
    click_on 'Back'
    assert_text @story.name
    assert_current_path story_path(@story)
  end

  test 'stories index scenes' do
#    visit Scenes
    visit story_url(@story)
    assert_link 'Scenes'
    click_on 'Scenes'
    assert_button 'Go'
    assert_current_path story_scenes_path(story_id: @story.id)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path story_path(@story)
  end

  test 'sort stories' do
    skip('Works in production')

    visit books_url
    assert_link 'The Scorpion King'
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
