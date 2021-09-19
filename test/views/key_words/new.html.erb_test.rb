# frozen_string_literal: true

require 'test_helper'

class KeyWordsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_word = key_words(:key_word_1)
    @book = @key_word.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :key_word])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', book_key_words_path(@book)
    assert_select '.footer>div>a', 1
    assert_template 'key_words/new'
  end
end
