require "application_system_test_case"

class BiblioentriesTest < ApplicationSystemTestCase
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "creating a Biblioentry" do
      visit book_biblioentries_url(@book)
    click_on "New Biblioentry"

    fill_in "Copyright holder", with: @biblioentry.copyright_holder
    fill_in "Copyright year", with: @biblioentry.copyright_year
    fill_in "Name", with: @biblioentry.name
    fill_in "Publisher", with: @biblioentry.publisher
    fill_in "Xreflabel", with: @biblioentry.xreflabel
    click_on "Create Biblioentry"

    assert_text "Biblioentry was successfully created"
    click_on "Back"
  end

  test "should not create a Biblioentry" do
    visit book_biblioentries_url(@book)
    click_on "New Biblioentry"

    fill_in "Copyright holder", with: @biblioentry.copyright_holder
    fill_in "Copyright year", with: @biblioentry.copyright_year
    fill_in "Name", with: ""
    fill_in "Publisher", with: @biblioentry.publisher
    fill_in "Xreflabel", with: @biblioentry.xreflabel
    click_on "Create Biblioentry"

    assert_text "can't be blank"

    fill_in "Name", with: @biblioentry.name
    click_on "Create Biblioentry"
    assert_text "Biblioentry was successfully created"
    click_on "Back"
  end
end
