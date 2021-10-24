class Chapter < ApplicationRecord
  include RankedModel

  ranks :position, with_same: [:scripted_id, :scripted_type]
  acts_as_list scope: [:scripted_id, :scripted_type]

  has_rich_text :body

  has_and_belongs_to_many :holocene_events
  has_and_belongs_to_many :timelines
  has_many :sections, as: :sectioned
  has_many :footnotes, -> { where('slug != ?', '') }, as: :noted
  has_many :signets, as: :sigged

  belongs_to :scripted, polymorphic: true

  has_one :partition
  has_one :aside

  delegate :name,  to: :partition, prefix: true
  delegate :name,  to: :aside, prefix: true

  validates :name, presence: true

  def set_prev
    higher_item
  end

  def set_next
    lower_item
  end

  def display_title?
    display_title
  end

  def show_events?
    show_events
  end

  def process_events?
    always_display_events? || (show_events? && scripted.show_events?)
  end

  #
  # Total number of events in chapter
  #
  def total_events
    total = sections.includes([:sectioned, :holocene_events_sections, :holocene_events]).map { |x| x.holocene_events.uniq.length }.sum
    total += holocene_events.uniq.length
    total
  end

  #
  # List of citations associated with chapter
  #
  def citations
    Footnote.where(noted_id: id).where(slug: '')
  end

  def timeline_json(section_flag = true)
    events = holocene_events
    if section_flag
      sections.each do |section|
        section.holocene_events.each do |event|
          events << event unless events.include?(event)
        end
      end
    end

    { events: events.order(:start_year).uniq.collect { |x| x.slide } }
  end

  def map_locs
    holocene_events.collect { |x| (x.lat.nil? ? nil : x.location) }.compact
  end

  def word_count
    count = WordsCounted.count(body.to_plain_text).token_count + WordsCounted.count(name).token_count
    count += partition.word_count unless partition.nil?
    count += aside.word_count unless aside.nil?
    sections.each do |sect|
      count += sect.word_count
    end
    count
  end

  def set_values
    [scripted, self, nil, nil, nil]
  end
end
