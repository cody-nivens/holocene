require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
    @user = users(:one)
    sign_in @user
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h1", text: "Authors"
  end

  test "creating an Author" do
    visit authors_url
    click_on "New Author"

    fill_in "First name", with: @author.first_name
    fill_in "Last name", with: @author.last_name
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "should not create an Author" do
    visit authors_url
    click_on "New Author"

    fill_in "First name", with: ""
    fill_in "Last name", with: @author.last_name
    click_on "Create Author"

    assert_text "Please review the problems below:"
    assert_text "First name can't be blank"

    fill_in "First name", with: @author.first_name
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "updating an Author" do
    visit authors_url
    click_on "Edit", match: :first

    fill_in "First name", with: @author.first_name
    fill_in "Last name", with: @author.last_name
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "should not update an Author" do
    visit authors_url
    click_on "Edit", match: :first

    fill_in "First name", with: ""
    fill_in "Last name", with: @author.last_name
    click_on "Update Author"

    assert_text "Please review the problems below:"
    assert_text "First name can't be blank"

    fill_in "First name", with: @author.first_name
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "destroying a Author" do
    visit authors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Author was successfully destroyed"
  end
end
