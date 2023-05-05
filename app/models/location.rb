class Location < ApplicationRecord
  belongs_to :book
  has_many :location_times

  has_rich_text :desc

  validates :name, presence: true
end
