class Itinerary < ApplicationRecord
  acts_as_list :position

  belongs_to :tour

  belongs_to :city

  has_rich_text :summary
  has_rich_text :instructions

  delegate :name, :lat, :lng, :admin_name, :country, :to => :city, :prefix => true

  after_create :update_position

  delegate :name, :to => :city, :prefix => true
  delegate :name, :to => :tour, :prefix => true

  validates :name, presence: true
  #
  # Return location information for jvectormap
  #
  def location
    loc = { latLng: [ self.city.lat, self.city.lng ], name: self.city.name, :status => "#{self.name.downcase}" }
      return loc
  end

  #
  # Return location for jvectormap if only item added to map
  #
  def map_locs
    return [ self.location ]
  end

  private

  def update_position
    Itinerary.joins(:city).where(tour_id: self.tour_id).order(:lng).each_with_index do |x,i|
      x.update({position: i + 1})
    end
  end
end
