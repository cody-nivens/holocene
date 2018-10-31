class Biblioentry < ApplicationRecord
    has_and_belongs_to_many :authors

    validates :name, presence: true
end
