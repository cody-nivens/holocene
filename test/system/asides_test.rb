# frozen_string_literal: true

require 'application_system_test_case'

class AsidesTest < ApplicationSystemTestCase
  setup do
    @aside = asides(:aside_1)
    @chapter_3 = chapters(:chapter_3)
    @chapter = chapters(:chapter_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'asides edit' do
#    visit Show
    visit edit_aside_url(@aside)
    assert_text 'Show'
    click_on 'Show'
    assert_current_path aside_path(@aside)
    click_on 'Back'
    assert_current_path chapter_asides_path(@chapter)

    visit edit_aside_url(@aside)
#    visit Destroy
    assert_text 'Destroy'
    accept_alert do
      click_on 'Destroy'
    end
    assert_current_path chapter_path(@chapter)
    click_on 'Back'
    assert_current_path book_chapters_path(@book)
  end

  test 'asides index' do
#    visit New Aside
    visit chapter_asides_url(@chapter_3)
    assert_text 'New Aside'
    click_on 'New Aside'
    assert_current_path new_chapter_aside_path(@chapter_3)
    click_on 'Back'
    assert_current_path chapter_asides_path(@chapter_3)
  end

  test 'asides show' do
    visit aside_url(@aside)
#    visit Edit
    assert_text 'Edit'
    click_on 'Edit'
    assert_current_path edit_aside_path(@aside)
    click_on 'Back'
    #assert_current_path chapter_asides_path(@chapter)
  end

  test 'creating an Aside' do
    visit chapter_asides_url(@chapter_3)
    click_on 'New Aside'

    fill_in 'Name', with: @aside.name
    fill_in_rich_text_area 'aside_body', with: 'Test 1'
    click_on 'Create Aside'

    assert_text 'Aside was successfully created.'
    click_on 'Back'
  end

  test 'not creating an Aside' do
    visit chapter_asides_url(@chapter_3)
    click_on 'New Aside'

    fill_in 'Name', with: ''
    fill_in_rich_text_area 'aside_body', with: 'Test 1'
    click_on 'Create Aside'

    assert_text "can't be blank"
    click_on 'Back'
  end
end
