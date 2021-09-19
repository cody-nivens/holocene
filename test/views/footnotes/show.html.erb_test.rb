# frozen_string_literal: true

require 'test_helper'

class FootnotesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @footnote = footnotes(:footnote_1)
    @noted = @footnote.noted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show footnote' do
    get polymorphic_path([@noted, @footnote])
    assert_response :success

    assert_select 'a[text()=?]', 'Edit'
    assert_select 'a[href=?]', edit_polymorphic_path([@noted, @footnote])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@noted, :footnotes])
    assert_select '.footer>div>a', 2
    assert_template 'footnotes/show'
  end
end
