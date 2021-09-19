class EventType < ApplicationRecord
  has_and_belongs_to_many :holocene_events
  belongs_to :user

  has_rich_text :body

  validates :name, presence: true

  def timeline_json(_toggle)
    { events: holocene_events.collect { |x| x.slide } }
  end

  def map_locs
    holocene_events.collect { |x| (x.lat.nil? ? nil : x.location) }.compact
  end
end
