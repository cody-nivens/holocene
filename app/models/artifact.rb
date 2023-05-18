class Artifact < ApplicationRecord
  include Rails.application.routes.url_helpers

  acts_as_taggable_on :tags

  belongs_to :character, optional: true
  belongs_to :book
  belongs_to :artifact_type

  has_many :children, foreign_key: 'parent_id', primary_key: 'id', class_name: 'Artifact'
  belongs_to :parent, class_name: 'Artifact', optional: true
  has_many :scenes, as: :located

  has_rich_text :summary

  #delegate :name, to: :character, prefix: true
  #delegate :name, to: :artifact_type, prefix: true

  validates :name, presence: true

  def set_values
    book = self.book
    [book, self, nil, nil, nil]
  end

  def tag_list_s
    tag_list.sort.map { |t| ActionController::Base.helpers.link_to t, tag_path(t) }.join(', ')
  end
end
