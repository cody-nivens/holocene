class City < ApplicationRecord
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  has_many :itineraries

  def distance(point_2)
    r = 6378
    lat1 = Math.sin((point_2.lat * Math::PI / 180.0 - lat * Math::PI / 180.0) / 2)
    lats = lat1 * lat1
    lng1 = Math.sin((point_2.lng * Math::PI / 180.0 - lng * Math::PI / 180.0) / 2)
    lngs = lng1 * lng1

    d = 2 * r * Math.asin(Math.sqrt(lats + Math.cos(lat * Math::PI / 180.0) * Math.cos(point_2.lat * Math::PI / 180.0) * lngs))
    d / 1.609
  end

  #
  # Return location information for jvectormap
  #
  def location
    { latLng: [lat, lng], name: name, status: name.downcase.to_s }
  end

  #
  # Return location for jvectormap if only item added to map
  #
  def map_locs
    [location]
  end
end
