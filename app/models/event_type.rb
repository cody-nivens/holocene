class EventType < ApplicationRecord
	 has_and_belongs_to_many :holocene_events
     belongs_to :user

     validates :name, presence: true
end
