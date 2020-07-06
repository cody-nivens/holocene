class Chapter < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position # Indicate a sort column

    has_and_belongs_to_many :holocene_events
    has_and_belongs_to_many :timelines
    has_many :sections
    has_many :footnotes, -> { where("slug != ?","") }, as: :noted

    belongs_to :book
    has_one :partition
    has_one :aside

    validates :name, presence: true

    def show_events?
      return self.show_events
    end

    #
    # Total number of events in chapter
    #
    def total_events
      total = self.sections.map{|x| x.holocene_events.uniq.length}.sum
      total += self.holocene_events.uniq.length
      return total
    end

    #
    # List of citations associated with chapter
    #
    def citations
        cits = Footnote.where(noted_id: self.id).where(slug: "")
        return cits
    end

    def timeline_json(section_flag = true)
      events = self.holocene_events
        if section_flag
          self.sections.each do |section|
            section.holocene_events.each do |event|
              events << event unless events.include?(event)
            end
          end
        end

        return {:events => events.order(:start_year).uniq.collect{|x| x.slide}}.to_json
    end

    def map_locs
        return self.holocene_events.collect{|x| (x.lat.nil? ? nil : x.location) }.compact
    end

    def word_count
      count = WordsCounted.count(self.body).token_count + WordsCounted.count(self.name).token_count
      count += self.partition.word_count unless self.partition.nil?
      count += self.aside.word_count unless self.aside.nil?
      self.sections.each do |sect|
        count += sect.word_count
      end
      return count
    end

end
