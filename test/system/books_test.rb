# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    DownloadHelpers.clear_downloads
    @book = books(:book_1)
    @book_2 = books(:book_2)
    @book_3 = books(:book_3)
    @user = users(:users_1)
    sign_in @user
    ThinkingSphinx::Test.init
    ThinkingSphinx::Test.start index: false
    index
  end

  teardown do
    ThinkingSphinx::Test.stop
    ThinkingSphinx::Test.clear
  end

  test 'books edit' do
#    visit Show
    visit edit_book_url(@book)
    assert_text 'Show'
    click_on 'Show'
    assert_current_path book_path(@book)
    click_on 'Back'
    assert_current_path books_path
  end

  test 'books index' do
#    visit New Book
    visit books_url
    assert_text 'New Book'
    click_on 'New Book'
    assert_current_path new_book_path
    click_on 'Back'
    assert_current_path books_path
  end

  test 'books show' do
    visit book_url(@book_2)
    assert_text @book_2.name

#    visit Artifacts
    within ".footer" do
      assert_text 'Artifacts'
      click_on 'Artifacts'
    end
    assert_current_path book_artifacts_path(@book_2)
    click_on 'Back'
    #assert_current_path book_path(@book_2)
#    visit All Stories
    visit book_url(@book_2)
    assert_text 'All Stories'
    click_on 'All Stories'
    assert_current_path book_stories_path(@book_2)


    click_on 'Back'

    #assert_current_path book_path(@book_2)
#    visit Authors
    visit book_url(@book_2)
    within ".footer" do
      assert_text 'Authors'
      click_on 'Authors'
    end
    assert_current_path book_authors_path(@book_2)
    #click_on 'Back'
    #assert_current_path book_path(@book_2)
#    visit Chapters, TOC
    visit book_url(@book)
    assert_text 'Chapters, TOC'
    click_on 'Chapters, TOC'
    assert_current_path toc_path(@book)
    click_on 'Back'
    #assert_current_path book_path(@book)
#    visit Characters
    visit book_url(@book_2)
    assert_text 'Characters'
    within '.footer' do
      click_on 'Characters'
    end
    assert_current_path polymorphic_path([@book_2, :characters])
    click_on 'Back'
    #assert_current_path book_path(@book_2)
#    visit Key Points
    visit book_url(@book_2)
    assert_text 'Key Points'
    click_on 'Key Points'
    assert_current_path polymorphic_path([@book_2, :key_points])
    click_on 'Back'
    #assert_current_path book_path(@book_2)
#    visit Key Words
    visit book_url(@book_2)
    assert_text 'Key Words'
    within '.footer' do
      click_on 'Key Words'
    end
    assert_current_path book_key_words_path(@book_2)
    click_on 'Back'
    #assert_current_path book_path(@book_2)
#    visit New Chapter
    visit book_url(@book)
    assert_text 'New Chapter'
    click_on 'New Chapter'
    assert_current_path new_polymorphic_path([@book, :chapter])
    click_on 'Back'
    #assert_current_path book_path(@book)
#    visit New Story
    visit book_url(@book_2)
    assert_text 'New Story'
    click_on 'New Story'
    assert_current_path new_book_story_path(book_id: @book_2.id)
    click_on 'Back'
    assert_current_path book_path(@book_2)
#    visit Scenes
    visit book_url(@book_2)
    assert_text 'Scenes'
    click_on 'Scenes'
    assert_current_path polymorphic_path([@book_2, :scenes])
    click_on 'Back'
    #assert_current_path book_path(@book_2)
#    visit Stats
    visit book_url(@book_2)
    assert_text 'Stats'
    click_on 'Stats'
    assert_current_path polymorphic_path([@book_2, :stats])
    click_on 'Back'
    #assert_current_path book_path(@book_2)
  end

  test 'books toc' do
#    visit Chapters, Details
    visit toc_url(@book)
    assert_text 'Chapters, Details'
    click_on 'Chapters, Details'
    assert_current_path polymorphic_path([@book, :chapters])
    click_on 'Back'
    #assert_current_path toc_path(@book)
#    visit New Chapter
    assert_text 'New Chapter'
    click_on 'New Chapter'
    assert_current_path new_book_chapter_path(@book)
    click_on 'Back'
    #assert_current_path toc_path(@book)
  end

  test 'sort books' do
    visit books_url
    assert_text 'The Phantom'

    # save_and_open_page
    # debugger
    # take_screenshot
    assert_match /#{@book.name}.*#{@book_2.name}.*#{@book_3.name}/m, page.html

    draggable = find(:css, "#book-#{@book_3.id}")
    droppable = find(:css, "#book-#{@book_2.id}")
    draggable.drag_to(droppable)
    wait_for_ajax

    assert_match /#{@book.name}.*#{@book_3.name}.*#{@book_2.name}/m, page.html
    visit current_path

    assert_match /#{@book.name}.*#{@book_3.name}.*#{@book_2.name}/m, page.html
  end

  test 'creating a nonfictional Book flow' do
    visit books_url
    click_on 'New Book'

    fill_in 'Name', with: 'Test 1'
    # fill_in_rich_text_area "book_body", with: "Test 1"
    click_on 'Create Book'
    assert_text 'Book was successfully created'
    assert_text 'Test 1'

    assert_text 'New Chapter'
    click_on 'New Chapter'
    assert_text 'Show events'

    fill_in 'Name', with: 'Chapter 1'
    fill_in_rich_text_area 'chapter_body', with: '[[test99]]'
    click_on 'Create Chapter'

    assert_text 'Chapter was successfully created'
    assert_text 'Chapter 1'

    assert_link 'Missing footnote'
    click_on 'Missing footnote'

    assert_text 'New Footnote'
    fill_in_rich_text_area 'footnote_body', with: 'Now is the time for men to come to the aid of Man'
    click_on 'Create Footnote'

    assert_text 'Footnote was successfully created'

    click_on 'Back'
  end

  test 'creating a fictional Book flow' do
    visit books_url
    click_on 'New Book'

    fill_in 'Name', with: 'Test 1'
    fill_in_rich_text_area 'book_body', with: 'Test 1'
    find(:css, '#book_fiction').set(true)
    click_on 'Create Book'

    assert_text 'Book was successfully created'
    assert_text 'Test 1'

    click_on 'All Stories'
    assert_text 'New Story'
    click_on 'New Story'

    fill_in 'Summary', with: 'Chasing Gadout'
    fill_in 'Title', with: 'The Impossible Dream'
    click_on 'Create Story'
    assert_text 'Story was successfully created'

    assert_text 'New Key Point'
    click_on 'New Key Point'

    fill_in 'Hook', with: 'Good points'
    fill_in 'Inciting incident', with: 'Trying times'
    fill_in 'Key element', with: 'Life'
    fill_in 'First plot point', with: 'Snoopy chases the Red Baron'
    click_on 'Create Key point'
    assert_text 'Key point was successfully created'

    find(:xpath, ".//a[i[contains(@class, 'fa-plus')]]", match: :first).click
    assert_text 'New Scene'
    click_on 'New Scene'

    assert_text 'Abc'

    fill_in 'Abc', with: 'G00001'
    fill_in 'Scene sequel', with: 0
    fill_in 'Time', with: 103

    # fill_in_rich_text_area "scene_summary", with: "Test 2"
    # assert_text "Test 2"
    # take_screenshot

    click_on 'Create Scene'

    assert_text 'Scene was successfully created'
    # assert_text "Test 2"

    click_on 'Back'
  end

  test 'should not create a Book' do
    visit books_url
    click_on 'New Book'

    fill_in 'Name', with: ''
    click_on 'Create Book'

    assert_text "can't be blank"

    fill_in 'Name', with: @book.name
    click_on 'Create Book'
    assert_text 'Book was successfully created'
    click_on 'Back'
  end
end
