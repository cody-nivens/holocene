# frozen_string_literal: true

require 'test_helper'

class BooksShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @book_2 = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show book I' do
    get book_path(@book)
    assert_response :success

    assert_select 'a[href=?]', edit_book_path(@book)

    assert_select 'a[text()=?]', 'New Chapter'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :chapter])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', books_path
    assert_select 'a[text()=?]', 'Chapters, TOC'
    assert_select 'a[href=?]', toc_path(@book)
    assert_select 'a[text()=?]', 'Key Words'
    assert_select 'a[href=?]', book_key_words_path(@book)
    assert_select 'a[text()=?]', 'Authors'
    assert_select 'a[href=?]', book_authors_path(@book)

    assert_select '.footer>div>a', 5
    assert_template 'books/show'
  end

  test 'should show book II' do
    get book_path(@book_2, long: true)
    assert_response :success

    assert_select 'td', '12 (10)'

    assert_select 'a[href=?]', edit_book_path(@book_2)

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', books_path
    assert_select 'a[text()=?]', 'New Story'
    assert_select 'a[href=?]', new_book_story_path(book_id: @book_2.id)
    assert_select 'a[text()=?]', 'All Stories'
    assert_select 'a[href=?]', book_stories_path(@book_2, long: true)
    assert_select 'a[text()=?]', 'Characters'
    assert_select 'a[href=?]', polymorphic_path([@book_2, :characters])
    assert_select 'a[text()=?]', 'Key Points'
    assert_select 'a[href=?]', polymorphic_path([@book_2, :key_points])
    assert_select 'a[text()=?]', 'Scenes'
    assert_select 'a[href=?]', polymorphic_path([@book_2, :scenes])
    assert_select 'a[text()=?]', 'Stats'
    assert_select 'a[href=?]', polymorphic_path([@book_2, :stats])
    assert_select 'a[text()=?]', 'Top Characters'
    assert_select 'a[href=?]', polymorphic_path([@book_2, :chars])
    assert_select 'a[text()=?]', 'Artifacts'
    assert_select 'a[href=?]', book_artifacts_path(@book_2)
    assert_select 'a[text()=?]', 'Key Words'
    assert_select 'a[href=?]', book_key_words_path(@book_2)
    assert_select 'a[text()=?]', 'Authors'
    assert_select 'a[href=?]', book_authors_path(@book_2)

    assert_select '.footer>div>a', 11
    assert_template 'books/show'
  end
end
