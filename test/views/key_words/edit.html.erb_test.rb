# frozen_string_literal: true

require 'test_helper'

class KeyWordsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_word = key_words(:key_word_1)
    @book = @key_word.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_key_word_url(@key_word)
    assert_select 'a[title=?]', 'Back'
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', key_word_path(@key_word)
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@book, :key_words])
    assert_template 'key_words/edit'
  end
end
