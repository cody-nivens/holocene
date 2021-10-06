class Namer < ApplicationRecord
  def self.random_person
    ethnicity = Character.gen_ethnicity
    sex = rand(2)
    gender = (sex == 0 ? 'M' : 'F')

    case ethnicity
    when 'White'
      hair_color = Character.gen_hair_color
      eye_color  = Character.gen_eye_color(hair_color)
      column_name = 'white'
    when 'Black'
      hair_color = 'Black'
      eye_color = Character.gen_black_eye_color
      column_name = 'black'
    when 'Asian'
      hair_color = 'Black'
      eye_color = Character.gen_black_eye_color
      column_name = 'asian'
    when 'Am Indian'
      hair_color = 'Black'
      eye_color = 'Brown'
      column_name = 'indian'
    when 'Latino Mixed'
      hair_color = 'Black'
      eye_color = Character.gen_black_eye_color
      column_name = 'latino_mixed'
    else
      hair_color = 'Black'
      eye_color = Character.gen_black_eye_color
      column_name = 'latino'
    end

    retry_max = 10

    column_percent = 30
    first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !first_name.nil? || retry_name == retry_max
      first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    middle_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !middle_name.nil? || retry_name == retry_max
      middle_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      middle_name = nil if middle_name.nil? ? false : middle_name.name == first_name.name
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !surname.nil? || retry_name == retry_max
      surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    sexuality = ''
    sexuality = case rand(100)
                when 0..95
                  'Straight'
                else
                  'Gay'
                end
    [surname.name, first_name.name, gender, ethnicity, hair_color, eye_color,
     (middle_name.nil? ? nil : middle_name.name), sexuality]
  end

  def self.random_name(ethnicity, sex)
    gender = (sex == 0 ? 'M' : 'F')
    column_name = case ethnicity
                  when 'White'
                    'white'
                  when 'Black'
                    'black'
                  when 'Asian'
                    'asian'
                  when 'Am Indian'
                    'indian'
                  when 'Latino Mixed'
                    'latino_mixed'
                  else
                    'latino'
                  end

    retry_max = 10

    column_percent = 30
    first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !first_name.nil? || retry_name == retry_max
      first_name = Namer.find_by_sql("select * from namers where first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    middle_name = Namer.find_by_sql("select * from namers where id != #{first_name.id} and first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !middle_name.nil? || retry_name == retry_max
      middle_name = Namer.find_by_sql("select * from namers where id != #{first_name.id} and first_name=1 and gender = \"#{gender}\" and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      middle_name = nil if middle_name.nil? ? false : middle_name.name == first_name.name
      retry_name += 1
      column_percent -= 5
    end

    column_percent = 30
    surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
    retry_name = 0
    until !surname.nil? || retry_name == retry_max
      surname = Namer.find_by_sql("select *from namers where first_name=0 and #{column_name} > #{column_percent} order by rand() limit 1")[0]
      retry_name += 1
      column_percent -= 5
    end

    [first_name.name, (middle_name.nil? ? nil : middle_name.name), surname.name]
  end
end
