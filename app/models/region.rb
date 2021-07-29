class Region < ApplicationRecord
	has_many :holocene_events
    belongs_to :user

    has_rich_text :body

    validates :name, presence: true
end
