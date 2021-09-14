class Artifact < ApplicationRecord
  belongs_to :character
  belongs_to :book
  belongs_to :artifact_type

  has_many :children, :foreign_key => "parent_id", :primary_key => "id", :class_name => "Artifact"
  belongs_to :parent, :class_name => "Artifact", :foreign_key => "parent_id", :optional => true
  has_many :scenes, :as => :located

  has_rich_text :summary

  acts_as_taggable_on :tags

  delegate :name, :to => :character, :prefix => true
  delegate :name, :to => :artifact_type, :prefix => true

  validates :name, presence: true

  def set_values
    book = self.book
    return [ book, self, nil, nil, nil ]
  end

end
