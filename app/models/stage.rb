class Stage < ApplicationRecord
  belongs_to :act
  has_many :segments, dependent: :destroy

  has_rich_text :desc

  validates :name, presence: true
end
