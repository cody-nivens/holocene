require "application_system_test_case"

class GlossaryTermsTest < ApplicationSystemTestCase
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Glossary term index" do
    visit book_glossary_terms_url(@book)
    assert_selector "h1", text: "Glossary Terms"
  end

  test "creating a Glossary term" do
    visit book_glossary_terms_url(@book)
    click_on "New Glossary Term"

    fill_in "Body", with: @glossary_term.body
    fill_in "Name", with: @glossary_term.name
    find('#glossary_term_see_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_seealso_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_acronym_id').find(:xpath, 'option[2]').select_option
    click_on "Create Glossary term"

    assert_text "Glossary term was successfully created"
    click_on "Back"
  end

  test "should not create a Glossary term" do
    visit book_glossary_terms_url(@book)
    click_on "New Glossary Term"

    fill_in "Body", with: @glossary_term.body
    fill_in "Name", with: ""
    find('#glossary_term_see_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_seealso_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_acronym_id').find(:xpath, 'option[2]').select_option
    click_on "Create Glossary term"

    assert_text "can't be blank"
    fill_in "Name", with: "Test99"
    click_on "Create Glossary term"

    assert_text "Glossary term was successfully created"
    assert_text "Test99"
    click_on "Back"
  end

  test "updating a Glossary term" do
    visit book_glossary_terms_url(@book)
    click_on "Edit", match: :first

    fill_in "Body", with: @glossary_term.body
    fill_in "Name", with: @glossary_term.name
    find('#glossary_term_see_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_seealso_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_acronym_id').find(:xpath, 'option[2]').select_option
    click_on "Update Glossary term"

    assert_text "Glossary term was successfully updated"
    click_on "Back"
  end

  test "should not update a Glossary term" do
    visit book_glossary_terms_url(@book)
    click_on "Edit", match: :first

    fill_in "Body", with: @glossary_term.body
    fill_in "Name", with: ""
    find('#glossary_term_see_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_seealso_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_acronym_id').find(:xpath, 'option[2]').select_option
    click_on "Update Glossary term"

    assert_text "can't be blank"
    fill_in "Name", with: "Test99"
    click_on "Update Glossary term"
    
    assert_text "Glossary term was successfully updated"
    assert_text "Test99"
    click_on "Back"
  end

  test "destroying a Glossary term" do
    visit book_glossary_terms_url(@book)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Glossary term was successfully destroyed"
  end
end
