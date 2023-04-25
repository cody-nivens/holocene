class LocationTime < ApplicationRecord
  belongs_to :segment
  belongs_to :location
  has_many :actor_location_times, dependent: :destroy
end