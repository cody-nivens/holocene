require "application_system_test_case"

class CitationsTest < ApplicationSystemTestCase
  setup do
    @citation = citations(:one)
    @biblioentry = @citation.biblioentry
    @user = users(:one)
    sign_in @user
  end

  test "visiting the index" do
    visit biblioentry_citations_url(:biblioentry_id => @biblioentry.id)
    assert_selector "h1", text: "Citations"
  end

  test "visiting the timeline" do
    visit citation_timeline_url(@citation)
    assert_text "Timeline configuration has no events"
  end


  test "visiting display" do
      visit biblioentry_citation_url(@citation.biblioentry,@citation)

    assert_text "MyCitation1"
    assert_link "Display"
    click_on "Display"

    assert_button "Add Events"
    assert_text "First event"

    he = HoloceneEvent.find_by_name("First event")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Add Events"
   
    assert_text "Citation was successfully updated."
    assert_text "First event"

    assert_link  "Display"
    click_on "Display"
    assert_button "Delete Events"

    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Delete Events"
   
    assert_text "Citation was successfully updated."
    assert_no_text "First event"

  end

  test "creating a Citation" do
    visit biblioentry_citations_url(:biblioentry_id => @biblioentry.id)
    click_on "New Citation"

    fill_in "Body", with: @citation.body
    fill_in "Name", with: @citation.name
    click_on "Create Citation"

    assert_text "Citation was successfully created"
    click_on "Back"
  end

  test "should not create a Citation" do
    visit biblioentry_citations_url(:biblioentry_id => @biblioentry.id)
    click_on "New Citation"

    fill_in "Body", with: @citation.body
    fill_in "Name", with: ""
    click_on "Create Citation"

    assert_text "error prohibited this citation from being saved"
    assert_text "Name can't be blank"

    fill_in "Name", with: @citation.name
    click_on "Create Citation"
    assert_text "Citation was successfully created"
    click_on "Back"
  end

  test "updating a Citation" do
      visit biblioentry_citations_url(:biblioentry_id => @biblioentry.id,:id => @citation.id)
    click_on "Edit", match: :first

    fill_in "Body", with: @citation.body
    fill_in "Name", with: @citation.name
    click_on "Update Citation"

    assert_text "Citation was successfully updated"
    click_on "Back"
  end

  test "should not update a Citation" do
      visit biblioentry_citations_url(:biblioentry_id => @biblioentry.id,:id => @citation.id)
    click_on "Edit", match: :first

    fill_in "Body", with: @citation.body
    fill_in "Name", with: ""
    click_on "Update Citation"

    assert_text "error prohibited this citation from being saved"
    assert_text "Name can't be blank"

    fill_in "Name", with: @citation.name
    click_on "Update Citation"
    assert_text "Citation was successfully updated"
    click_on "Back"
  end

  test "destroying a Citation" do
      visit biblioentry_citations_url(:biblioentry_id => @biblioentry.id, :id => @citation.id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citation was successfully destroyed"
  end
end
