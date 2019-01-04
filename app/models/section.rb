class Section < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position # Indicate a sort column

    belongs_to :chapter
    has_many :footnotes, as: :noted

    has_and_belongs_to_many :holocene_events


    validates :name, presence: true

    def timeline_json
        return {:events => self.holocene_events.order(:start_year).collect{|x| x.slide}}.to_json
    end

    def map_locs
        return self.holocene_events.collect{|x| (x.lat.nil? ? nil : x.location) }.compact
    end

end
