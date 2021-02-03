class ArtifactType < ApplicationRecord
  belongs_to :book
  has_many :artifacts, :dependent => :destroy

  validates :name, presence: true

end
