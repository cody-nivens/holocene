class EventType < ApplicationRecord
	 has_many :holocene_events

     validates :name, presence: true
end
