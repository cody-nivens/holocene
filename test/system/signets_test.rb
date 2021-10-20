# frozen_string_literal: true

require 'application_system_test_case'

class SignetsTest < ApplicationSystemTestCase
  setup do
    @signet = signets(:signet_1)
    @sigged = @signet.sigged
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test 'signets edit' do
    visit edit_signet_url(@signet)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path polymorphic_path([@sigged, @signet])
    click_on 'Back'
    assert find(:xpath, ".//a[contains(@title, 'Signets')]", match: :first)
    assert_current_path polymorphic_path(@sigged)
  end

  test 'signets index' do
    visit polymorphic_url([@sigged, :signets])
#    visit New Signet
    assert_link 'New Signet'
    click_on 'New Signet'
    assert_no_link 'New Signet'
    assert_current_path new_polymorphic_path([@sigged, :signet])
    click_on 'Back'
    assert_link 'New Signet'
    assert_current_path polymorphic_path([@sigged, :signets])
  end

  test 'signets show' do
    visit signet_url(@signet)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_signet_path(@signet)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path signet_path(@signet)
  end

  test 'creating a Signet' do
    visit book_chapters_url(@scripted)

    within(:xpath, "//a[text()='Cultural Events ']/../../..") do
      Capybara.page.find('.fa-sticky-note').click
    end

    click_on 'New Signet'

    select Signet.color_name(@signet.color), from: 'Color'
    fill_in 'Message', with: @signet.message
    click_on 'Create Signet'

    assert_text 'Signet was successfully created'
    click_on 'Back'
  end

  test 'not creating a Signet' do
    visit book_chapters_url(@scripted)

    within(:xpath, "//a[text()='Cultural Events ']/../../..") do
      Capybara.page.find('.fa-sticky-note').click
    end

    click_on 'New Signet'
    select Signet.color_name(@signet.color), from: 'Color'
    fill_in 'Message', with: ''
    click_on 'Create Signet'

    assert_text 'Message must have content'
    click_on 'Back'
  end
end
