require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:authors_1)
    @book = @author.books[0]
    @user = users(:users_1)
    sign_in @user
  end

  test "Adding an Author" do
    visit book_authors_url(@book)
    assert_selector "h1", text: "Authors"
    assert_link "New Author"
    click_on "Add Author"
    select "M. Kariil", from: "authors_avail"
    click_on "Save"
    within "#authors_ids" do
      assert_text "M. Kariil"
    end
    select "M. Kariil", from: "authors_ids"
    click_on "Save"
    within "#authors_ids" do
      assert_no_text "M. Kariil"
    end
  end

  test "creating an Author" do
    visit book_authors_url(@book)
    click_on "New Author"

    fill_in "First name", with: @author.first_name
    fill_in "Last name", with: @author.last_name
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "should not create an Author" do
    visit book_authors_url(@book)
    click_on "New Author"

    fill_in "First name", with: ""
    fill_in "Last name", with: @author.last_name
    click_on "Create Author"

    assert_text "can't be blank"

    fill_in "First name", with: @author.first_name
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end
end
