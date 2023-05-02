class Segment < ApplicationRecord
  belongs_to :stage
  has_many :location_times, dependent: :destroy
  belongs_to :scene, optional: true

  has_rich_text :desc
end
