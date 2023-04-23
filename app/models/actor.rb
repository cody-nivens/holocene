class Actor < ApplicationRecord
  belongs_to :book
  has_rich_text :desc
  has_many :actor_location_times
  has_many :location_times, through: :actor_location_times
  has_many :actor_characters
  has_many :characters, through: :actor_characters
end
