require "application_system_test_case"

class ActsTest < ApplicationSystemTestCase
  setup do
    @act = acts(:act_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "drive the act cycle" do
    drive_cycle('Stage', 'Acts')
  end

  if 1 == 0
  test "visiting the index" do
    visit root_url
    assert_text 'The Phantom'
    click_on 'The Phantom'
    assert_text 'The Beginnings'

    do_menu "Stage", "Acts"

    click_new 'plus'
    fill_in "Name", with: "Strangeness in Space"
    click_on "Create Act"

    assert_text "Act was successfully created"
    assert_text "Strangeness in Space"

    click_on "Strangeness in Space"
    assert_text "Segments"

    click_new 'plus'
    fill_in "Name", with: "The Launch"
    click_on "Create Stage"

    assert_text "The Launch"
    click_on "The Launch"

    click_on "Back"
  end

  test "updating a Act" do
    visit acts_url
    click_on "Edit", match: :first

    fill_in "Book", with: @act.book_id
    fill_in "Name", with: @act.name
    click_on "Update Act"

    assert_text "Act was successfully updated"
    click_on "Back"
  end

  test "destroying a Act" do
    visit acts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Act was successfully destroyed"
  end
end
end
