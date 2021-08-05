require "application_system_test_case"

class SignetsTest < ApplicationSystemTestCase
  setup do
    @signet = signets(:signet_1)
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "creating a Signet" do
    visit book_chapters_url(@scripted)

    within(:xpath, "//a[text()='Cultural Events ']/../../..") do
      Capybara.page.find('.fa-sticky-note-o').click
    end

    click_on "New Signet"

    select Signet.color_name(@signet.color), from: "Color"
    fill_in "Message", with: @signet.message
    click_on "submit"

    assert_text "Signet was successfully created"
    click_on "Back"
  end

  test "not creating a Signet" do
    visit book_chapters_url(@scripted)

    within(:xpath, "//a[text()='Cultural Events ']/../../..") do
      Capybara.page.find('.fa-sticky-note-o').click
    end

    click_on "New Signet"
    select Signet.color_name(@signet.color), from: "Color"
    fill_in "Message", with: ""
    click_on "submit"

    assert_text "Message must have content"
    click_on "Back"
  end
end
