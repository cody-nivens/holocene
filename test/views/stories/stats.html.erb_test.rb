# frozen_string_literal: true

require 'test_helper'

class StoriesStatsHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get stats' do
    get polymorphic_url([@story, :stats])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', story_path(@story)
    assert_select '.footer>div>a', 1
    assert_template 'stories/stats'
  end
end
