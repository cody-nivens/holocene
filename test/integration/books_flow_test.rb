# frozen_string_literal: true

require 'test_helper'

class BooksFlowTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'creating a nonfictional Book flow' do
    get new_book_url

    assert_difference('Book.count') do
      post books_url,
           params: { book: { body: 'A dark and stormy night', name: 'Jump the Jam Juice', user_id: @user.id } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'books/show'

    assert_select '.alert', /.*Book was successfully created.*/
    assert_select 'h2', 'Jump the Jam Juice'

    book = Book.last

    get new_book_chapter_url(book_id: book.id)

    assert_difference('Chapter.count', 1) do
      post polymorphic_url([book, :chapters]),
           params: { chapter: { body: 'Waiting for the Great Pumpkin, Linus sighed.[[slug55]]', name: 'The Great Pumpkin Patch',
                                position: 1, scripted_type: 'Book', scripted_id: Book.last.id } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'chapters/show'

    assert_select '.alert', /.*Chapter was successfully created.*/
    assert_select 'h2', /.*The Great Pumpkin Patch.*/

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

  test 'creating a fictional Book flow' do
    get new_book_url

    assert_difference('Book.count') do
      post books_url,
           params: { book: { body: 'A dark and stormy night', name: 'Jump the Jam Juice', user_id: @user.id } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'books/show'

    assert_select '.alert', /.*Book was successfully created.*/
    assert_select 'h2', 'Jump the Jam Juice'

    book = Book.last

    get new_book_story_url(book_id: book.id)

    assert_difference('Story.count') do
      post book_stories_url(book_id: book.id),
           params: { story: { book_id: book.id, summary: 'Full of bright eyed enthusiasm',
                              title: 'Sammy goes to Washington' } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'stories/show'

    assert_select '.alert', /.*Story was successfully created.*/
    assert_select 'h2', /Sammy goes to Washington/

    story = Story.last

    assert_difference('KeyPoint.count') do
      post polymorphic_url([story, :key_points]),
           params: { key_point: { scripted_id: story.id, scripted_type: story.class.name, climax: @key_point.climax,
                                  first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: @key_point.hook, inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'key_points/show'
  end
end
