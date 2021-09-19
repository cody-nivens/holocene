# frozen_string_literal: true

require 'test_helper'

class EventTypeTest < ActiveSupport::TestCase
  test 'map_loc' do
    event_type = event_types(:Cultural)
    assert_equal 6, event_type.map_locs.length
  end
end
