class KeyPoint < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  belongs_to :scripted, polymorphic: true
  acts_as_list scope: :scripted


  has_many :scenes, -> { order(position: :asc) }

  validates_presence_of :hook

  def section_count
    count = 0
    self.scenes.each do |scene|
      count += (scene.section.nil? ? 0 : 1)
    end
    return count
  end

  def scene_count
    count = 0
    self.scenes.each do |scene|
      count += 1
    end
    return count
  end

  def word_count
    count = 0
    self.scenes.each do |scene|
      count += scene.word_count
    end
    return count
  end

    def set_prev
      self.higher_item
    end

    def set_next
      self.lower_item
    end

  def print_name?
    self.print_name
  end

  def print_points?
    self.print_points
  end

  def anchor
    self.name.underscore.gsub(/[ '.]/,'_')
  end

  def name
    hook[0..99]
  end

  def selector_value(selector)
    case selector.to_i
    when 1
      self.first_plot_point
    when 2
      self.first_pinch_point
    when 3
      self.midpoint
    when 4
      self.second_pinch_point
    when 5
      self.third_plot_point
    when 6
      self.climax
    end
  end

  def selector_value_set(selector,obj)
    case selector.to_i
    when 1
      self.first_plot_point = obj
    when 2
      self.first_pinch_point = obj
    when 3
      self.midpoint = obj
    when 4
      self.second_pinch_point = obj
    when 5
      self.third_plot_point = obj
    when 6
      self.climax = obj
    end
  end

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
