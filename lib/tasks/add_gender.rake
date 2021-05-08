namespace :holocene do
    desc "Add Sex and Gender values to characters"
    task create_genders: :environment do
        book = Book.find(2)
        gender_gender = CharacterAttribute.where(name: "Gender")[0]
        gender_sex = CharacterAttribute.where(name: "Sex")[0]
        book.characters.each do |character| gender = CharacterValue.where(character_id: character.id, character_attribute: gender_gender.id); sex = CharacterValue.where(character_id: character.id, character_attribute: gender_sex.id)
          gender = CharacterValue.where(character_id: character.id, character_attribute_id: gender_gender.id)
          if gender.length == 0
            gender = CharacterValue.new({character_id: character.id, character_attribute_id: gender_gender.id, value: "Straight"})
            gender.save
          end
          sex = CharacterValue.where(character_id: character.id, character_attribute_id: gender_sex.id)
          if sex.length == 0
            sex = CharacterValue.new({character_id: character.id, character_attribute_id: gender_sex.id, value: "Male"})
            sex.save
          end
        end
    end
    desc "Add Hair color and Eye color values to characters"
    task add_colors: :environment do
        book = Book.find(2)
        hair_color = CharacterAttribute.where(name: "Hair color")[0]
        eye_color = CharacterAttribute.where(name: "Eye color")[0]
        book.characters.each do |character| gender = CharacterValue.where(character_id: character.id, character_attribute: hair_color.id); sex = CharacterValue.where(character_id: character.id, character_attribute: eye_color.id)
          hair = CharacterValue.where(character_id: character.id, character_attribute_id: hair_color.id)
          if hair.length == 0
            hair = CharacterValue.new({character_id: character.id, character_attribute_id: hair_color.id, value: Character.gen_hair_color})
            hair.save
          end
          eye = CharacterValue.where(character_id: character.id, character_attribute_id: eye_color.id)
          if eye.length == 0
            eye = CharacterValue.new({character_id: character.id, character_attribute_id: eye_color.id, value: Character.gen_eye_color})
            eye.save
          end
        end
    end
end
