require 'test_helper'

class NamerTest < ActiveSupport::TestCase
  test "the random person" do
    1.upto(1000) do 
      @character = Character.new
      random_person = Namer.random_person
      @character.first_name = random_person[1]
      @character.last_name = random_person[0]
      @character.middle_name = random_person[6]
      @character.race = random_person[3]
      @attributes = {
        "physical appearance_hair color_value": random_person[4],
        "physical appearance_eye color_value": random_person[5],
        "gender_gender_value": random_person[7],
        "gender_sex_value": (random_person[2] == "M" ? "Male" : "Female")
      }
    end
  end
end
