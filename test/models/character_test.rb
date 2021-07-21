require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
   test "generating character lineage" do
     Character.create_character_lineage(["Charles","George"])
   end
   test "generating character eye color" do
     srand(67809)
     assert_equal Character.gen_eye_color, "Brown"
     srand(67160)
     assert_equal Character.gen_eye_color, "Blue"
     srand(999982)
     assert_equal Character.gen_eye_color, "Amber"
     srand(999979)
     assert_equal Character.gen_eye_color, "Hazel"
     srand(67830)
     assert_equal Character.gen_eye_color, "Gray"
     srand(64400)
     assert_equal Character.gen_eye_color, "Green"
   end

   test "generating character hair color" do
     srand(67809)
     assert_equal Character.gen_hair_color, "Light Brown"
     srand(67823)
     assert_equal Character.gen_hair_color, "Dark Brown"
     srand(64400)
     assert_equal Character.gen_hair_color, "Blond"
     srand(59700)
     assert_equal Character.gen_hair_color, "Red"
     srand(99814)
     assert_equal Character.gen_hair_color, "Black"
   end
end
