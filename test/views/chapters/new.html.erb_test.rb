# frozen_string_literal: true

require 'test_helper'

class ChaptersNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@scripted, :chapter])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@scripted, :chapters])
    assert_select '.footer>div>a', 1
    assert_template 'chapters/new'
  end
end
