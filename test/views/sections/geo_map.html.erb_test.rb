# frozen_string_literal: true

require 'test_helper'

class SectionsGeoMapHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get geo_map' do
    get geo_map_section_url(@section)

    assert_response 200

    assert_template 'sections/geo_map'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
