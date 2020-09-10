class Story < ApplicationRecord
  belongs_to :book

  has_many :characters
  has_many :chapters, :as => :scripted
  has_many :key_points, :as => :scripted

  validates :title, presence: true
end
