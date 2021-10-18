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
  # has_and_belongs_to_many :holocene_events, as: :parents

  has_many :footnotes, -> { where('slug != ?', '') }, as: :noted
  has_many :signets, as: :sigged

  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :event_types

  has_one_attached :image

  acts_as_taggable_on :tags

  delegate :name, to: :region, prefix: true

  validates :name, presence: true

  #
  # Generate json for TimelineJS
  #
  def slide
    slde = { start_date: mk_date(start_year),
             end_date: mk_date((end_year.presence || start_year)),
             text: mk_text(body, name) }
    if image.attached?
      slde['media'] = { url: cover_url.to_s,
                        link: url }
    end
    slde
  end

  #
  # Generate URL for image
  #
  def cover_url
    #rails_blob_path(image, disposition: 'attachment', only_path: true)
  end

  #
  # Return location information for jvectormap
  #
  def location
    { latLng: [lat, lng], name: name, status: event_types.first.name.downcase.to_s }
  end

  #
  # Return location for jvectormap if only item added to map
  #
  def map_locs
    [(lat.nil? ? nil : location)]
  end

  def set_values
    chapter = nil
    unless chapters.nil?
      chapter = chapters.first
      book = chapter.scripted
    end
    [book, chapter, self, nil, nil]
  end
end
