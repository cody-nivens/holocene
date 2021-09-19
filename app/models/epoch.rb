class Epoch < ApplicationRecord
  include SharedMethods

  has_and_belongs_to_many :timelines
  belongs_to :user

  validates :name, :start_date, :end_date, presence: true

  def timeline_json(_toggle)
    { events: HoloceneEvent.where(['start_year >= ? and start_year <= ?', start_date, end_date]).collect do |x|
                x.slide
              end }
  end

  def map_locs
    HoloceneEvent.where(['start_year >= ? and start_year <= ?', start_date, end_date]).collect do |x|
      (x.lat.nil? ? nil : x.location)
    end.compact
  end

  def holocene_events
    HoloceneEvent.where(['start_year >= ? and start_year <= ?', start_date, end_date])
  end
end
