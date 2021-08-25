class KeyWord < ApplicationRecord
  belongs_to :book

  validates :key_word, presence: true
end
