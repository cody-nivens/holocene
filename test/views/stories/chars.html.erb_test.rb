# frozen_string_literal: true

require 'test_helper'

class StoriesCharsHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get chars' do
    get polymorphic_url([@story, :chars])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 11
    assert_template 'stories/chars'
  end
end
