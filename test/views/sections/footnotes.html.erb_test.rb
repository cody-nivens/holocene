require 'test_helper'

class SectionsFootnotesHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get footnotes' do
    get section_footnotes_url(@section)

    assert_response 200

    assert_template 'footnotes/index'

    assert_select 'h1', 'Footnotes'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
