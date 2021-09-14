class CharacterScene < ApplicationRecord
  ThinkingSphinx::Callbacks.append(
    self, :behaviours => [:sql]
  )

  has_rich_text :summary

  belongs_to :character
  belongs_to :scene
  delegate :name, :birth_year, :occupation_class, :grouping, :to => :character, :prefix => true

  def name
    "#{self.character.name}-#{self.scene.name}"
  end

  def set_values
    values = self.scene.set_values
    return [ values[0], values[1], values[2], values[3], self ]
  end

end
