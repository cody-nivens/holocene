# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'set value' do
    book = books(:book_1)
    values = book.set_values

    assert_equal book, values[0]
  end

  test 'word count I' do
    book = books(:book_2)
    count = book.word_count
    assert_not_equal 0, count
  end

  test 'word count II' do
    book = books(:book_4)
    count = book.word_count
    assert_equal 0, count
  end
end
