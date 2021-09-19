class CharacterCategory < ApplicationRecord
  include RankedModel
  ranks :position

  has_many :character_attributes, dependent: :destroy

  validates :name, presence: true
end
