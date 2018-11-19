require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:section_1)
    @chapter = chapters(:chapter_1)
    @book = @chapter.book
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit book_chapter_sections_url(@book, @chapter)
    assert_selector "h1", text: "Sections"
    assert_link "New Section"
    assert_no_text "link_to"
  end

  test "visiting the timeline" do
    visit section_timeline_url(@section)
    assert_text "Timeline configuration has no events"
  end

  test "visiting display" do
    visit book_chapter_section_url(@book,@chapter,@section)

    assert_text "Domestication of the Animals"
    assert_link "Display"
    click_on "Display"

    assert_button "Add Events"
    assert_text "Domestication of Horses"

    he = HoloceneEvent.find_by_name("Domestication of Horses")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Add Events"
   
    assert_text "Section was successfully updated"
    assert_text "Domestication of Horses"

    assert_link  "Display"
    click_on "Display"
    assert_button "Delete Events"

    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Delete Events"
   
    assert_text "Section was successfully updated"
    assert_no_text "Domestication of Horses"

  end

  test "creating a Section" do
    visit book_chapter_sections_url(@book, @chapter)
    click_on "New Section"

    fill_in "Name", with: @section.name
    page.execute_script("var wysihtml5Editor = $('#section_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@section.body}')")

    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back", match: :first
  end

  test "should not create a Section" do
    visit book_chapter_sections_url(@book, @chapter)
    click_on "New Section"

    fill_in "Name", with: ""
    page.execute_script("var wysihtml5Editor = $('#section_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@section.body}')")

    click_on "Create Section"

    assert_text "can't be blank"

    fill_in "Name", with: @section.name
    click_on "Create Section"
    assert_text "Section was successfully created"
    click_on "Back", match: :first
  end

  test "updating a Section" do
    visit book_chapter_section_url(@book, @chapter, @section)
    click_on "Edit", match: :first

    fill_in "Name", with: @section.name
    page.execute_script("var wysihtml5Editor = $('#section_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@section.body}')")

    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back", match: :first
  end

  test "should not update a Section" do
    visit book_chapter_section_url(@book, @chapter, @section)
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    page.execute_script("var wysihtml5Editor = $('#section_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@section.body}')")

    click_on "Update Section"

    assert_text "can't be blank"

    fill_in "Name", with: @section.name
    click_on "Update Section"
    assert_text "Section was successfully updated"
    click_on "Back", match: :first
  end

  test "destroying a Section" do
    visit book_chapter_sections_url(@book, @chapter)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section was successfully destroyed"
  end
end
