class Story < ApplicationRecord
  include RankedModel
  ranks :position, with_same: :book_id

  belongs_to :book

  has_many :character_stories
  has_many :characters, ->{ order(:last_name) }, :through => :character_stories


  has_many :chapters, :as => :scripted
  has_many :key_points, -> { order(position: :asc) }, :as => :scripted
  has_many :scenes, :as => :situated
  has_many :signets, as: :sigged

  validates :title, presence: true

  def timeline_json(toggle)
    return {:events => Scene.get_scenes(self, toggle).collect{|x| x.slide}}.to_json
  end


  def publish?
    self.publish
  end

  def stand_alone?
    self.stand_alone
  end

  def print_summary?
    self.print_summary
  end

  def name
    self.title
  end

  def resync_key_points
    index = 0
    points = self.key_points.order(:position).collect{|x| x.scenes.order(selector: :asc, time: :asc, abc: :asc).pluck(:id, :abc, :selector)}
    kps = points.collect{|kp| kp.collect{|y| index += 1;[y[0], "#{self.scene_character}%0.5d00" % index]}}
    kps.each do |updates|
      updates.each do |x|
        scene = Scene.find(x[0])
        scene.update({:abc => x[1]})
      end
    end
    results = []
    self.key_points.each do |kp|
      kp.scenes.each do |scene|
        scene.characters.each do |character|
          results << character unless results.include?(character)
        end
      end
    end
    results.each do |character|
      self.characters << character unless self.characters.include?(character)
    end
  end

    def word_count
      count = 0
      self.key_points.each do |key_point|
        key_point.scenes.each do |scene|
          unless scene.section.nil?
            count += scene.section.word_count
          end
        end
      end
      return count
    end

  def section_count
    count = 0
    self.key_points.each do |key_point|
      count += key_point.section_count
    end
    return count
  end

  def scene_count
    count = 0
    self.key_points.each do |key_point|
      count += key_point.scene_count
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
