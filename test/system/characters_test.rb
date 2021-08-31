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

  test "visiting the Character index for ethnicity tab" do
    visit book_characters_url(:book_id => @book.id)
    assert_selector "h1", text: "Characters"
    click_on "Ethnicity"
    click_on "White"
  end

  test "visiting the Character index for blank ethnicity" do
    visit book_url(:id => @book.id)
    assert_text "Ethnicity"
    click_on "Ethnicity"
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
