class Author < ApplicationRecord
    has_and_belongs_to_many :biblioentries

    validates :first_name, :last_name, presence: true 
end
