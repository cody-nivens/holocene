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

      attribute_values_2 = CharacterValue.where(character_attribute_id: character_attribute_2.id)
      distinct_values_2 = attribute_values_2.distinct.pluck(:value)

      distinct_values.each do |value|
        stats[category.name][value] = {}
        distinct_values_2.each do |value_2|
          if stats[category.name][value][value_2].nil?
            stats[category.name][value][value_2] = 0
          end

          first_count = CharacterValue.where(character_attribute_id: character_attribute.id, value: value) 
          count_2 = CharacterValue.where(character_attribute_id: character_attribute_2.id, value: value_2)
          
          intersect = characters.pluck(:id).intersection(first_count.pluck(:character_id)).intersection(count_2.pluck(:character_id))

          stats[category.name][value][value_2] += intersect.length
        end
      end
      stats
  end

end
