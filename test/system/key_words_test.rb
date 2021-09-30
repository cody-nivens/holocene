# frozen_string_literal: true

require 'application_system_test_case'

class KeyWordsTest < ApplicationSystemTestCase
  self.use_transactional_tests = false

  setup do
    @key_word = key_words(:key_word_2)
    @book = @key_word.book
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

  test 'key_words edit' do
    visit edit_key_word_url(@key_word)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path key_word_path(@key_word)
    click_on 'Back'
    assert_link 'New Key Word'
    assert_current_path book_key_words_path(@book)
  end

  test 'key_words index' do
    visit book_key_words_url(book_id: @book.id)
#    visit New Key Word
    assert_link 'New Key Word'
    click_on 'New Key Word'
    assert_no_link 'New Key Word'
    assert_current_path new_polymorphic_path([@book, :key_word])
    click_on 'Back'
    assert_link 'New Key Word'
    assert_current_path book_key_words_path(@book)
  end

  test 'key_words show' do
    visit key_word_url(@key_word)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_key_word_path(@key_word)
    click_on 'Back'
    assert_link 'New Key Word'
    assert_current_path book_key_words_path(@book)
  end

  test 'visiting the index' do
    visit book_key_words_url(book_id: @book.id)
    assert_selector 'h1', text: 'Key Words'
  end

  test 'creating a Key word' do
    visit book_key_words_url(book_id: @book.id)
    click_on 'New Key Word'

    fill_in 'Key word', with: @key_word.key_word
    click_on 'Create Key word'

    assert_text 'Key word was successfully created'
    click_on 'Back'
  end

  test 'updating a Key word' do
    visit book_key_words_url(book_id: @book.id)
    click_on 'Edit', match: :first

    fill_in 'Key word', with: @key_word.key_word
    click_on 'Update Key word'

    assert_text 'Key word was successfully updated'
    click_on 'Back'
  end
end
