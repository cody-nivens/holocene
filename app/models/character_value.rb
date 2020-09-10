class CharacterValue < ApplicationRecord
  belongs_to :character
  belongs_to :character_attribute

  validates_presence_of :value
end
