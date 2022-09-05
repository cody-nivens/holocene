# frozen_string_literal: true

require 'test_helper'

class AsidesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @aside = asides(:aside_1)
    @chapter = @aside.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get chapter_asides_url(chapter_id: @chapter.id)

    assert_response 200
    @asides = Aside.all

    assert_select 'a[text()=?]', 'New Aside'
    assert_select 'a[href=?]', new_polymorphic_path([@chapter, :aside])
    assert_select '.footer>div>a', 1
    assert_template 'asides/index'

    assert_select 'h2', 'Asides'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
