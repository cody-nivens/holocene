# frozen_string_literal: true

require 'test_helper'

class FootnotesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @footnote = footnotes(:footnote_1)
    @noted = @footnote.noted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_url([@noted, :footnotes], slug: '')

    assert_response 200
    @footnotes = Footnote.all

    assert_select 'a[title=?]', 'New Footnote'
    assert_template 'footnotes/index'

    assert_select 'h2', 'Footnotes'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
