# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :story

  acts_as_list scope: :story_id

  has_many :itineraries

  has_rich_text :summary

  validates :name, presence: true

  #
  # Return location for jvectormap if only item added to map
  #
  def map_locs
    itineraries.collect(&:location)
  end
end
