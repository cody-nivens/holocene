# frozen_string_literal: true

require 'application_system_test_case'

class BiblioentriesTest < ApplicationSystemTestCase
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'biblioentries edit' do
#    visit Show
    visit edit_biblioentry_url(@biblioentry)
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path biblioentry_path(@biblioentry)
    click_on 'Back'
    assert_text 'No Dog'
    assert_current_path book_path(@book)
  end

  test 'biblioentries index' do
#    visit New Biblioentry
    visit book_biblioentries_url(@book)
    assert_link 'New Biblioentry'
    click_on 'New Biblioentry'
    assert_no_link 'New Biblioentry'
    assert_current_path new_book_biblioentry_path(@book)
    click_on 'Back'
    assert_text 'Exodus to Arthur'
    assert_current_path book_biblioentries_path(@book)
  end

  test 'biblioentries show' do
#    visit Edit
    visit biblioentry_url(@biblioentry)
    assert_link 'Edit'
    within ".footer" do
      click_on 'Edit'
    end
    assert_text 'Editing Biblioentry'
    assert_current_path edit_biblioentry_path(@biblioentry)
    click_on 'Back'
    assert_text 'Exodus to Arthur'
    assert_current_path biblioentry_path(@biblioentry)
  end

  test 'creating a Biblioentry' do
    visit book_biblioentries_url(@book)
    click_on 'New Biblioentry'

    fill_in 'Copyright holder', with: @biblioentry.copyright_holder
    fill_in 'Copyright year', with: @biblioentry.copyright_year
    fill_in 'Name', with: @biblioentry.name
    fill_in 'Publisher', with: @biblioentry.publisher
    fill_in 'Xreflabel', with: @biblioentry.xreflabel
    click_on 'Create Biblioentry'

    assert_text 'Biblioentry was successfully created'
    click_on 'Back'
  end

  test 'should not create a Biblioentry' do
    visit book_biblioentries_url(@book)
    click_on 'New Biblioentry'

    fill_in 'Copyright holder', with: @biblioentry.copyright_holder
    fill_in 'Copyright year', with: @biblioentry.copyright_year
    fill_in 'Name', with: ''
    fill_in 'Publisher', with: @biblioentry.publisher
    fill_in 'Xreflabel', with: @biblioentry.xreflabel
    click_on 'Create Biblioentry'

    assert_text "can't be blank"

    fill_in 'Name', with: @biblioentry.name
    click_on 'Create Biblioentry'
    assert_text 'Biblioentry was successfully created'
    click_on 'Back'
  end
end
