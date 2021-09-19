# frozen_string_literal: true

require 'application_system_test_case'

class FootnotesTest < ApplicationSystemTestCase
  setup do
    @footnote = footnotes(:footnote_1)
    @chapter = chapters(:chapter_1)
    @section = sections(:section_1)
    @holocene_event = holocene_events(:holocene_event_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'creating a Footnote' do
    visit new_chapter_footnote_url(chapter_id: @chapter.id, slug: 'test_glug_2')

    fill_in 'Slug', with: @footnote.slug
    fill_in_rich_text_area 'footnote_body', with: 'Test 1'
    click_on 'Create Footnote'

    assert_text 'Footnote was successfully created'
    click_on 'Back', match: :first
  end

  test 'should not create a Footnote' do
    visit new_chapter_footnote_url(chapter_id: @chapter.id, slug: 'test_glug_2')

    fill_in 'Slug', with: ''
    click_on 'Create Footnote'

    assert_text "can't be blank"

    fill_in 'Slug', with: @footnote.slug
    click_on 'Create Footnote'
    assert_text 'Footnote was successfully created'
    click_on 'Back', match: :first
  end

  test 'creating a Footnote_2' do
    visit new_section_footnote_url(section_id: @section.id, slug: 'test_glug_2')

    fill_in 'Slug', with: @footnote.slug
    fill_in_rich_text_area 'footnote_body', with: 'Test 1'
    click_on 'Create Footnote'

    assert_text 'Footnote was successfully created'
    click_on 'Back', match: :first
  end

  test 'should not create a Footnote_2' do
    visit new_section_footnote_url(section_id: @section.id, slug: 'test_glug_2')

    fill_in 'Slug', with: ''
    click_on 'Create Footnote'

    assert_text "can't be blank"

    fill_in 'Slug', with: @footnote.slug
    click_on 'Create Footnote'
    assert_text 'Footnote was successfully created'
    click_on 'Back', match: :first
  end

  test 'creating a Footnote_3' do
    visit new_holocene_event_footnote_url(holocene_event_id: @holocene_event.id, slug: 'test_glug_2')

    fill_in 'Slug', with: @footnote.slug
    fill_in_rich_text_area 'footnote_body', with: 'Test 1'
    click_on 'Create Footnote'

    assert_text 'Footnote was successfully created'
    click_on 'Back', match: :first
  end

  test 'should not create a Footnote_3' do
    visit new_holocene_event_footnote_url(holocene_event_id: @holocene_event.id, slug: 'test_glug_2')

    fill_in 'Slug', with: ''
    click_on 'Create Footnote'

    assert_text "can't be blank"

    fill_in 'Slug', with: @footnote.slug
    click_on 'Create Footnote'
    assert_text 'Footnote was successfully created'
    click_on 'Back', match: :first
  end
end
