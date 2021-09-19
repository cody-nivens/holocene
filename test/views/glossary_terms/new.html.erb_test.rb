# frozen_string_literal: true

require 'test_helper'

class GlossaryTermsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = @glossary_term.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :glossary_term])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', book_path(@book)
    assert_select '.footer>div>a', 1
    assert_template 'glossary_terms/new'
  end
end
