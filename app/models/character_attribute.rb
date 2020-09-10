class CharacterAttribute < ApplicationRecord
  belongs_to :character_category
  belongs_to :related, :primary_key => :related_id, :class_name => "CharacterAttribute", :optional => true

  has_many :character_values, dependent: :destroy

  validates_presence_of :name
end
