class Author < ApplicationRecord
    has_and_belongs_to_many :biblioentries
    has_and_belongs_to_many :books

    belongs_to :user

    validates :first_name, presence: true 

    def name_with_initial
      "#{first_name.first}. #{last_name}"
    end
end
