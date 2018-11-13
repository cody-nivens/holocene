class Chapter < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position # Indicate a sort column

    has_and_belongs_to_many :holocene_events
    has_and_belongs_to_many :citations
    has_and_belongs_to_many :timelines
    has_many :sections
    has_many :footnotes, as: :noted

    belongs_to :book
    validates :name, presence: true

    def timeline_json
        return {:events => self.holocene_events.order(:start_year).collect{|x| x.slide}}.to_json
    end

end
