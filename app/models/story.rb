class Story < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  belongs_to :book

  has_and_belongs_to_many :characters, dependent: :nullify

  has_many :chapters, :as => :scripted
  has_many :key_points, :as => :scripted
  has_many :scenes, :as => :situated
  has_many :signets, as: :sigged

  validates :title, presence: true

  def name
    self.title
  end

  def resync_key_points
    index = 0
    points = self.key_points.order(:position).collect{|x| x.scenes.order(:selector).order(:abc).pluck(:id, :abc, :selector)}
    kps = points.collect{|kp| kp.collect{|y| index += 1;[y[0], "#{self.scene_character}%0.5d00" % index]}}
    kps.each do |updates|
      updates.each do |x|
        scene = Scene.find(x[0])
        scene.update_attribute(:abc, x[1])
      end
    end
  end

  def scene_count
    count = 0
    self.key_points.each do |key_point|
      key_point.scenes.each do |scene|
        count += 1
      end
    end
    return count
  end

  def scene_min
    min = 10000
    self.key_points.each do |key_point|
      if min > key_point.min
        min = key_point.min
      end
    end
    return min
  end

  def scene_max
    max = 0
    self.key_points.each do |key_point|
      if max < key_point.max
        max = key_point.max
      end
    end
    return max
  end
end
