require "application_system_test_case"

class ChaptersTest < ApplicationSystemTestCase
  setup do
    @chapter = chapters(:chapter_1)
    @book = @chapter.book
    @user = users(:users_1)
    sign_in @user
  end

  test "generating PDF" do
    visit book_chapter_url(@book,@chapter, format: 'pdf')

    content = DownloadHelpers::download_content
    body = convert_pdf_to_page(content)
    assert_match /Climate and History/,body
  end


  test "visiting the index" do
    visit book_chapters_url(@book)
    assert_selector "h1", text: "Chapters"
    assert_link "New Chapter"
    assert_no_text "link_to"
  end

  test "visiting the map" do
    visit book_chapters_url(@book)
    assert_selector "h1", text: "Chapters"
    assert_link "New Chapter"
    assert_no_text "link_to"
    click_on "Show", match: :first
    assert_link "Map"
    click_on "Map"
    assert_link "Back"
    click_on "Back"
  end

  test "visiting the timeline" do
    visit chapter_timeline_url(@chapter)
    assert_text "Domestication of Horses"
  end

  test "visiting display" do
    visit book_chapter_url(@book,@chapter)

    assert_selector "h1", text: "Cultural Events"

    within(:css, ".footer") do
        assert_link  "Display"
        click_on "Display"
    end

    assert_link "Add Event"
    assert_text "Domestication of Horses"

    click_on "Add Event"

    assert_link "Add Event"
    assert_button "Add Events"

    he = HoloceneEvent.find_by_name("Domestication of Cats")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Add Events"

    assert_text "Chapter was successfully updated"
    assert_text "Domestication of Cats"

    within(:css, ".footer") do
        assert_link  "Display"
        click_on "Display"
    end

    assert_text "Domestication of Cats"
    he = HoloceneEvent.find_by_name("Domestication of Cats")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)

    assert_button "Delete Events"

    find('#holocene_event_other_id').find(:xpath, 'option[2]').select_option
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)

    assert_button "Move Events"
    click_on "Move Events"

    assert_text "Chapter was successfully updated"

    within(:css, ".footer") do
        assert_link  "Display"
        click_on "Display"
    end
    assert_no_text "Domestication of Cats"
  end

  test "creating a Chapter" do
    visit book_chapters_url(@book)
    click_on "New Chapter"

    fill_in "Name", with: @chapter.name
    page.execute_script("var wysihtml5Editor = $('#chapter_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@chapter.body}\[\[test99\]\]')")

    click_on "Create Chapter"

    assert_text "Chapter was successfully created"
    assert_link "Missing footnote"
    click_on "Missing footnote"

    assert_text "New Footnote"
    page.execute_script("var wysihtml5Editor = $('#footnote_body').data('wysihtml5').editor;wysihtml5Editor.setValue('Now is the time for men to come to the aid of Man')")
    click_on "Create Footnote"

    assert_text "Footnote was successfully created"

    click_on "Back"
  end

  test "should not create a Chapter" do
    visit book_chapters_url(@book)
    click_on "New Chapter"

    fill_in "Name", with: ""
    click_on "Create Chapter"

    assert_text "can't be blank"

    fill_in "Name", with: @chapter.name
    click_on "Create Chapter"
    assert_text "Chapter was successfully created"

    click_on "Back"
  end

  test "updating a Chapter" do
    visit book_chapters_url(@book)
    click_on "Edit", match: :first

    fill_in "Name", with: @chapter.name
    page.execute_script("var wysihtml5Editor = $('#chapter_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@chapter.body}')")

    click_on "Update Chapter"

    assert_text "Chapter was successfully updated"
    click_on "Back", match: :first
  end

  test "should not update a Chapter" do
    visit book_chapters_url(@book)
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    click_on "Update Chapter"

    assert_text "can't be blank"

    fill_in "Name", with: @chapter.name
    click_on "Update Chapter"
    assert_text "Chapter was successfully updated"
    click_on "Back", match: :first
  end

  test "destroying a Chapter" do
    visit book_chapters_url(@book)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chapter was successfully destroyed"
  end
end
