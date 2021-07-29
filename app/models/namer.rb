class Namer < ApplicationRecord

  def self.random_person
    race = Character.gen_race

    case race
    when "White"
      hair_color = Character.gen_hair_color
      eye_color  = Character.gen_eye_color(hair_color)
    when "Black"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
    when "Asian"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
    when "Am Indian"
      hair_color = "Black"
      eye_color = "Brown"
    when "Latino Mixed"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
    when "Latino"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
    end

    first_name = Namer.find_by_sql("select * from namers where first_name=1 order by rand() limit 1")[0]

    retry_name = 0
    until first_name.check_race(race) || retry_name == 3 do
      first_name = Namer.find_by_sql("select * from namers where first_name=1 order by rand() limit 1")[0]
      retry_name += 1
    end

    middle_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{first_name.gender}\" order by rand() limit 1")[0]
    retry_name = 0
    until middle_name.check_race(race) || retry_name == 3 do
      middle_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{first_name.gender}\" order by rand() limit 1")[0]
      retry_name += 1
    end

    surname = Namer.find_by_sql("select *from namers where first_name=0 order by rand() limit 1")[0]
    retry_name = 0
    until surname.check_race(race) || retry_name == 3 do
      surname = Namer.find_by_sql("select *from namers where first_name=0 order by rand() limit 1")[0]
      retry_name += 1
    end

    sexuality = ''
    case rand(100)
    when 0..95
      sexuality = "Straight"
    else
      sexuality = "Gay"
    end
    return [ surname.name, first_name.name, first_name.gender, race, hair_color, eye_color, middle_name.name, sexuality]
  end

  def check_race(race)
    case race
    when "White"
      return self.white > 0
    when "Black"
      return self.black > 0
    when "Asian"
      return self.asian > 0
    when "Am Indian"
      return self.indian > 0
    when "Latino Mixed"
      return self.latino_mixed > 0
    when "Latino"
      return self.latino > 0
    else
      return false
    end
  end
end
