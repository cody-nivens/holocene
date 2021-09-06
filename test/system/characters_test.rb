require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:character_1)
    @book = @character.books[0]
    @story = @book.stories.last
    @key_point = @story.key_points.last
    @scene = @key_point.scenes.last
    @situated = @scene.situated

    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Character index searching using first name" do
    visit book_url(:id => @book.id)
    within ".footer" do
      assert_text "Characters"
      click_on "Characters"
    end

    assert_text "Last Name LIKE"
    assert_text "Jill"
    assert_text "Joe"

    fill_in "First Name LIKE", with: "ji"
    click_on "Search"
    assert_text "Jill"
    assert_no_text "Joe"
  end

  test "visiting the Character index searching using last name" do
    visit book_url(:id => @book.id)
    within ".footer" do
      assert_text "Characters"
      click_on "Characters"
    end

    assert_text "Last Name LIKE"
    assert_text "Jill"
    assert_text "Joe"

    fill_in "Last Name LIKE", with: "smi"
    click_on "Search"
    assert_text "John"
    assert_no_text "Joe"
  end

  test "visiting the Character index for blank ethnicity" do
    visit book_url(:id => @book.id)
    assert_text "Stats"
    click_on "Stats"
    #assert_text "Ethnicity"
    #click_on "Ethnicity"
    assert_text "White"
    click_on "<blank>"
    assert_text "Counsel"
  end

  test "visiting the Character index for blank occupation_class" do
    visit book_url(:id => @book.id)
    assert_text "Occupation Class"
    click_on "Occupation Class"
    assert_text "Educated"
    click_on "<blank>"
    assert_text "Counsel"
  end

  test "visiting the Character index for occupation class tab" do
    visit books_url
    assert_link "The Phantom"
    click_on "The Phantom"
    click_on "Occupation Class"
    click_on "Educated"
  end
end
