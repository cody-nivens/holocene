class Footnote < ApplicationRecord
  belongs_to :noted, polymorphic: true

  validates :slug, presence: true

end
