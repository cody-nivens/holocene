# frozen_string_literal: true

require 'test_helper'

class TimelinesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)
    @book = books(:book_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get timelines_url

    assert_response 200
    @timelines = Timeline.all

    assert_select 'a[text()=?]', 'New Timeline'
    assert_select 'a[href=?]', new_timeline_path
    assert_select '.footer>div>a', 1
    assert_template 'timelines/index'

    assert_select 'h1', 'Timelines'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
