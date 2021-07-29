require "application_system_test_case"

class FootnotesTest < ApplicationSystemTestCase
  setup do
    @footnote = footnotes(:footnote_1)
    @chapter = chapters(:chapter_1)
    @section = sections(:section_1)
    @holocene_event = holocene_events(:holocene_event_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Footnote index" do
    visit chapter_footnotes_url(:chapter_id => @chapter.id)
    assert_selector "h1", text: "Footnotes"
    assert_link "New Footnote"
    assert_no_text "link_to"
  end

  test "showing the footnote" do
      visit chapter_footnote_url(:chapter_id => @chapter.id, :id => @footnote.id)
    assert_text "footnote_slug"
  end

  test "creating a Footnote" do
    visit new_chapter_footnote_url(:chapter_id => @chapter.id, :slug => "test_glug_2")

    fill_in "Slug", with: @footnote.slug
    fill_in_rich_text_area "footnote_body", with: "Test 1"
    click_on "Create Footnote"

    assert_text "Footnote was successfully created"
    click_on "Back", match: :first
  end

  test "should not create a Footnote" do
    visit new_chapter_footnote_url(:chapter_id => @chapter.id, :slug => "test_glug_2")

    fill_in "Slug", with: ""
    click_on "Create Footnote"

    assert_text "can't be blank"

    fill_in "Slug", with: @footnote.slug
    click_on "Create Footnote"
    assert_text "Footnote was successfully created"
    click_on "Back", match: :first
  end

  test "updating a Footnote" do
      visit chapter_footnotes_url(:chapter_id => @chapter.id)
    click_on "Edit", match: :first

    fill_in "Slug", with: @footnote.slug
    fill_in_rich_text_area "footnote_body", with: "Test 1"
    click_on "Update Footnote"

    assert_text "Footnote was successfully updated"
    click_on "Back", match: :first
  end

  test "should not update a Footnote" do
      visit chapter_footnotes_url(:chapter_id => @chapter.id)
    click_on "Edit", match: :first

    fill_in "Slug", with: ""
    click_on "Update Footnote"

    assert_text "can't be blank"

    fill_in "Slug", with: @footnote.slug
    click_on "Update Footnote"
    assert_text "Footnote was successfully updated"
    click_on "Back", match: :first
  end

  test "destroying a Footnote" do
    visit chapter_footnotes_url(:chapter_id => @chapter.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Footnote was successfully destroyed"
  end
  test "visiting the Footnote index_2" do
    visit section_footnotes_url(:section_id => @section.id)
    assert_selector "h1", text: "Footnotes"
  end

  test "creating a Footnote_2" do
    visit new_section_footnote_url(:section_id => @section.id, :slug => "test_glug_2")

    fill_in "Slug", with: @footnote.slug
    fill_in_rich_text_area "footnote_body", with: "Test 1"
    click_on "Create Footnote"

    assert_text "Footnote was successfully created"
    click_on "Back", match: :first
  end

  test "should not create a Footnote_2" do
    visit new_section_footnote_url(:section_id => @section.id, :slug => "test_glug_2")

    fill_in "Slug", with: ""
    click_on "Create Footnote"

    assert_text "can't be blank"

    fill_in "Slug", with: @footnote.slug
    click_on "Create Footnote"
    assert_text "Footnote was successfully created"
    click_on "Back", match: :first
  end

  test "updating a Footnote_2" do
      visit section_footnotes_url(:section_id => @section.id)
    click_on "Edit", match: :first

    fill_in "Slug", with: @footnote.slug
    fill_in_rich_text_area "footnote_body", with: "Test 1"
    click_on "Update Footnote"

    assert_text "Footnote was successfully updated"
    click_on "Back", match: :first
  end

  test "should not update a Footnote_2" do
    visit section_footnotes_url(:section_id => @section.id)
    click_on "Edit", match: :first

    fill_in "Slug", with: ""
    click_on "Update Footnote"


    fill_in "Slug", with: @footnote.slug
    click_on "Update Footnote"
    assert_text "Footnote was successfully updated"
    click_on "Back", match: :first
  end

  test "destroying a Footnote_2" do
    visit section_footnotes_url(:section_id => @section.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Footnote was successfully destroyed"
  end
  test "visiting the Footnote index_3" do
    visit holocene_event_footnotes_url(:holocene_event_id => @holocene_event.id)
    assert_selector "h1", text: "Footnotes"
  end

  test "creating a Footnote_3" do
    visit new_holocene_event_footnote_url(:holocene_event_id => @holocene_event.id, :slug => "test_glug_2")

    fill_in "Slug", with: @footnote.slug
    fill_in_rich_text_area "footnote_body", with: "Test 1"
    click_on "Create Footnote"

    assert_text "Footnote was successfully created"
    click_on "Back", match: :first
  end

  test "should not create a Footnote_3" do
    visit new_holocene_event_footnote_url(:holocene_event_id => @holocene_event.id, :slug => "test_glug_2")

    fill_in "Slug", with: ""
    click_on "Create Footnote"

    assert_text "can't be blank"

    fill_in "Slug", with: @footnote.slug
    click_on "Create Footnote"
    assert_text "Footnote was successfully created"
    click_on "Back", match: :first
  end

  test "updating a Footnote_3" do
      visit holocene_event_footnotes_url(:holocene_event_id => @holocene_event.id)
    click_on "Edit", match: :first

    fill_in "Slug", with: @footnote.slug
    fill_in_rich_text_area "footnote_body", with: "Test 1"
    click_on "Update Footnote"

    assert_text "Footnote was successfully updated"
    click_on "Back", match: :first
  end

  test "should not update a Footnote_3" do
      visit holocene_event_footnotes_url(:holocene_event_id => @holocene_event.id)
    click_on "Edit", match: :first

    fill_in "Slug", with: ""
    click_on "Update Footnote"

    assert_text "can't be blank"

    fill_in "Slug", with: @footnote.slug
    click_on "Update Footnote"
    assert_text "Footnote was successfully updated"
    click_on "Back", match: :first
  end

  test "destroying a Footnote_3" do
    visit holocene_event_footnotes_url(:holocene_event_id => @holocene_event.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Footnote was successfully destroyed"
  end
end
