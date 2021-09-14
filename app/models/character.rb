class Character < ApplicationRecord

  has_and_belongs_to_many :books, dependent: :nullify

  has_many :character_values
  has_many :character_attributes, :through => :character_values

  has_many :character_scenes
  has_many :scenes, :through => :character_scenes

  has_many :character_stories
  has_many :stories, :through => :character_stories

  has_many :artifacts, dependent: :destroy

  has_many :signets, as: :sigged

  belongs_to :father, class_name: 'Character', :optional => true
  belongs_to :mother, class_name: 'Character', :optional => true
  delegate :name, :to => :father, :prefix => true
  delegate :name, :to => :mother, :prefix => true

  has_rich_text :background

  VALUES = [
  ["M", 1000],
  ["D", 500],
  ["C", 100],
  ["L", 50],
  ["X", 10],
  ["V", 5],
  ["I", 1] ]

  cattr_accessor :form_steps do
    %w(characteristics identity attributes)
  end

  attr_accessor :form_step

  #validates :ethnicity, :birth_year, :death_year, presence: true, if: -> { required_for_step?(:characteristics) }
  validates :first_name, presence: true, if: -> { required_for_step?(:identity) }
  #validates :occupation_class,:social_class,  presence: true, if: -> { required_for_step?(:attributes) }

  def first_name?
    !self.first_name.nil?
  end

  def grouping?
    !self.grouping.blank?
  end

  def reason_for_name?
    !self.reason_for_name.blank?
  end

  def nickname?
    !self.nickname.blank?
  end

  def reason_for_nickname?
    !self.reason_for_nickname.blank?
  end

  def honorific?
    !self.honorific.blank?
  end

  def ethnicity?
    !self.ethnicity.blank?
  end

  def social_class?
    !self.social_class.blank?
  end

  def grouping?
    !self.grouping.blank?
  end

  def reign?
    !self.reign.blank?
  end

  def father?
    !self.father.nil?
  end

  def mother?
    !self.mother.nil?
  end

  def background?
    !self.background.nil?
  end

  def required_for_step?(my_step)
    return true if form_step.nil?
    return true if self.form_steps.index(my_step.to_s) <= self.form_steps.index(form_step)
  end

  def name
    "#{(honorific.blank? ? "#{first_name}" : "#{honorific} ")} #{(middle_name.blank? || !honorific.blank? ? '' : middle_name)}#{(middle_name.blank? ? '' : ' ')}#{(last_name.blank? ? (honorific.blank? ? '' : first_name) : last_name)}" + (suffix.blank? ? '' : " #{suffix}")
  end

  def select_name
    "#{occupation_class} - #{grouping}: #{(honorific.blank? ? '' : "#{honorific} ")}#{first_name} #{middle_name} #{last_name} #{suffix}"
  end

  def full_name
    "#{(honorific.blank? ? '' : "#{honorific} ")}#{first_name} #{middle_name} #{last_name} #{suffix}"
  end

  def full_last_first
    "#{(last_name.blank? ? '' : last_name)}#{(suffix.blank? ? '' : " #{suffix}")}#{(last_name.blank? ? '' : ", ")}#{first_name} #{middle_name}"
  end

  def self.romanize n
    roman = ""

    VALUES.each do |pair|
      letter = pair[0]
      value = pair[1]
      roman += letter*(n / value)
      n = n % value
    end
    return roman
  end

  def self.gen_ethnicity
    ethnicity = ''
    case rand(100)
    when 0..60
      ethnicity = "White"
    when 61..73
      ethnicity = "Black"
    when 74..80
      ethnicity = "Asian"
    when 81..82
      ethnicity = "Am Indian"
    when 83..86
      ethnicity = "Latino Mixed"
    else
      ethnicity = "Latino"
    end
    return ethnicity
  end

  def self.gen_hair_color
    case rand(100)
    when 1..12
      return "Red"
    when 13..34
      return "Blond"
    when 35..64
      return "Light Brown"
    when 65..83
      return "Dark Brown"
    else
      return "Black"
    end
  end

  def self.gen_eye_color(hair_color)
    case hair_color
    when "Blond"
      return self.gen_blond_eye_color
    when "Black"
      return self.gen_black_eye_color
    when "Light Brown","Dark Brown"
      return self.gen_brown_eye_color
    else
      return self.gen_red_eye_color
    end
  end

  def self.gen_black_eye_color
    case rand(100)
    when 1..5
      return "Green"
    when 6..20
      return "Hazel"
    when 21..40
      return "Blue"
    else
      return "Brown"
    end
  end

  def self.gen_brown_eye_color
    case rand(100)
    when 1..10
      return "Green"
    when 11..30
      return "Hazel"
    when 31..55
      return "Blue"
    else
      return "Brown"
    end
  end

  def self.gen_red_eye_color
    case rand(100)
    when 1..20
      return "Green"
    when 21..41
      return "Hazel"
    when 42..66
      return "Blue"
    else
      return "Brown"
    end
  end

  def self.gen_blond_eye_color
    case rand(100)
    when 1..13
      return "Green"
    when 14..22
      return "Hazel"
    when 23..97
      return "Blue"
    else
      return "Brown"
    end
  end

  def self.gen_sexuality
    sexuality = ''
    case rand(100)
    when 0..64
      sexuality = "Straight"
    when 65..95
      sexuality = "Bisexual"
    else
      sexuality = "Gay"
    end
  end

  # names - array of first and middle names to use in generating new names
  def create_lineage(names)
    new_names = []
    i = 0
    names_index = -1
    name_combos = {}

    while i < 25 do
      name = {}
      names_index = (names_index + 1) % names.length
      name[:last_name] = self.last_name

      first_name = names[names_index]
      name[:first_name] = first_name
      middle_name = (new_names.length > 2 ? new_names[new_names.length - 2][:first_name] : "")
      name[:middle_name] = middle_name
      name[:middle_name] = (i == 0 ? "Allen" : (i == 1 ? "Dimitri" : (i == 2 ? "John" : name[:middle_name])))
      middle_name = name[:middle_name]

      combo_name = "#{first_name}_#{middle_name}"
      if name_combos[combo_name].nil?
        name_combos[combo_name] = 1
      else
        name_combos[combo_name] += 1
      end
      title = name_combos[combo_name]

      unless title == 1
        name[:suffix] = Character.romanize title
      end

      name[:age_at_son] = rand(23..35)

      name[:birth_year] = (i == 0 ? self.age_at_son + self.birth_year : new_names[new_names.length - 1][:birth_year] + new_names[new_names.length - 1][:age_at_son])

      death_age = rand(63..76)
      name[:death_year] = name[:birth_year] + death_age
      i += 1

      new_names << name
    end

    return new_names
  end

  def reign
    (self.father.nil? ? '' : self.death_year - self.father.death_year)
  end

  def set_values
    return [  self.books[0], self, nil, nil, nil ]
  end

  def self.sex_to_text(sex)
    case sex
    when 0
      return "Male"
    when 1
      return "Female"
    else
      return ""
    end
  end

  def self.text_to_sex(sex)
    case sex
    when "Male"
      return 0
    when "Female"
      return 1
    else
      return 2
    end
  end

  def self.stats(characters,character_attribute,character_attribute_2)
      stats = {}
      stats = {}

      distinct_values = characters.pluck(character_attribute.to_sym).compact.sort.uniq
      distinct_values_2 = characters.pluck(character_attribute_2.to_sym).compact.sort.uniq

      distinct_values.each do |value|
        stats[value] = {}
        distinct_values_2.each do |value_2|
          abc = characters.where("#{character_attribute} = ? and #{character_attribute_2} = ?", value, value_2)
          stats[value][value_2] = abc.length
        end
      end
      stats
  end
end
