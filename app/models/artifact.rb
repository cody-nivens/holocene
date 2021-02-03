class Artifact < ApplicationRecord
  belongs_to :character
  belongs_to :book
  belongs_to :artifact_type

  has_many :artifact_locations, :dependent => :destroy
  has_many :scenes, :as => :located

  has_rich_text :summary

  validates :name, presence: true

end
