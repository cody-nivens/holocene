class HoloceneEvent < ApplicationRecord
    include SharedMethods
    include Rails.application.routes.url_helpers

    has_rich_text :body

  belongs_to :region
  belongs_to :user

  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :timelines
  has_and_belongs_to_many :chapters
  has_and_belongs_to_many :sections
  #has_and_belongs_to_many :holocene_events, as: :parents

  has_many :footnotes, -> { where("slug != ?","") }, as: :noted
  has_many :signets, as: :sigged

  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :event_types

  has_one_attached :image

  acts_as_taggable_on :tags

  delegate :name, :to => :region, :prefix => true

  validates :name, presence: true

  #
  # Generate json for TimelineJS
  #
  def slide
      slde = { :start_date => mk_date(self.start_year),
               :end_date => mk_date((self.end_year.blank? ? self.start_year : self.end_year)),
               :text => mk_text(self.body,self.name)
      }
      if self.image.attached?
          slde['media'] = { :url => "#{cover_url}",
                        :link => self.url
      }
      end
    return slde
  end

  #
  # Generate URL for image
  #
  def cover_url
    rails_blob_path(self.image, disposition: "attachment", only_path: true)
  end

  #
  # Return location information for jvectormap
  #
  def location
      loc = { latLng: [ self.lat, self.lng ], name: self.name, :status => "#{self.event_types.first.name.downcase}" }
      return loc
  end

  #
  # Return location for jvectormap if only item added to map
  #
  def map_locs
    return [ (self.lat.nil? ? nil : self.location) ]
  end

  def set_values
    chapter = nil
    unless self.chapters.nil?
      chapter = self.chapters.first
      book = chapter.scripted
    end
    return [ book, chapter, self,  nil, nil ]
  end
end
