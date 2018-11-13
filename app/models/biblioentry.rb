class Biblioentry < ApplicationRecord
    has_and_belongs_to_many :authors

    has_many :citations

    belongs_to :user

    validates :name, presence: true
end
