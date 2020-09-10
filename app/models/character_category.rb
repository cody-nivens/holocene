class CharacterCategory < ApplicationRecord
  has_many :character_attributes, dependent: :destroy

  validates_presence_of :name
end
