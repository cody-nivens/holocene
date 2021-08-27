require 'test_helper'

class ApplicationRecordsHelperTest < ActionView::TestCase
  test "supress the first crumb" do
    character = characters(:character_1)
    values = character.set_values

    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])

    string2 =surpress_first(string)

    assert_not_equal string, string2
  end

end
