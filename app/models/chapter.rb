class Chapter < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position # Indicate a sort column

    has_and_belongs_to_many :holocene_events
    has_and_belongs_to_many :timelines
    has_many :sections
    has_many :footnotes, as: :noted

    belongs_to :book
    has_one :partition

    validates :name, presence: true

    #
    # Total number of events in chapter
    #
    def total_events
        total = self.sections.map{|x| x.holocene_events.length}.sum
        total += self.holocene_events.length
        return total
    end

    #
    # List of citations associated with chapter
    #
    def citations
        cits = Footnote.where(noted_id: self.id).where(slug: "")
        return cits
    end

    def timeline_json
        return {:events => self.holocene_events.order(:start_year).collect{|x| x.slide}}.to_json
    end

    def map_locs
        return self.holocene_events.collect{|x| (x.lat.nil? ? nil : x.location) }.compact
    end

end
