require 'test_helper'

class KeyWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_word = key_words(:key_word_1)
    @book = @key_word.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_key_words_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_key_word_url(@book)
    assert_response :success
  end

  test "should create key_word" do
    assert_difference('KeyWord.count') do
      post book_key_words_url(@book), params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
    end

    assert_redirected_to key_word_url(KeyWord.last)
  end

  test "should not create key_word" do
    assert_difference('KeyWord.count',0) do
      post book_key_words_url(@book), params: { key_word: { book_id: @key_word.book_id, key_word: ''} }
    end

    assert_response 422
  end

  test "should show key_word" do
    get key_word_url(@key_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_key_word_url(@book,@key_word)
    assert_response :success
  end

  test "should update key_word" do
    patch book_key_word_url(@book,@key_word), params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
    assert_redirected_to key_word_url(@key_word)
  end

  test "should not update key_word" do
    patch book_key_word_url(@book,@key_word), params: { key_word: { book_id: @key_word.book_id, key_word: ''} }
    assert_response 422
  end

  test "should destroy key_word" do
    assert_difference('KeyWord.count', -1) do
      delete book_key_word_url(@book,@key_word)
    end

    assert_redirected_to book_key_words_url(@book)
  end
end
