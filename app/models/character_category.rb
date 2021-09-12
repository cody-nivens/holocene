class CharacterCategory < ApplicationRecord
  include RankedModel
  ranks :position

  has_many :character_attributes, dependent: :destroy

  validates_presence_of :name
end
