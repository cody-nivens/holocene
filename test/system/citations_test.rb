require "application_system_test_case"

class CitationsTest < ApplicationSystemTestCase
  setup do
    @citation = footnotes(:footnote_4)
    @chapter = @citation.noted
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Citation index" do
    visit citations_index_url(:chapter_id => @chapter.id)
    assert_selector "h1", text: "Citations"
  end

  if 1 == 0
  test "creating a Citation" do
    visit citations_index_url(:chapter_id => @chapter.id)
    click_on "New Citation"

    select "MyString_1", from: 'citation_artifact_id'
    click_on "Create Citation"

    assert_text "Citation was successfully created"
    click_on "Back"
  end

  test "updating a Citation" do
    visit citations_index_url(:chapter_id => @chapter.id)
    click_on "Edit", match: :first

    select "MyString_1", from: 'citation_artifact_id'
    click_on "Update Citation"

    assert_text "Citation was successfully updated"
    click_on "Back"
  end

  test "destroying a Citation" do
    visit citations_index_url(:chapter_id => @chapter.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citation was successfully destroyed"
  end
  end
end
