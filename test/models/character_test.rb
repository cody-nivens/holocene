require 'test_helper'

class CharacterTest < ActiveSupport::TestCase

  test "name" do
    Character.all.each do |character|
      assert_not_nil character.name
      assert_not_nil character.full_name
      assert_not_nil character.full_last_first
    end
  end

  test "gen sexuality" do
    1.upto(100).each do |i|
      Character.gen_sexuality
    end
  end

  test "text to sex" do
    assert_equal 0,Character.text_to_sex('Male')
    assert_equal 1,Character.text_to_sex('Female')
    assert_equal 2,Character.text_to_sex('')
  end

  test "set value" do
    character = characters(:character_1)
    values = character.set_values

    book = books(:book_2)

    assert_equal book, values[0]
    assert_equal character, values[1]
  end

   test "generating character lineage" do
     Character.first.create_lineage(["Charles","George"])
   end
   test "generating character eye color" do
     srand(49121)
     assert_equal "Brown", Character.gen_eye_color("Blond")
     srand(49958)
     assert_equal "Blue", Character.gen_eye_color("Blond")
     srand(999979)
     assert_equal "Hazel", Character.gen_eye_color("Blond")
     srand(64400)
     assert_equal "Green", Character.gen_eye_color("Blond")

     srand(49121)
     assert_equal "Brown", Character.gen_eye_color("Black")
     srand(49826)
     assert_equal "Blue", Character.gen_eye_color("Black")
     srand(999979)
     assert_equal "Hazel", Character.gen_eye_color("Black")
     srand(64400)
     assert_equal "Green", Character.gen_eye_color("Black")

     srand(49121)
     assert_equal "Brown", Character.gen_eye_color("Red")
     srand(49862)
     assert_equal "Blue", Character.gen_eye_color("Red")
     srand(49809)
     assert_equal "Hazel", Character.gen_eye_color("Red")
     srand(64400)
     assert_equal "Green", Character.gen_eye_color("Red")

     srand(49121)
     assert_equal "Brown", Character.gen_eye_color("Brown")
     srand(9893)
     assert_equal "Blue", Character.gen_eye_color("Brown")
     srand(9833)
     assert_equal "Hazel", Character.gen_eye_color("Brown")
     srand(999979)
     assert_equal "Green", Character.gen_eye_color("Brown")
   end

   test "generating character hair color" do
     srand(67809)
     assert_equal "Light Brown", Character.gen_hair_color
     srand(67823)
     assert_equal "Dark Brown", Character.gen_hair_color
     srand(49837)
     assert_equal "Blond", Character.gen_hair_color
     srand(49813)
     assert_equal "Red", Character.gen_hair_color
     srand(99814)
     assert_equal "Black", Character.gen_hair_color
   end

   test "stats" do
     book = books(:book_2)
     stats = Character.stats(book.characters,"occupation_class","sex")

     assert_equal 2,stats.keys.length
   end
end
