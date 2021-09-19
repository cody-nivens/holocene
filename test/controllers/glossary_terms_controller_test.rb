# frozen_string_literal: true

require 'test_helper'

class GlossaryTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_glossary_terms_url(@book)
    assert_response :success
  end

  test 'should get new' do
    get new_book_glossary_term_url(@book)
    assert_response :success
  end

  test 'should create glossary_term' do
    assert_difference('GlossaryTerm.count') do
      post book_glossary_terms_url(@book),
           params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: @glossary_term.name,
                                      see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id, user_id: @user.id, book_id: @book.id } }
    end

    assert_redirected_to glossary_term_url(GlossaryTerm.last)
  end

  test 'should not create glossary_term' do
    assert_difference('GlossaryTerm.count', 0) do
      post book_glossary_terms_url(@book),
           params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: '',
                                      see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id, user_id: @user.id, book_id: @book.id } }
    end

    assert_response :success
  end

  test 'should show glossary_term' do
    get glossary_term_url(@glossary_term)
    assert_response :success
  end

  test 'should get edit' do
    get edit_glossary_term_url(@glossary_term)
    assert_response :success
  end

  test 'should update glossary_term' do
    patch glossary_term_url(@glossary_term),
          params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: @glossary_term.name,
                                     see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id } }
    assert_redirected_to glossary_term_url(@glossary_term)
  end

  test 'should not update glossary_term' do
    patch glossary_term_url(@glossary_term),
          params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: '',
                                     see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id } }
    assert_response :success
  end

  test 'should destroy glossary_term' do
    assert_difference('GlossaryTerm.count', -1) do
      delete glossary_term_url(@glossary_term)
    end

    assert_redirected_to book_glossary_terms_url(@book)
  end
end
