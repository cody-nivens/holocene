class EventType < ApplicationRecord
	 has_and_belongs_to_many :holocene_events
     belongs_to :user

     validates :name, presence: true

    def map_locs
        return self.holocene_events.collect{|x| (x.lat.nil? ? nil : x.location) }.compact
    end

    def timeline_json
        return {:events => self.holocene_events.collect{|x| x.slide}}.to_json
    end

end
