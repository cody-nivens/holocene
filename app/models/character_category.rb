class CharacterCategory < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  has_many :character_attributes, dependent: :destroy

  validates_presence_of :name
end
