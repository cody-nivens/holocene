require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "the distance" do
    beijing = City.where(name: "Beijing")[0]
    delhi = City.where(name: "Delhi")[0]
    assert_equal 2348,beijing.distance(delhi).to_i
  end
end
