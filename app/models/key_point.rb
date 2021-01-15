class KeyPoint < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  belongs_to :scripted, polymorphic: true

  has_many :scenes

  validates_presence_of :hook

  def name
    self.hook[0..20]
  end
end
