class CharacterCategory < ApplicationRecord
  acts_as_list

  has_many :character_attributes, dependent: :destroy

  validates :name, presence: true
end
