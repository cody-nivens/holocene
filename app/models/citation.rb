class Citation < ApplicationRecord
  has_and_belongs_to_many :holocene_events

  validates :name, presence: true
end
