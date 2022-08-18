# frozen_string_literal: true

require 'test_helper'

class CharacterAttributeTest < ActiveSupport::TestCase
  test "the related_name" do
    assert_equal "",character_attributes(:character_attribute_1).related_name
  end

  test "the related_name 2" do
    assert_equal "Mother",character_attributes(:character_attribute_4).related_name
  end
end
