require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "set value" do
    book = books(:book_1)
    values = book.set_values

    assert_equal book, values[0]
  end
end
