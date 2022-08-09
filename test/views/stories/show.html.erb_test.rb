# frozen_string_literal: true

require 'test_helper'

class StoriesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show story' do
    get story_path(@story)
    assert_response :success

    assert_select 'a[href=?]', edit_story_path(@story)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', book_path(@book)
    assert_select '.footer>div>a', 10
    assert_template 'stories/show'
  end
end
