class PlotPoint < ApplicationRecord
  has_many :plot_point_scenes
  has_many :scenes, through: :plot_point_scenes
  belongs_to :book

  has_rich_text :body

  validates :name, presence: true
end
