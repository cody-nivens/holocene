require "application_system_test_case"

class BiblioentriesTest < ApplicationSystemTestCase
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit biblioentries_url
    assert_selector "h1", text: "Biblioentries"
    assert_link "New Biblioentry"
    assert_no_text "link_to"
  end

  test "creating a Biblioentry" do
    visit biblioentries_url
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
    visit biblioentries_url
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

  test "updating a Biblioentry" do
    visit biblioentries_url
    click_on "Edit", match: :first

    fill_in "Copyright holder", with: @biblioentry.copyright_holder
    fill_in "Copyright year", with: @biblioentry.copyright_year
    fill_in "Name", with: @biblioentry.name
    fill_in "Publisher", with: @biblioentry.publisher
    fill_in "Xreflabel", with: @biblioentry.xreflabel
    click_on "Update Biblioentry"

    assert_text "Biblioentry was successfully updated"
    click_on "Back"
  end

  test "should not update a Biblioentry" do
    visit biblioentries_url
    click_on "Edit", match: :first

    fill_in "Copyright holder", with: @biblioentry.copyright_holder
    fill_in "Copyright year", with: @biblioentry.copyright_year
    fill_in "Name", with: ""
    fill_in "Publisher", with: @biblioentry.publisher
    fill_in "Xreflabel", with: @biblioentry.xreflabel
    click_on "Update Biblioentry"

    assert_text "can't be blank"

    fill_in "Name", with: @biblioentry.name
    click_on "Update Biblioentry"
    assert_text "Biblioentry was successfully updated"
    click_on "Back"
  end

  test "destroying a Biblioentry" do
    visit biblioentries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Biblioentry was successfully destroyed"
  end
end
