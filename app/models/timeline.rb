class Timeline < ApplicationRecord
    has_and_belongs_to_many :holocene_events
    has_and_belongs_to_many :eras
    has_and_belongs_to_many :chapters

    validates :name, presence: true

    def timeline_json
        return {:events => self.holocene_events.order(:start_year).collect{|x| x.slide}}.to_json
    end

end
