require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
   test "generating legacy" do
     Character.create_character_lineage(["Charles","George"])
   end
end
