require 'test_helper'

class ScenesHelperTest < ActionView::TestCase
  test "scene should know book" do
    scene = scenes(:scene_1)
    book = books(:book_2)
    assert_equal book,scene.book
  end
end
