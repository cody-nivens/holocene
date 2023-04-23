class Act < ApplicationRecord
  has_rich_text :desc
  has_many :stages
  belongs_to :book
end
