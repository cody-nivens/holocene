class Region < ApplicationRecord
	has_many :holocene_events
    belongs_to :user

    validates :name, presence: true
end
