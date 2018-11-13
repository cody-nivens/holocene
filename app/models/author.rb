class Author < ApplicationRecord
    has_and_belongs_to_many :biblioentries
    has_and_belongs_to_many :books

    belongs_to :user

    validates :first_name, :last_name, presence: true 
end
