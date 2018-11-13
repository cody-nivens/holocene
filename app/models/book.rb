class Book < ApplicationRecord
    has_many :chapters
    belongs_to :user
    has_and_belongs_to_many :authors


    validates :name, presence: true
end
