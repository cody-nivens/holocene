class Epoch < ApplicationRecord
    include SharedMethods

    has_and_belongs_to_many :timelines
    belongs_to :user

    validates :name, :start_date, :end_date, presence: true

    def timeline_json
        return {:events => HoloceneEvent.where(["start_year >= ? and start_year <= ?", self.start_date,self.end_date]).collect{|x| x.slide}}.to_json
    end

end
