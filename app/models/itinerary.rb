class Itinerary < ApplicationRecord
  acts_as_list :position

  belongs_to :tour

  belongs_to :city

  has_rich_text :summary
  has_rich_text :instructions

  delegate :name, :lat, :lng, :admin_name, :country, to: :city, prefix: true

  after_create :update_position

  delegate :name, to: :city, prefix: true
  delegate :name, to: :tour, prefix: true

  validates :name, presence: true
  #
  # Return location information for jvectormap
  #
  def location
    { latLng: [city.lat, city.lng], name: city.name, status: name.downcase.to_s }
  end

  #
  # Return location for jvectormap if only item added to map
  #
  def map_locs
    [location]
  end

  private

  def update_position
    Itinerary.joins(:city).includes([:tour, :city]).where(tour_id: tour_id).order(:lng).each_with_index do |x, i|
      x.update({ position: i + 1 })
    end
  end
end
