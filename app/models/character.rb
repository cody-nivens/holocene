class Character < ApplicationRecord

  has_many :character_values, dependent: :destroy
  has_and_belongs_to_many :books, dependent: :nullify
  has_and_belongs_to_many :stories, dependent: :nullify

  has_many :character_scenes
  has_many :scenes, :through => :character_scenes

  has_many :signets, as: :sigged

  validates_presence_of :first_name


  belongs_to :father, class_name: 'Character', :optional => true

  has_rich_text :background

  VALUES = [
  ["M", 1000],
  ["D", 500],
  ["C", 100],
  ["L", 50],
  ["X", 10],
  ["V", 5],
  ["I", 1],
]

  def name
    "#{(honorific.blank? ? "#{first_name}" : "#{honorific} ")} #{(last_name.blank? ? (honorific.blank? ? '' : first_name) : last_name)}" + (suffix.blank? ? '' : " #{suffix}")
  end

  def full_name
    "#{(honorific.blank? ? '' : "#{honorific} ")}#{first_name} #{middle_name} #{last_name} #{suffix}"
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

  def self.create_character_lineage(names)
    new_names = []
    i = 0
    names_index = -1
    name_combos = {}

    while i < 25 do
      name = {}
      names_index = (names_index + 1) % names.length 
      name[:last_name] = "Cummings"

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
        name[:suffix] = romanize title
      end

      name[:age_at_son] = (i == 0 ? 27 : rand(23..35))

      name[:birth_year] = (i == 0 ? 78 : new_names[new_names.length - 1][:birth_year] + new_names[new_names.length - 1][:age_at_son])

      death_age = ((200..250).member?(name[:birth_year]) ? 53 : rand(63..72))
      name[:death_year] = name[:birth_year] + death_age
      i += 1

      new_names << name
    end

    return new_names
  end

  def age
    (self.death_year.nil? ? '' : self.death_year.to_i - self.birth_year.to_i)
  end

  def reign 
    (self.father.nil? ? '' : self.death_year - self.father.death_year)
  end

end
