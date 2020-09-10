class Biblioentry < ApplicationRecord
    has_and_belongs_to_many :authors

    has_many :footnotes
    has_many :signets

    belongs_to :user
    belongs_to :book

    validates :name, presence: true
end
