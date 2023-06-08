# frozen_string_literal: true

require 'test_helper'

class GlossaryTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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
  test 'should get edit' do
    get edit_glossary_term_path(@glossary_term)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_book_glossary_term_path(@book)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show glossary_term TS' do
    get glossary_term_path(@glossary_term, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show glossary_term index TS' do
    get book_glossary_terms_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create glossary_term TS" do
    assert_difference('GlossaryTerm.count') do
      post book_glossary_terms_url(@book, format: 'turbo_stream'),
           params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: @glossary_term.name,
                                      see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id, user_id: @user.id, book_id: @book.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update glossary_term TS" do
    patch  glossary_term_path(@glossary_term, format: :turbo_stream),
          params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: @glossary_term.name,
                                     see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @glossary_term}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy glossary_term TS" do
    assert_difference('GlossaryTerm.count', -1) do
      delete glossary_term_url(@glossary_term, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
