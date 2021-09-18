require 'test_helper'

class KeyWordsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_word= key_words(:key_word_1)
    @book = @key_word.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should show key_word" do
    ThinkingSphinx::Test.run do
      get key_word_path(@key_word)
      assert_response :success

      assert_select "a[text()=?]",'Edit'
      assert_select "a[href=?]", edit_key_word_path(@key_word)
      assert_select "a[text()=?]",'Back'
      assert_select "a[href=?]", book_key_words_path(@book)
      assert_select ".footer>div>a", 2
      assert_template 'key_words/show'
    end
  end
end
