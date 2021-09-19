class GlossaryTerm < ApplicationRecord
  belongs_to :user

  belongs_to :see, class_name: 'GlossaryTerm', optional: true
  belongs_to :seealso, class_name: 'GlossaryTerm', optional: true
  belongs_to :acronym, class_name: 'GlossaryTerm', optional: true

  belongs_to :book

  has_many :glossary_terms

  delegate :name, to: :see, prefix: true
  delegate :name, to: :seealso, prefix: true
  delegate :name, to: :acronym, prefix: true

  validates :name, presence: true
end
