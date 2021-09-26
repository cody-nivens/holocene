# frozen_string_literal: true

require 'application_system_test_case'

class ChaptersTest < ApplicationSystemTestCase
  setup do
    @chapter = chapters(:chapter_1)
    @scripted = @chapter.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test 'chapters edit' do
#    visit Show
    #visit edit_chapter_url(@chapter), params: { scripted_type: @scripted.class.name, scripted_id: @scripted.id }
    visit edit_chapter_url(@chapter)
    assert_text 'Show'
    click_on 'Show'
    assert_current_path chapter_path(@chapter)
    click_on 'Back'
    assert_current_path book_chapters_path(@scripted)
  end

  test 'chapters geo_map' do
#    visit Display
    visit geo_map_chapter_url(@chapter)
    assert_text 'Display'
    click_on 'Display'
    assert_current_path chapter_display_path(@chapter)
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
  end

  test 'chapters index' do
    visit polymorphic_url([@scripted, :chapters])
#    visit Chapters, Details
    assert_text 'Chapters, Details'
    click_on 'Chapters, Details'
    assert_current_path polymorphic_path([@scripted, :chapters])
    click_on 'Back'
    assert_current_path polymorphic_path(@scripted)
#    visit Chapters, TOC
    assert_text 'Chapters, TOC'
    click_on 'Chapters, TOC'
    assert_current_path toc_path(@scripted)
    click_on 'Back'
    assert_current_path polymorphic_path(@scripted)
#    visit New Chapter
    assert_text 'New Chapter'
    click_on 'New Chapter'
    assert_current_path new_polymorphic_path([@scripted, Chapter])
    click_on 'Back'
    assert_current_path polymorphic_path(@scripted)
  end

  test 'chapters show' do
    visit chapter_url(@chapter)
#    visit Aside
    assert_text 'Aside'
    click_on 'Aside'
    assert_current_path (@chapter.aside.nil? ? new_chapter_aside_path(chapter_id: @chapter) : edit_aside_path(@chapter.aside))
    click_on 'Back'
    #assert_current_path chapter_path(@chapter)
#    visit Citations
    visit chapter_url(@chapter)
    assert_text 'Citations'
    click_on 'Citations'
    assert_current_path chapter_citations_path(@chapter)
    click_on 'Back'
    #assert_current_path chapter_path(@chapter)
#    visit Footnotes
    visit chapter_url(@chapter)
    within ".footer" do
      assert_text 'Footnotes'
      click_on 'Footnotes'
    end
    assert_current_path chapter_footnotes_path(@chapter)
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
#    visit Partition
    visit chapter_url(@chapter)
    assert_text 'Partition'
    click_on 'Partition'
    assert_current_path (@chapter.partition.nil? ? new_chapter_partition_path(@chapter) : edit_partition_path(@chapter.partition))
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
#    visit Sections
    visit chapter_url(@chapter)
    assert_text 'Sections'
    click_on 'Sections'
    assert_current_path chapter_sections_path(@chapter)
    click_on 'Back'
    assert_current_path chapter_path(@chapter)
  end

  test 'visiting the Chapters map' do
    visit polymorphic_url([@scripted, :chapters])
    Capybara.page.find('.fa-map-o', match: :first).click
    assert_no_text 'link_to'
    assert_link 'Back'
    click_on 'Back'
  end

  test 'demoting a chapter' do
    visit polymorphic_url([@scripted, :chapters])
    Capybara.page.find('.fa-level-down', match: :first).click
  end

  test 'promoting a chapter' do
    visit polymorphic_url([@scripted, :chapters])
    Capybara.page.find('.fa-level-up', match: :first).click
  end

  test 'visiting the timeline' do
    visit chapter_timeline_url(@chapter)
    assert_text 'HUNTER/GATHERER AGRICULTURE'
  end

  test 'visiting display' do
    visit chapter_url(@chapter)

    within(:css, '.footer') do
      Capybara.page.find('.fa-list').click
    end

    assert_link 'Add Event'
    assert_text 'Domestication of Horses'

    click_on 'Add Event'

    assert_link 'Add Event'
    assert_button 'Add Events'

    he = HoloceneEvent.find_by(name: 'Domestication of Cats')
    find(:xpath, "//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on 'Add Events'

    assert_text 'Chapter was successfully updated'
    assert_text 'Domestication of Cats'

    within(:css, '.footer') do
      Capybara.page.find('.fa-list').click
    end

    assert_text 'Domestication of Cats'
    he = HoloceneEvent.find_by(name: 'Domestication of Cats')
    find(:xpath, "//input[@type='checkbox' and @value=#{he.id}]").set(true)

    assert_button 'Delete Events'

    find('#holocene_event_other_id').find(:xpath, 'option[2]').select_option
    find(:xpath, "//input[@type='checkbox' and @value=#{he.id}]").set(true)

    assert_button 'Move Events'
    click_on 'Move Events'

    assert_text 'Chapter was successfully updated'

    within(:css, '.footer') do
      Capybara.page.find('.fa-list').click
    end
    assert_no_text 'Domestication of Cats'
  end

  test 'creating a Chapter' do
    visit polymorphic_url([@scripted, :chapters])
    click_on 'New Chapter'

    fill_in 'Name', with: @chapter.name
    fill_in_rich_text_area 'chapter_body', with: '[[test99]]'

    click_on 'Create Chapter'

    assert_text 'Chapter was successfully created'
    assert_link 'Missing footnote'
    click_on 'Missing footnote'

    assert_text 'New Footnote'
    fill_in_rich_text_area 'footnote_body', with: 'Now is the time for men to come to the aid of Man'
    click_on 'Create Footnote'

    assert_text 'Footnote was successfully created'

    click_on 'Back'
  end

  test 'should not create a Chapter' do
    visit polymorphic_url([@scripted, :chapters])
    click_on 'New Chapter'

    fill_in 'Name', with: ''
    click_on 'Create Chapter'

    assert_text "can't be blank"

    fill_in 'Name', with: @chapter.name
    click_on 'Create Chapter'
    assert_text 'Chapter was successfully created'

    click_on 'Back'
  end
end
