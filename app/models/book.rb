class Book < ApplicationRecord
    belongs_to :user

    has_many :glossary_terms
    has_many :biblioentries

    has_many :chapters
    has_and_belongs_to_many :authors


    validates :name, presence: true
end
