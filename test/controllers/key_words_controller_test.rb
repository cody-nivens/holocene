# frozen_string_literal: true

require 'test_helper'

class KeyWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_word = key_words(:key_word_1)
    @key_word_2 = key_words(:key_word_2)
    @book = @key_word.book
    @book_2 = @key_word_2.book
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index 1' do
    ThinkingSphinx::Test.run do
      index
      get book_key_words_url(@book)
      assert_response :success
    end
  end

  test 'should get index 2' do
    ThinkingSphinx::Test.run do
      index
      get polymorphic_url([@book_2, :key_words])
      assert_response :success
    end
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :key_word])
    assert_response :success
  end

  test 'should create key_word' do
    ThinkingSphinx::Test.run do
      index
      assert_difference('KeyWord.count') do
        post polymorphic_url([@book, :key_words]),
             params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
      end

      assert_redirected_to key_word_url(KeyWord.last)
    end
  end

  test 'should not create key_word' do
    assert_difference('KeyWord.count', 0) do
      post book_key_words_url(@book), params: { key_word: { book_id: @key_word.book_id, key_word: '' } }
    end

    assert_response 422
  end

  test 'should show key_word 1' do
    ThinkingSphinx::Test.run do
      index
      get key_word_url(@key_word)
      assert_response :success
    end
  end

  test 'should show key_word 2' do
    ThinkingSphinx::Test.run do
      index
      get key_word_url(@key_word_2)
      assert_response :success
    end
  end

  test 'should get edit' do
    get edit_key_word_url(@key_word)
    assert_response :success
  end

  test 'should update key_word' do
    ThinkingSphinx::Test.run do
      index
      patch key_word_url(@key_word), params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
      assert_redirected_to key_word_url(@key_word)
    end
  end

  test 'should not update key_word' do
    patch key_word_url(@key_word), params: { key_word: { book_id: @key_word.book_id, key_word: '' } }
    assert_response 422
  end

  test 'should destroy key_word' do
    assert_difference('KeyWord.count', -1) do
      delete key_word_url(@key_word)
    end

    assert_redirected_to book_key_words_url(@book)
  end
end
