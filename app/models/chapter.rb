class Chapter < ApplicationRecord
    has_and_belongs_to_many :holocene_events
    has_and_belongs_to_many :timelines
    has_many :sections

    validates :name, presence: true

end
