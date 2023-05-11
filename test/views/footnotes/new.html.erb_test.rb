# frozen_string_literal: true

require 'test_helper'

class FootnotesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @footnote = footnotes(:footnote_1)
    @noted = @footnote.noted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@noted, :footnote], slug: 'test23')
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@noted, :footnotes])
    assert_template 'footnotes/new'
  end
end
