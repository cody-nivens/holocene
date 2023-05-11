# frozen_string_literal: true

require 'test_helper'

class GlossaryTermsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = @glossary_term.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_glossary_terms_url(@book)

    assert_response 200
    @glossary_terms = GlossaryTerm.all

    assert_select 'a[title=?]', 'New Glossary Term'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :glossary_term])
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', book_path(@book)
    assert_template 'glossary_terms/index'

    assert_select 'h2', 'Glossary Terms'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
