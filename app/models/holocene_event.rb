class HoloceneEvent < ApplicationRecord
    include SharedMethods

  belongs_to :region
  belongs_to :user

  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :timelines
  has_and_belongs_to_many :chapters
  has_and_belongs_to_many :sections

  has_many :footnotes, as: :noted

  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :event_types

  has_one_attached :image

  acts_as_taggable_on :tags

  validates :name, presence: true

  def slide
      slde = { :start_date => mk_date(self.start_year),
               :end_date => mk_date((self.end_year.blank? ? self.start_year : self.end_year)),
               :text => mk_text(self.body,self.name)
      }
      if self.image.attached?
          slde['media'] = { :url => "#{self.image.filename}",
                        :link => self.url
      }
      end
    return slde
  end

  def location
      loc = { latLng: [ self.lat, self.lng ], name: self.name }
      return loc
  end

  def map_locs
    return [ (self.lat.nil? ? nil : self.location) ]
  end

end
