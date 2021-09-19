# frozen_string_literal: true

require 'test_helper'

class FootnotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @footnote = footnotes(:footnote_1)
    @footnote2 = footnotes(:footnote_2)
    @footnote3 = footnotes(:footnote_3)
    @chapter = chapters(:chapter_1)
    @section = sections(:section_1)
    @holocene_event = holocene_events(:holocene_event_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get chapter index' do
    get chapter_footnotes_url(chapter_id: @chapter.id)
    assert_response :success
  end

  test 'should get section index' do
    get section_footnotes_url(section_id: @section.id)
    assert_response :success
  end

  test 'should get new footnote form for chapter' do
    get chapter_footnotes_url(chapter_id: @chapter.id, slug: 'test2')
    assert_response :success
  end

  test 'should get new footnote form for section' do
    get section_footnotes_url(section_id: @section.id, slug: 'test2')
    assert_response :success
  end

  test 'should get new footnote form for holocene_event' do
    get holocene_event_footnotes_url(holocene_event_id: @holocene_event.id, slug: 'test2')
    assert_response :success
  end

  test 'should create chapter footnote' do
    @chapter = @footnote.noted
    assert_difference('Footnote.count') do
      post chapter_footnote_create_url(chapter_id: @chapter.id),
           params: { footnote: { body: @footnote.body, noted_id: @footnote.noted_id, noted_type: @footnote.noted_type,
                                 slug: 'newslug' } }
    end

    assert_redirected_to chapter_footnote_url(@chapter, Footnote.last)
  end

  test 'should create section footnote' do
    @section = @footnote2.noted
    assert_difference('Footnote.count') do
      post section_footnote_create_url(section_id: @section.id),
           params: { footnote: { body: @footnote2.body, noted_id: @section.id, noted_type: 'Section',
                                 slug: 'newslug' } }
    end

    assert_redirected_to section_footnote_url(@section, Footnote.last)
  end

  test 'should create holocene_event footnote' do
    @holocene_event = @footnote3.noted
    assert_difference('Footnote.count') do
      post holocene_event_footnote_create_url(holocene_event_id: @holocene_event.id, slug: 'Test23'),
           params: { footnote: { body: @footnote2.body, noted_id: @holocene_event.id, noted_type: 'HoloceneEvent',
                                 slug: 'newslug' } }
    end

    assert_redirected_to holocene_event_footnote_url(@holocene_event, Footnote.last)
  end

  test 'should not create footnote' do
    assert_difference('Footnote.count', 0) do
      post chapter_footnote_create_url(chapter_id: @chapter.id),
           params: { footnote: { body: @footnote.body, noted_id: @footnote.noted_id, noted_type: @footnote.noted_type,
                                 slug: '' } }
    end

    assert_response :success
  end

  test 'should get footnote edit for a chapter' do
    get new_chapter_footnote_path(chapter_id: @chapter.id, slug: 'chapter_test')
    assert_response :success
  end

  test 'should get footnote edit for a section' do
    get new_section_footnote_path(section_id: @section.id, slug: 'section_test')
    assert_response :success
  end

  test 'should get footnote edit for a holocene_event' do
    get new_holocene_event_footnote_path(holocene_event_id: @holocene_event.id, slug: 'holocene_event_test')
    assert_response :success
  end

  test 'should show footnote' do
    get chapter_footnote_url(chapter_id: @chapter.id, id: @footnote.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_footnote_url(@footnote)
    assert_response :success
  end

  test 'should update chapter footnote' do
    patch footnote_url(@footnote),
          params: { footnote: { body: @footnote.body, noted_id: @footnote.noted_id, noted_type: @footnote.noted_type,
                                slug: @footnote.slug } }
    assert_redirected_to chapter_footnote_url(@chapter, @footnote)
  end

  test 'should update section footnote' do
    @section = @footnote2.noted
    patch footnote_url(@footnote2),
          params: { footnote: { body: @footnote2.body, noted_id: @footnote2.noted_id, noted_type: @footnote2.noted_type,
                                slug: @footnote2.slug } }
    assert_redirected_to section_footnote_url(@section, @footnote2)
  end

  test 'should not update footnote' do
    patch footnote_url(@footnote),
          params: { footnote: { body: @footnote.body, noted_id: @footnote.noted_id, noted_type: @footnote.noted_type,
                                slug: '' } }
    assert_response :success
  end

  test 'should update holocene event footnote' do
    patch footnote_url(@footnote3),
          params: { footnote: { body: @footnote3.body, noted_id: @footnote3.noted_id, noted_type: @footnote3.noted_type,
                                slug: @footnote3.slug } }
    assert_redirected_to holocene_event_footnote_url(@holocene_event, @footnote3)
  end

  test 'should destroy chapter footnote' do
    assert_difference('Footnote.count', -1) do
      delete footnote_url(@footnote)
    end

    assert_redirected_to chapter_footnotes_url(chapter_id: @chapter.id)
  end

  test 'should destroy section footnote' do
    assert_difference('Footnote.count', -1) do
      delete footnote_url(@footnote2)
    end

    assert_redirected_to section_footnotes_url(section_id: @section.id)
  end

  test 'should destroy holocene event footnote' do
    assert_difference('Footnote.count', -1) do
      delete footnote_url(@footnote3)
    end

    assert_redirected_to holocene_event_footnotes_url(holocene_event_id: @holocene_event.id)
  end
end
