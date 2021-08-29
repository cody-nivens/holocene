class Namer < ApplicationRecord
  def self.random_person
    race = Character.gen_race
    sex = rand(2)
    gender = (sex == 0 ? "M" : "F")

    case race
    when "White"
      hair_color = Character.gen_hair_color
      eye_color  = Character.gen_eye_color(hair_color)
      column_name = "white"
    when "Black"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
      column_name = "black"
    when "Asian"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
      column_name = "asian"
    when "Am Indian"
      hair_color = "Black"
      eye_color = "Brown"
      column_name = "indian"
    when "Latino Mixed"
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
      column_name = "latino_mixed"
    else
      hair_color = "Black"
      eye_color = Character.gen_black_eye_color
      column_name = "latino"
    end

    retry_max = 10

    column_percent = 30
    first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !first_name.nil? || retry_name == retry_max do
      first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    middle_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !middle_name.nil? || retry_name == retry_max do
      middle_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      middle_name = nil if (middle_name.nil? ? false : middle_name.name == first_name.name)
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !surname.nil? || retry_name == retry_max do
      surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    sexuality = ''
    case rand(100)
    when 0..95
      sexuality = "Straight"
    else
      sexuality = "Gay"
    end
    return [ surname.name, first_name.name, gender, race, hair_color, eye_color, middle_name.name, sexuality]
  end

  def self.random_name(race,sex)
    gender = (sex == 0 ? "M" : "F")
    case race
    when "White"
      column_name = "white"
    when "Black"
      column_name = "black"
    when "Asian"
      column_name = "asian"
    when "Am Indian"
      column_name = "indian"
    when "Latino Mixed"
      column_name = "latino_mixed"
    else
      column_name = "latino"
    end

    retry_max = 10

    column_percent = 30
    first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !first_name.nil? || retry_name == retry_max do
      first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    middle_name = Namer.find_by_sql("select * from namers where id != #{first_name.id} and first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !middle_name.nil? || retry_name == retry_max do
      middle_name = Namer.find_by_sql("select * from namers where id != #{first_name.id} and first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      middle_name = nil if (middle_name.nil? ? false : middle_name.name == first_name.name)
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !surname.nil? || retry_name == retry_max do
      surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    #debugger if first_name.nil? || middle_name.nil? || surname.nil?
    return [ first_name.name, (middle_name.nil? ? nil : middle_name.name), surname.name ]
  end
end
