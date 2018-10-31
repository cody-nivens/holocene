require 'test_helper'

class HoloceneEventsHelperTest < ActionView::TestCase
  # ...

  test 'convert_ad forms proper date' do
    assert_match /2000 BC/, convert_ad(-2000)
  end

end

