class KeyPoint < ApplicationRecord
  belongs_to :scripted, polymorphic: true

  has_many :scenes

  validates_presence_of :hook
end
