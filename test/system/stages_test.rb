require "application_system_test_case"

class StagesTest < ApplicationSystemTestCase
  setup do
    @stage = stages(:stage_1)
    @user = users(:users_1)
    sign_in @user
#    ThinkingSphinx::Test.init
#    ThinkingSphinx::Test.start index: false
#    index
  end

  teardown do
#    ThinkingSphinx::Test.stop
#    ThinkingSphinx::Test.clear
  end

  test "walk the stage side menus" do
    @book = books(:book_2)
    @stage = stages(:stage_1)
    walk_sides('Stage')
  end

  if 1 == 0
  test "walk the stage menus" do
    @book = books(:book_2)
    @stage = stages(:stage_1)
    walk_menu('Stage', ['Welcome', 'Book', 'Story', 'Support'],[], debug: false)
  end
  end

  ['Stage List','Scenes','Scene Characters','Time by Actor','Time by Location',
   'Actor by Location','Stats','Acts','Locations','Actors'].each do |item|
    test "walk the Stage #{item} menu" do
      menu_test 'Stage', item
    end
  end

  if 1 == 0
  test "visiting the index" do
    visit stages_url
    assert_selector "h1", text: "Stages"
  end

  test "creating a Stage" do
    visit stages_url
    click_on "New Stage"

    fill_in "Name", with: @stage.name
    click_on "Create Stage"

    assert_text "Stage was successfully created"
    click_on "Back"
  end

  test "updating a Stage" do
    visit stages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @stage.name
    click_on "Update Stage"

    assert_text "Stage was successfully updated"
    click_on "Back"
  end

  test "destroying a Stage" do
    visit stages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stage was successfully destroyed"
  end
end
end
