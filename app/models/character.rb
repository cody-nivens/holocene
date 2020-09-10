class Character < ApplicationRecord
  has_many :character_values, dependent: :destroy
  has_and_belongs_to_many :books
  has_and_belongs_to_many :stories

  validates_presence_of :name
end
