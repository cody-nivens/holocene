class BooksCharacter < ApplicationRecord
  belongs_to :book
  belongs_to :character
end
