# frozen_string_literal: true

require 'test_helper'

class HoloceneEventsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event = holocene_events(:holocene_event_1)
    @chapter = chapters(:chapter_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get chapter_holocene_events_url(@chapter)

    assert_response 200
    @holocene_events = HoloceneEvent.all

    assert_select 'a[text()=?]', 'New Holocene Event'
    assert_select 'a[href=?]', new_holocene_event_path
    assert_select '.footer>div>a', 1
    assert_template 'holocene_events/index'
    assert_template 'holocene_event_grid/_table'

    assert_select 'h2', 'Holocene Events'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
