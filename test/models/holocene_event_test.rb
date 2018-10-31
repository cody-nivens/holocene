require 'test_helper'

class HoloceneEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "slide should return json" do
      holocene_event = holocene_events(:one)
      assert_not_equal "", holocene_event.slide
  end

end
