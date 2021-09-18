require 'test_helper'

class KeyWordsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_word= key_words(:key_word_1)
    @book = @key_word.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    ThinkingSphinx::Test.run do
      get book_key_words_url(:book_id => @book.id)

      assert_response 200
      @key_words = KeyWord.all

      assert_select "a[text()=?]",'New Key Word'
      assert_select "a[href=?]", new_polymorphic_path([@book, :key_word])
      assert_select "a[text()=?]",'Back'
      assert_select "a[href=?]", book_path(@book)
      assert_select ".footer>div>a", 2
      assert_template 'key_words/index'

      assert_select 'h1','Key Words'

      ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
       "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
        assert_template partial: partial
      end
    end
  end
end
