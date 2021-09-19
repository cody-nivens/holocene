# frozen_string_literal: true

require 'test_helper'

class TimelineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'timeline_json should return json' do
    timeline = timelines(:timeline_1)
    assert_not_equal '', timeline.timeline_json('off')
  end
end
