require 'test_helper'

class GlossaryTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_glossary_terms_url(@book)
    assert_response :success

    assert_select "a[text()=?]",'New Glossary Term'
    assert_select "a[href=?]", new_book_glossary_term_path(@book)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should get new" do
    get new_book_glossary_term_url(@book)
    assert_response :success
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_glossary_terms_path(@book)
    assert_select ".footer>div>a", 1
  end

  test "should create glossary_term" do
    assert_difference('GlossaryTerm.count') do
        post book_glossary_terms_url(@book), params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: @glossary_term.name, see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id, user_id: @user.id, book_id: @book.id } }
    end

    assert_redirected_to book_glossary_term_url(@book,GlossaryTerm.last)
  end

  test "should not create glossary_term" do
    assert_difference('GlossaryTerm.count', 0) do
        post book_glossary_terms_url(@book), params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: '', see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id, user_id: @user.id, book_id: @book.id } }
    end

    assert_response :success
  end

  test "should show glossary_term" do
    get book_glossary_term_url(@book,@glossary_term)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_book_glossary_term_path(@book,@glossary_term)
    assert_select "a[text()=?]",'Back'
    
    # history.back is now used
    # assert_select "a[href=?]", book_glossary_terms_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should get edit" do
    get edit_book_glossary_term_url(@book,@glossary_term)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", book_glossary_term_path(@book,@glossary_term)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_glossary_terms_path(@book)
    assert_select ".footer>div>a", 2
  end

  test "should update glossary_term" do
    patch book_glossary_term_url(@book,@glossary_term), params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: @glossary_term.name, see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id } }
    assert_redirected_to book_glossary_term_url(@book,@glossary_term)
  end

  test "should not update glossary_term" do
    patch book_glossary_term_url(@book,@glossary_term), params: { glossary_term: { acronym_id: @glossary_term.acronym_id, body: @glossary_term.body, name: '', see_id: @glossary_term.see_id, seealso_id: @glossary_term.seealso_id } }
    assert_response :success
  end

  test "should destroy glossary_term" do
    assert_difference('GlossaryTerm.count', -1) do
      delete book_glossary_term_url(@book,@glossary_term)
    end

    assert_redirected_to book_glossary_terms_url(@book)
  end
end
