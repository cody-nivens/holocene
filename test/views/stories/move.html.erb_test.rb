# frozen_string_literal: true

require 'test_helper'

class StoriesMoveHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get move' do
    get polymorphic_url([@story, :move])
    assert_response :success

    assert_template 'stories/move'
  end
end
