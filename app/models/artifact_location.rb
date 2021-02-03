class ArtifactLocation < ApplicationRecord
  has_rich_text :purpose

  belongs_to :artifact
  belongs_to :located, polymorphic: true

  validates :artifact, presence: true

end
