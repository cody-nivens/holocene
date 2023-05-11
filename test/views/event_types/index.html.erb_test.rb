# frozen_string_literal: true

require 'test_helper'

class EventTypesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get event_types_url

    assert_response 200
    @event_types = EventType.all

    assert_select 'a[title=?]', 'New Event Type'
    assert_select 'a[href=?]', new_event_type_path
    assert_template 'event_types/index'

    assert_select 'h2', 'Event Types'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
