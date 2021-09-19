# frozen_string_literal: true

require 'test_helper'

class SectionsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @sectioned = @section.sectioned

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_url([@sectioned, :sections])

    assert_response 200
    @sections = Section.all

    assert_select 'a[text()=?]', 'New Section'
    assert_select 'a[href=?]', new_polymorphic_path([@sectioned, :section])
    assert_select '.footer>div>a', 2
    assert_template 'sections/index'

    assert_select 'h1', "Sections for #{@sectioned.class.name} #{@sectioned.name.gsub(/ $/, '')}"

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
