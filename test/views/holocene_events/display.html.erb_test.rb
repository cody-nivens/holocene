# frozen_string_literal: true

require 'test_helper'

class HoloceneEventsDisplayHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event = holocene_events(:holocene_event_1)
    @chapter = chapters(:chapter_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get display' do
    get chapter_display_url(@chapter)

    assert_response 200

    assert_template 'holocene_events/display'

    # assert_select 'h1','Display'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
