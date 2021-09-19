class Author < ApplicationRecord
  has_and_belongs_to_many :biblioentries, dependent: :nullify
  has_and_belongs_to_many :books, dependent: :nullify

  belongs_to :user

  validates :first_name, presence: true

  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end
end
