require 'test_helper'

class GlossaryTermsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @glossary_term= glossary_terms(:glossary_1)
    @book = @glossary_term.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should show glossary_term" do
    get glossary_term_path(@glossary_term)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_glossary_term_path(@glossary_term)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_path(@book)
    assert_select ".footer>div>a", 2
    assert_template 'glossary_terms/show'
  end
end
