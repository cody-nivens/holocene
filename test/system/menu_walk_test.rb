require "application_system_test_case"

class MenuWalkTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user

    setup_menus
  end

  test "visiting the nonfiction Book page menus" do
    setup_page 'BookC'
    verify_menus @menu_items_book_non
  end

  test "visiting the fiction Book page menus" do
    setup_page 'Book'
    verify_menus @menu_items_book_fic
  end

  test "visiting the Story page menus" do
    setup_page 'Story'
    verify_menus @menu_items_story
  end

  test "visiting the Chapter page menus" do
    setup_page 'Chapter'
    verify_menus @menu_items_chapter
  end

  test "visiting the Stage page menus" do
    setup_page 'Stage'
    verify_menus @menu_items_stage
  end

  test "visiting the Welcome page menus" do
    visit root_url
    verify_menus @menu_items_welcome
  end
end
