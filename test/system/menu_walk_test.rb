require "application_system_test_case"

class MenuWalkTest < ApplicationSystemTestCase
  setup do
    @act = acts(:act_1)
    @user = users(:users_1)
    sign_in @user
  end

  tmenu_items = {
    'Book' => %w[ publish_all ]
  }
  menu_items = {
    'Welcome' => %w[ progress tags stats history ],
    'Book' => %w[ books stats scenes resync_stories publish_all ],
    'Story' => %w[ stats scenes resync_scenes ],
    'Stage' => %w[ act actor location ]
  }

  omenu_items = {
    'Story' => %w[ stats scenes ]
  }
  menu_items.keys.each do |master|
    menu_items[master].each do |object|
      test "visiting the #{master}:#{object} menu" do
        title = object.gsub(/_/,' ').camelize
        visit root_url
        assert_text 'The Phantom'
        click_on 'The Phantom'
        assert_link 'The Beginnings'
        click_on 'The Beginnings'

        assert_text 'Climate Change'

        case object
        when 'history'
          do_menu master, "History"
        else
          do_menu master, "#{title.titleize.pluralize}"
        end
        assert_current_path root_url
        assert_no_text "Content missing"


        case object
        when 'publish_all'
          assert_text "All Stories marked publish"
        when 'resync_stories'
          assert_text "Stories were successfully resynced"
        when 'resync_scenes'
          assert_text "Story was successfully resynced"
        when 'scenes'
          assert_text 'No Section'
        when 'history'
          assert_selector "div#chart-1"
        when 'act'
          assert_text "Stages"
        when 'location'
          assert_text 'Location Times'
        when 'progress'
          assert_text "Monthly"
        else
          assert_text "#{title.titleize.pluralize}"
        end

        assert_current_path root_url
      end
    end
  end
end
