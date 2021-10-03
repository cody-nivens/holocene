# frozen_string_literal: true

require 'application_system_test_case'

class GlossaryTermsTest < ApplicationSystemTestCase
  setup do
    @glossary_term = glossary_terms(:glossary_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'glossary_terms edit' do
    visit edit_glossary_term_url(@glossary_term)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path glossary_term_path(@glossary_term)
    click_on 'Back'
    assert_link 'New Glossary Term'
    assert_current_path book_glossary_terms_path(@book)
  end

  test 'glossary_terms index' do
    visit book_glossary_terms_url(@book)
#    visit New Glossary Term
    assert_link 'New Glossary Term'
    click_on 'New Glossary Term'
    assert_no_link 'New Glossary Term'
    assert_current_path new_book_glossary_term_path(@book)
    click_on 'Back'
    assert_link 'New Glossary Term'
    assert_current_path book_glossary_terms_path(@book)
  end

  test 'glossary_terms show' do
    visit glossary_term_url(@glossary_term)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_glossary_term_path(@glossary_term)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path glossary_term_path(@glossary_term)
  end

  test 'creating a Glossary term' do
    visit book_glossary_terms_url(@book)
    click_on 'New Glossary Term'

    fill_in 'Body', with: @glossary_term.body
    fill_in 'Name', with: @glossary_term.name
    find('#glossary_term_see_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_seealso_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_acronym_id').find(:xpath, 'option[2]').select_option
    click_on 'Create Glossary term'

    assert_text 'Glossary term was successfully created'
    click_on 'Back'
  end

  test 'should not create a Glossary term' do
    visit book_glossary_terms_url(@book)
    click_on 'New Glossary Term'

    fill_in 'Body', with: @glossary_term.body
    fill_in 'Name', with: ''
    find('#glossary_term_see_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_seealso_id').find(:xpath, 'option[2]').select_option
    find('#glossary_term_acronym_id').find(:xpath, 'option[2]').select_option
    click_on 'Create Glossary term'

    assert_text "can't be blank"
    fill_in 'Name', with: 'Test99'
    click_on 'Create Glossary term'

    assert_text 'Glossary term was successfully created'
    assert_text 'Test99'
    click_on 'Back'
  end
end
