class Scene < ApplicationRecord
  include SharedMethods
  include Rails.application.routes.url_helpers
  include RankedModel

  ThinkingSphinx::Callbacks.append(
    self, :behaviours => [:sql]
  )
  # if you're using namespaced models:
  ThinkingSphinx::Callbacks.append(
    self, 'action_text/rich_text', :behaviours => [:sql]
  )

  belongs_to :key_point, :optional => true
  acts_as_list scope: :key_point
  ranks :position, with_same: :key_point_id

  belongs_to :artifact, :optional => true
  belongs_to :situated, polymorphic: true
  belongs_to :insert_scene, class_name: :Scene, :optional => true

  has_rich_text :summary
  has_rich_text :place
  has_rich_text :goal_reaction
  has_rich_text :conflict_dilemma
  has_rich_text :disaster_decision
  has_rich_text :short_term_goal
  has_rich_text :long_term_goal
  has_rich_text :over_arching_goal

  has_one :action_text_rich_text,
    class_name: 'ActionText::RichText',
    as: :record

  has_many :character_scenes
  has_many :characters, :through => :character_scenes
  has_one :section, :as => :sectioned
  has_many :signets, as: :sigged
  has_many :tours

  delegate :abc, :to => :insert_scene, :prefix => true
  delegate :name, :to => :artifact, :prefix => true


  validates_presence_of :abc

  def set_prev
    prev_item = self.higher_item
    if prev_item.nil?
      key_point = self.key_point.set_prev
      return nil if key_point.nil?
      prev_item = key_point.scenes.order(:position).last
      return nil if prev_item.nil?
    end
    return prev_item
  end

  def set_next
    next_item = self.lower_item
    if next_item.nil?
      key_point = self.key_point.set_next
      return nil if key_point.nil?
      next_item = key_point.scenes.order(:position).first
      return nil if next_item.nil?
    end
    return next_item
  end

  def mk_date
    info = time_to_array

    year = info[0]
    month =  info[1]
    day =  info[2]
    return { :year => "#{year.to_i}", :month => "#{month.to_i}", :day => "#{day.to_i}"}
  end

  # Generate json for TimelineJS
  #
  def slide
    slde = { :start_date => mk_date,
             :end_date => mk_date,
             :group => self.key_point.scripted.name,
             :text => mk_text(self.summary,self.name)
      }
    return slde
  end

  def full_name
    "#{self.abc}:#{self.summary.to_plain_text[0..99]}"
  end

  def name
    "#{self.summary.to_plain_text[0..99]}"
  end

  def plain_name
    #"#{self.summary.to_plain_text[0..99]}"
    "#{self.summary.to_plain_text}"
  end

    def word_count
      count = (self.section.nil? ? 0 : self.section.word_count)
      return count
    end

  def self.get_scenes(situated, toggle, scene_year=nil)
    stories = nil
    if situated.class.name == 'Book'
      stories = situated.stories.where(stand_alone: false, publish: true).order(:position)
    else
      stories = [ situated ]
    end

    scenes_h  = {}
    stories.each do |story|
      story.key_points.each do |key_point|
        key_point.scenes.order(:selector,:position).each do |scene|
          date = scene.date_string.to_date
          next if !scene_year.nil? && date.year != scene_year.to_i

          year = date.year
          month = date.month
          day = date.day

           if scenes_h[year].nil?
             scenes_h[year] = {}
           end
           if scenes_h[year][month].nil?
             scenes_h[year][month] = {}
           end
           if scenes_h[year][month][day].nil?
             scenes_h[year][month][day] = []
           end

           scenes_h[year][month][day] << scene unless scenes_h[year][month][day].include?(scene)
        end
      end
    end

    return scenes_h
  end

  def self.get_scenes_to_array(situated, toggle, scene_year=nil)
    scenes = self.get_scenes(situated,toggle,scene_year)
    items = []
    scenes.keys.sort.each do |year|
      scenes[year].keys.sort.each do |month|
        scenes[year][month].keys.sort.each do |day|
          scenes[year][month][day].each do |scene|
            items << scene unless items.include?(scene)
          end
        end
      end
    end
    return items
  end

  def time_to_array
    t_parts = self.date_string.split("-")
    year = t_parts[0].to_i
    month = t_parts[1].to_i
    day = t_parts[2].to_i
    return  [year,month,day]
  end

  def time_to_text
    info = time_to_array

    s = "#{info[0]}"
    return  "#{s}y " if info[1] == "" && info[2] == ""

    s += "y "
    s += "#{info[1]}m "
    s += "#{info[2]}d"
    return s
  end

  def min
    return self.date_string[0..3].to_i
  end

  def max
    return self.date_string[0..3].to_i
  end

  def set_values
    situated = self.situated
    story = key_point = book = nil
    case self.situated_type
    when "Story"
       story = self.situated
       key_point = self.key_point
       book = story.book
    end
    return [ book, story, key_point, self, nil ]
  end

  def book
    story = self.situated
    book = story.book
    return book
  end
end
