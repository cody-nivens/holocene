# frozen_string_literal: true

require 'test_helper'

class StoriesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :story])
    assert_response :success

    assert_template 'stories/new'
  end
end
