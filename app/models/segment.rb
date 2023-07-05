class Segment < ApplicationRecord
  belongs_to :stage
  acts_as_list scope: :stage_id

  has_many :location_times, dependent: :destroy
  belongs_to :scene, optional: true

  has_rich_text :desc

  validates :name, presence: true
end
