require "application_system_test_case"

class ChaptersTest < ApplicationSystemTestCase
  setup do
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Chapters map" do
    visit polymorphic_url([@scripted, :chapters])
    Capybara.page.find('.fa-map-o', match: :first).click
    assert_no_text "link_to"
    assert_link "Back"
    click_on "Back"
  end

  test "demoting a chapter" do
    visit polymorphic_url([@scripted, :chapters])
    Capybara.page.find('.fa-level-down', match: :first).click
  end

  test "promoting a chapter" do
    visit polymorphic_url([@scripted, :chapters])
    Capybara.page.find('.fa-level-up', match: :first).click
  end

  test "visiting the timeline" do
    visit chapter_timeline_url(@chapter)
    assert_text "HUNTER/GATHERER AGRICULTURE"
  end

  test "visiting display" do
    visit chapter_url(@chapter)

    within(:css, ".footer") do
      Capybara.page.find('.fa-list').click
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
      Capybara.page.find('.fa-list').click
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
      Capybara.page.find('.fa-list').click
    end
    assert_no_text "Domestication of Cats"
  end

  test "creating a Chapter" do
    visit polymorphic_url([@scripted, :chapters])
    click_on "New Chapter"

    fill_in "Name", with: @chapter.name
    fill_in_rich_text_area "chapter_body", with: "[[test99]]"

    click_on "Create Chapter"

    assert_text "Chapter was successfully created"
    assert_link "Missing footnote"
    click_on "Missing footnote"

    assert_text "New Footnote"
    fill_in_rich_text_area "footnote_body", with: "Now is the time for men to come to the aid of Man"
    click_on "Create Footnote"

    assert_text "Footnote was successfully created"

    click_on "Back"
  end

  test "should not create a Chapter" do
    visit polymorphic_url([@scripted, :chapters])
    click_on "New Chapter"

    fill_in "Name", with: ""
    click_on "Create Chapter"

    assert_text "can't be blank"

    fill_in "Name", with: @chapter.name
    click_on "Create Chapter"
    assert_text "Chapter was successfully created"

    click_on "Back"
  end
end
