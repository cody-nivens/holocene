class GlossaryTerm < ApplicationRecord
  belongs_to :user

  belongs_to :see, class_name: 'GlossaryTerm', foreign_key: 'see_id', optional: true
  belongs_to :seealso, class_name: 'GlossaryTerm', foreign_key: 'seealso_id', optional: true
  belongs_to :acronym, class_name: 'GlossaryTerm', foreign_key: 'acronym_id', optional: true

  belongs_to :book

  has_many :glossary_terms

  delegate :name, to: :see, prefix: true
  delegate :name, to: :seealso, prefix: true
  delegate :name, to: :acronym, prefix: true

  validates :name, presence: true
end
