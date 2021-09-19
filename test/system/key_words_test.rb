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
