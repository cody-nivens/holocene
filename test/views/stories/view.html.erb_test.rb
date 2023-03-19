# frozen_string_literal: true

require 'test_helper'

class StoriesViewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get view' do
    get polymorphic_url([@story, :view])
    assert_response :success

    assert_template 'stories/view'
  end
end
