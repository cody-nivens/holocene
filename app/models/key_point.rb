class KeyPoint < ApplicationRecord
  include RankedModel
  ThinkingSphinx::Callbacks.append(
    self, behaviours: [:sql]
  )
  ranks :position, with_same: :scripted_id

  belongs_to :scripted, polymorphic: true
  acts_as_list scope: :scripted

  has_many :scenes, -> { order(position: :asc) }

  validates_presence_of :hook

  def section_count
    count = 0
    scenes.each do |scene|
      count += (scene.section.nil? ? 0 : 1)
    end
    count
  end

  def scene_count
    count = 0
    scenes.each do |_scene|
      count += 1
    end
    count
  end

  def word_count
    count = 0
    scenes.each do |scene|
      count += scene.word_count
    end
    count
  end

  def set_prev
    higher_item
  end

  def set_next
    lower_item
  end

  def print_name?
    print_name
  end

  def print_points?
    print_points
  end

  def anchor
    name.underscore.gsub(/[ '.]/, '_')
  end

  def name
    hook[0..39]
  end

  def self.selector_title(selector)
    case selector
    when 1
      'First Point'
    when 2
      'First Pinch Point'
    when 3
      'Midpoint'
    when 4
      'Second Pinch Point'
    when 5
      'Third Point'
    else
      'Climax'
    end
  end

  def selector_value(selector)
    case selector.to_i
    when 1
      first_plot_point
    when 2
      first_pinch_point
    when 3
      midpoint
    when 4
      second_pinch_point
    when 5
      third_plot_point
    when 6
      climax
    end
  end

  def selector_value_set(selector, obj)
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
    min = 10_000
    scenes.order(:selector).each do |scene|
      min = scene.min if min > scene.min
    end
    min
  end

  def max
    max = 0
    scenes.order(:selector).each do |scene|
      max = scene.max if max < scene.max
    end
    max
  end

  def set_values
    scripted = self.scripted
    story = key_point = book = nil
    case scripted_type
    when 'Story'
      story = self.scripted
      book = story.book
    end
    [book, story, self, nil, nil]
  end
end
