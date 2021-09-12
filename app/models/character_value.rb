class CharacterValue < ApplicationRecord
  belongs_to :character
  belongs_to :character_attribute

  validates_presence_of :value

  def self.stats(category,character_attribute,character_attribute_2=nil)
      stats = {}
      stats[category.name] = {}

      attribute_values = CharacterValue.where(character_attribute_id: character_attribute.id)
      distinct_values = attribute_values.distinct.pluck(:value)

      distinct_values.each do |value|
        stats[category.name][value] = 0

        count = CharacterValue.where(character_attribute_id: character_attribute.id, value: value)
        stats[category.name][value] += count.length

      end
      stats
  end

  def self.stats_a(characters,category,character_attribute,character_attribute_2=nil)
      stats = {}
      stats[category] = {}

      attribute_values = CharacterValue.where(character_attribute_id: character_attribute.id)
      distinct_values = attribute_values.distinct.pluck(:value)

      distinct_values.each do |value|
        stats[category][value] = 0

        first_count = characters.joins(:character_values).where("character_values.character_attribute_id": character_attribute.id, "character_values.value": value) 
          
        stats[category][value] += first_count.length
      end
      stats
  end

  def self.stats_2(characters,category,character_attribute,character_attribute_2=nil)
      stats = {}
      stats[category.name] = {}

      attribute_values = CharacterValue.where(character_attribute_id: character_attribute.id)
      distinct_values = attribute_values.distinct.pluck(:value)

      attribute_values_2 = characters

      distinct_values_2 = attribute_values_2.distinct.pluck(character_attribute_2.to_sym).compact.sort.uniq

      distinct_values.each do |value|
        stats[category.name][value] = {}
        distinct_values_2.each do |value_2|
          abc = characters.where("#{character_attribute_2} = ?", value_2).joins(:character_values).where("character_values.character_attribute_id = ? and value = ?", character_attribute.id, value)
          stats[category.name][value][value_2] = abc.length
        end
      end
      stats
  end

end
