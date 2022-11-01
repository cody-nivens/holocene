# frozen_string_literal: true

require 'test_helper'

class StoriesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:story_1)
    @book = @story.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_stories_url(@book)

    assert_response 200
    @stories = Story.all

    assert_select 'a[text()=?]', 'New Story'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :story])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', book_path(@book)
    assert_select '.footer>div>a', 6
    assert_template 'stories/index'

    assert_select 'h2', 'Stories'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
