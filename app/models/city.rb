class City < ApplicationRecord
  validates :name, presence: true

  def distance(point_2)
    r = 6378
    lat1 = Math.sin((point_2.lat*Math::PI/180.0 - self.lat*Math::PI/180.0)/2)
    lats = lat1*lat1
    lng1 = Math.sin((point_2.lng*Math::PI/180.0 - self.lng*Math::PI/180.0)/2)
    lngs = lng1*lng1

    d = 2*r*Math.asin(Math.sqrt(lats + Math.cos(self.lat*Math::PI/180.0)*Math.cos(point_2.lat*Math::PI/180.0)*lngs))
    return d/1.609
  end

end
