# frozen_string_literal: true

require 'test_helper'

class FootnotesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @footnote = footnotes(:footnote_1)
    @noted = @footnote.noted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_polymorphic_url([@noted, @footnote])
    assert_response :success
    assert_select 'h2', 'Editing Footnote'

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@noted, :footnotes])
    assert_select '.footer>div>a', 2
    assert_template 'footnotes/edit'
  end
end
