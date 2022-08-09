# frozen_string_literal: true

require 'test_helper'

class ChaptersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @key_point = key_points(:key_point_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'creating a Chapter flow' do
    get new_book_chapter_url(book_id: @book.id)

    assert_difference('Chapter.count', 1) do
      post polymorphic_url([@book, :chapters]),
           params: { chapter: { body: 'Waiting for the Great Pumpkin, Linus sighed.[[slug55]]', name: 'The Great Pumpkin Patch',
                                position: 1, scripted_type: 'Book', scripted_id: Book.last.id } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'chapters/show'

    assert_select '.alert', /.*Chapter was successfully created.*/
    assert_select 'h3', /.*The Great Pumpkin Patch.*/

    chapter = Chapter.last

    assert_select 'a[text()=?]', 'Missing footnote'

    get new_chapter_footnote_url(chapter_id: chapter.id, slug: 'test2')
    assert_response :success
    assert_template 'footnotes/new'

    assert_difference('Footnote.count') do
      post chapter_footnote_create_url(chapter_id: chapter.id),
           params: { footnote: { body: 'Peanuts', noted_id: chapter.id, noted_type: 'Chapter', slug: 'newslug' } }
    end

    assert_response :redirect
    follow_redirect!
    assert_template 'footnotes/show'

    note = Footnote.last

    assert_select '.alert', /.*Footnote was successfully created.*/
  end
end
