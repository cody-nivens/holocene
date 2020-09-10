class Signet < ApplicationRecord
    belongs_to :sigged, polymorphic: true

    validates_length_of :message, :minimum => 1, :too_short => "Message must have content"

    @@colors = [['HotPink', 'FF69B4'],
      ['Orange', 'FFA500'],
      ['Gold', 'FFD700'],
      ['PaleGreen', '98FB98'],
      ['PaleTurqoise', 'AFEEEE']]

    def self.color_name(color_id)
      return @@colors[color_id.to_i][0]
    end

    def self.color(color_id)
      return @@colors[color_id.to_i][1]
    end

    def self.num_of_colors
      return @@colors.length
    end

    def self.color_class(color_id)
      return "color-#{@@colors[color_id.to_i][1]}"
    end
end
