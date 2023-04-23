class Segment < ApplicationRecord
  belongs_to :stage
  has_many :location_times, dependent: :destroy
  has_rich_text :desc
end
