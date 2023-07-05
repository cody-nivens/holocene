class Character < ApplicationRecord
  belongs_to :father, class_name: 'Character', optional: true
  belongs_to :mother, class_name: 'Character', optional: true
  belongs_to :user

  has_and_belongs_to_many :books
  has_and_belongs_to_many :chapters

  has_many :character_values, dependent: :destroy
  has_many :character_attributes, through: :character_values

  has_many :character_scenes, dependent: :destroy
  has_many :scenes, through: :character_scenes

  has_many :character_stories, dependent: :destroy
  has_many :stories, through: :character_stories

  has_many :artifacts

  has_many :signets, as: :sigged, dependent: :destroy
  
  has_many :actor_characters, dependent: :destroy


  delegate :name, to: :father, prefix: true
  delegate :name, to: :mother, prefix: true

  has_rich_text :background
  has_rich_text :thumbnail

  VALUES = [
    ['M', 1000],
    ['D', 500],
    ['C', 100],
    ['L', 50],
    ['X', 10],
    ['V', 5],
    ['I', 1]
  ]

  cattr_accessor :form_steps do
    %w[characteristics identity attributes]
  end

  attr_accessor :form_step

  # validates :ethnicity, :birth_year, :death_year, presence: true, if: -> { required_for_step?(:characteristics) }
  # validates :first_name, presence: true, if: -> { required_for_step?(:identity) }
  # validates :occupation_class,:social_class,  presence: true, if: -> { required_for_step?(:attributes) }

  def published_scenes(book)
    a = []
    scenes.each do |scene|
      a << scene if scene.situated.book == book and scene.situated.publish?
    end
    a
  end

  def gender
    gender = CharacterAttribute.find_by_name('Gender')
    char_value = CharacterValue.where(character: self, character_attribute: gender)
    char_value.size == 0 ? '' : char_value[0].value
  end

  def first_name?
    !first_name.nil?
  end

  def grouping?
    grouping.present?
  end

  def reason_for_name?
    reason_for_name.present?
  end

  def nickname?
    nickname.present?
  end

  def reason_for_nickname?
    reason_for_nickname.present?
  end

  def honorific?
    honorific.present?
  end

  def ethnicity?
    ethnicity.present?
  end

  def social_class?
    social_class.present?
  end

  def reign?
    reign.present?
  end

  def father?
    !father.nil?
  end

  def mother?
    !mother.nil?
  end

  def background?
    !background.blank?
  end

  def thumbnail?
    !thumbnail.blank?
  end

  def use_honorific_only?
    use_honorific_only
  end

  def main?
    main
  end

  def required_for_step?(my_step)
    return true if form_step.nil?
    return true if form_steps.index(form_step.to_s).nil?
    return true if form_steps.index(my_step.to_s) <= form_steps.index(form_step.to_s)
    return true
  end

  def name
    str = ''
    str += if !honorific?
             ''
           elsif use_honorific_only?
             honorific
           else
             honorific.to_s
           end

    str += ' ' if honorific? && !use_honorific_only?

    # if !self.honorific? && !self.use_honorific_only?
    #  str += " #{self.first_name}"
    # else
    str += first_name unless first_name.nil? or use_honorific_only?
    # end

    str += if middle_name.blank? || (honorific? && use_honorific_only)
             ''
           else
             " #{middle_name}"
           end

    str += if last_name.blank?
             # if self.honorific.blank?
             ''
           # else
           #  str += " #{self.first_name}"
           # end
           else
             " #{last_name}"
           end

    str += if suffix.blank?
             ''
           else
             " #{suffix}"
           end
    str
  end

  def select_name
    "#{occupation_class} - #{grouping}: #{honorific.blank? ? '' : "#{honorific} "}#{first_name}#{nickname? ? " \"#{nickname}\"" : ''} #{middle_name} #{last_name} #{suffix}"
  end

  def full_name
    "#{honorific.blank? ? '' : "#{honorific} "}#{first_name}#{nickname.present? ? " '#{nickname}'" : '' } #{middle_name} #{last_name} #{suffix}"
  end

  def full_last_first
    "#{last_name.presence || ''}#{suffix.blank? ? '' : " #{suffix}"}#{last_name.blank? ? '' : ', '}#{first_name}#{nickname? ? " \"#{nickname}\"" : ''} #{middle_name}"
  end

  def self.romanize(n)
    roman = ''

    VALUES.each do |pair|
      letter = pair[0]
      value = pair[1]
      roman += letter * (n / value)
      n = n % value
    end
    roman
  end

  def self.gen_ethnicity
    ethnicity = ''
    case rand(100)
    when 0..60
      'White'
    when 61..73
      'Black'
    when 74..80
      'Asian'
    when 81..82
      'Am Indian'
    when 83..86
      'Latino Mixed'
    else
      'Latino'
    end
  end

  def self.gen_hair_color
    case rand(100)
    when 1..12
      'Red'
    when 13..34
      'Blond'
    when 35..64
      'Light Brown'
    when 65..83
      'Dark Brown'
    else
      'Black'
    end
  end

  def self.gen_eye_color(hair_color)
    case hair_color
    when 'Blond'
      gen_blond_eye_color
    when 'Black'
      gen_black_eye_color
    when 'Light Brown', 'Dark Brown'
      gen_brown_eye_color
    else
      gen_red_eye_color
    end
  end

  def self.gen_black_eye_color
    case rand(100)
    when 1..5
      'Green'
    when 6..20
      'Hazel'
    when 21..40
      'Blue'
    else
      'Brown'
    end
  end

  def self.gen_brown_eye_color
    case rand(100)
    when 1..10
      'Green'
    when 11..30
      'Hazel'
    when 31..55
      'Blue'
    else
      'Brown'
    end
  end

  def self.gen_red_eye_color
    case rand(100)
    when 1..20
      'Green'
    when 21..41
      'Hazel'
    when 42..66
      'Blue'
    else
      'Brown'
    end
  end

  def self.gen_blond_eye_color
    case rand(100)
    when 1..13
      'Green'
    when 14..22
      'Hazel'
    when 23..97
      'Blue'
    else
      'Brown'
    end
  end

  def self.gen_sexuality
    sexuality = ''
    sexuality = case rand(100)
                when 0..64
                  'Straight'
                when 65..94
                  'Bisexual'
                else
                  'Gay'
                end
  end

  # names - array of first and middle names to use in generating new names
  def create_lineage(names)
    new_names = []
    i = 0
    names_index = -1
    name_combos = {}

    while i < 25
      name = {}
      names_index = (names_index + 1) % names.length
      name[:last_name] = last_name

      first_name = names[names_index]
      name[:first_name] = first_name
      middle_name = (new_names.length > 2 ? new_names[new_names.length - 2][:first_name] : '')
      name[:middle_name] = middle_name
      name[:middle_name] = (if i == 0
                              'Allen'
                            else
                              (if i == 1
                                 'Dimitri'
                               else
                                 (i == 2 ? 'John' : name[:middle_name])
                               end)
                            end)
      middle_name = name[:middle_name]

      combo_name = "#{first_name}_#{middle_name}"
      if name_combos[combo_name].nil?
        name_combos[combo_name] = 1
      else
        name_combos[combo_name] += 1
      end
      title = name_combos[combo_name]

      name[:suffix] = Character.romanize title unless title == 1

      name[:age_at_son] = rand(23..35)

      name[:birth_year] =
        (i == 0 ? age_at_son + birth_year : new_names[new_names.length - 1][:birth_year] + new_names[new_names.length - 1][:age_at_son])

      death_age = rand(63..76)
      name[:death_year] = name[:birth_year] + death_age
      i += 1

      new_names << name
    end

    new_names
  end

  def reign
    (father.nil? ? '' : death_year - father.death_year)
  end

  def set_values
    [books[0], self, nil, nil, nil]
  end

  def self.sex_to_text(sex)
    case sex
    when 0
      'Male'
    when 1
      'Female'
    else
      ''
    end
  end

  def self.text_to_sex(sex)
    case sex
    when 'Male'
      0
    when 'Female'
      1
    else
      2
    end
  end

  def self.stats(characters, character_attribute, character_attribute_2)
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
