require "application_system_test_case"

class AsidesTest < ApplicationSystemTestCase
  setup do
    @aside = asides(:aside_1)
    @chapter_3 = chapters(:chapter_3)
    @chapter = chapters(:chapter_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end


  test "visiting the Aside index" do
    visit chapter_asides_url(@chapter)
    assert_selector "h1", text: "Asides"
  end

  test "creating an Aside" do
    visit chapter_asides_url(@chapter_3)
    click_on "New Aside"

    fill_in "Name", with: @aside.name
    fill_in_rich_text_area "aside_body", with: "Test 1"
    click_on "Create Aside"

    assert_text "Aside was successfully created."
    click_on "Back"
  end

  test "not creating an Aside" do
    visit chapter_asides_url(@chapter_3)
    click_on "New Aside"

    fill_in "Name", with: ""
    fill_in_rich_text_area "aside_body", with: "Test 1"
    click_on "Create Aside"

    assert_text "can't be blank"
    click_on "Back"
  end

  test "updating a Aside" do
    visit chapter_asides_url(@chapter)
    click_on "Edit", match: :first

    fill_in "Name", with: @aside.name
    fill_in_rich_text_area "aside_body", with: "Test 1"
    click_on "Update Aside"

    assert_text "Aside was successfully updated"
    click_on "Back"
  end

  test "not updating a Aside" do
    visit chapter_asides_url(@chapter)
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    fill_in_rich_text_area "aside_body", with: "Test 1"
    click_on "Update Aside"

    assert_text "can't be blank"
    click_on "Back"
  end

  test "destroying a Aside" do
    visit chapter_asides_url(@chapter)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aside was successfully destroyed"
  end
end
