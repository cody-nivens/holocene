class CharacterAttribute < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  belongs_to :character_category
  belongs_to :related, primary_key: :related_id, class_name: 'CharacterAttribute', optional: true

  has_many :character_values, dependent: :destroy

  delegate :name, to: :character_category, prefix: true
  validates_presence_of :name

  def related_name
    (related_id.nil? ? '' : CharacterAttribute.find(related_id).name.humanize)
  end
end
