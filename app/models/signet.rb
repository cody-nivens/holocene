class Signet < ApplicationRecord
  belongs_to :sigged, polymorphic: true

  validates_length_of :message, minimum: 1, too_short: 'Message must have content'

  @@colors = [%w[HotPink FF69B4],
              %w[Orange FFA500],
              %w[Gold FFD700],
              %w[PaleGreen 98FB98],
              %w[PaleTurqoise AFEEEE]]

  def self.color_name(color_id)
    @@colors[color_id.to_i][0]
  end

  def self.color(color_id)
    @@colors[color_id.to_i][1]
  end

  def self.num_of_colors
    @@colors.length
  end

  def self.color_class(color_id)
    "color-#{@@colors[color_id.to_i][1]}"
  end
end
