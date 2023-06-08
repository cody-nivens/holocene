require "application_system_test_case"

class ActorsTest < ApplicationSystemTestCase
  setup do
    @actor = actors(:actor_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

   test "drive the actor cycle" do
    drive_cycle('Stage', 'Actors')
  end

   if 1 == 0
  test "visiting the index" do
    visit book_actors_url(@book)
    assert_selector "h2", text: "Actors"
  end

  test "creating a Actor" do
    visit book_actors_url(@book)
    click_on "New Actor"

    fill_in "Name", with: @actor.name
    click_on "Create Actor"

    assert_text "Actor was successfully created"
    click_on "Back"
  end

  test "updating a Actor" do
    visit book_actors_url(@book)
    click_on "Edit", match: :first

    fill_in "Name", with: @actor.name
    click_on "Update Actor"

    assert_text "Actor was successfully updated"
    assert_current_path book_actors_path(@book)
  end

  test "destroying a Actor" do
    visit book_actors_url(@book)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actor was successfully destroyed"
  end
end
end
