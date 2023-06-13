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

  if 1 == 0
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

    assert_response :unprocessable_entity
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
      patch key_word_url(@key_word),
        params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
      assert_redirected_to key_word_url(@key_word)
    end
  end

  test 'should not update key_word' do
    patch key_word_url(@key_word), params: { key_word: { book_id: @key_word.book_id, key_word: '' } }
    assert_response :unprocessable_entity
  end

  test 'should destroy key_word' do
    assert_difference('KeyWord.count', -1) do
      delete key_word_url(@key_word)
    end

    assert_redirected_to book_key_words_url(@book)
  end
end
  test 'should get edit' do
    get edit_polymorphic_path(@key_word)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@book, :key_word])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show key_word TS' do
    ThinkingSphinx::Test.run do
      index
      get key_word_path(@key_word, format: :turbo_stream)

      assert_turbo_stream action: :replace, target: "objects"
      assert_turbo_stream action: :replace, target: "nav-bar"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "header"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_response :success
    end
  end

  test 'should show key_word index TS' do
    ThinkingSphinx::Test.run do
      index
      get book_key_words_url(@book, format: :turbo_stream)

      assert_turbo_stream action: :replace, target: "objects"
      assert_turbo_stream action: :replace, target: "nav-bar"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "header"
      assert_turbo_stream action: :replace, target: "side_controls"

      assert_response :success
    end
  end


  test "should create key_word TS" do
    ThinkingSphinx::Test.run do
      index
      assert_difference('KeyWord.count') do
        post book_key_words_url(@book, format: 'turbo_stream'),
               params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
      end

      assert_no_turbo_stream action: :update, target: "messages"
      assert_turbo_stream action: :replace, target: "new_object"
      assert_turbo_stream action: :replace, target: "objects"
      #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
      #  assert_equal "<template>message_1</template>", selected.children.to_html
      #end
      assert_response :success
    end
  end

  test "should update key_word TS" do
    ThinkingSphinx::Test.run do
      index
      patch  key_word_path(@key_word, format: :turbo_stream),
        params: { key_word: { book_id: @key_word.book_id, key_word: @key_word.key_word } }
      assert_turbo_stream action: :replace, target: "objects"

      assert_no_turbo_stream action: :update, target: "messages"
      assert_response :success
    end
  end

  test "should destroy key_word TS" do
    ThinkingSphinx::Test.run do
      index
      assert_difference('KeyWord.count', -1) do
        delete key_word_url(@key_word, format: :turbo_stream)
      end

      assert_turbo_stream action: :replace, target: "objects"
      assert_response :success
    end
  end
end
