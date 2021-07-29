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

  test "updating a Citation" do
    visit citations_index_url(:chapter_id => @chapter.id)
    assert_text "Medieval"
    select "Medieval", from: "biblioentries_ids"

    click_on "Save Citation"

    within "#cit_ids" do
      assert_text "Medieval"
    end
    select "Medieval", from: "cit_ids"
    click_on "Save Citation"
    within "#biblioentries_ids" do
      assert_text "Medieval"
    end
    within "#cit_ids" do
      assert_no_text "Medieval"
    end

    click_on "Back"
  end

end
