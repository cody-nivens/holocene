class KeyPoint < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  belongs_to :scripted, polymorphic: true

  has_many :scenes

  validates_presence_of :hook

  def min
    min = 10000
    self.scenes.order(:selector).each do |scene|
      if min > scene.min
        min = scene.min
      end
    end
    return min
  end

  def max
    max = 0
    self.scenes.order(:selector).each do |scene|
      if max < scene.max
        max = scene.max
      end
    end
    return max
  end

end
