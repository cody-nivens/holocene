class Timeline < ApplicationRecord
  has_and_belongs_to_many :holocene_events
  has_and_belongs_to_many :epochs
  has_and_belongs_to_many :chapters
  has_and_belongs_to_many :event_types

  belongs_to :user

  validates :name, presence: true

  def timeline_json(_toggle)
    { events: holocene_events.order(:start_year).collect { |x| x.slide } }
  end

  def map_locs
    holocene_events.collect { |x| (x.lat.nil? ? nil : x.location) }.compact
  end
end
