require "application_system_test_case"

class MenuWalkTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test "walk the welcome menus" do
    walk_menu('Welcome')
  end

  test "walk the non-fiction book menus" do
    @book = books(:book_1)
    walk_menu('BookC')
  end

  test "walk the chapter menus" do
    @book = books(:book_1)
    @chapter = @book.chapters.first
    walk_menu('chapter')
  end

  test "walk the fiction book menus" do
    @book = books(:book_2)
    walk_menu('Book')
  end

  test "walk the story menus" do
    @book = books(:book_2)
    @story = Story.first
    walk_menu('Story')
  end

  test "walk the stage menus" do
    @book = books(:book_2)
    @stage = stages(:stage_1)
    walk_menu('Stage')
  end
end
