class Scene < ApplicationRecord
  include SharedMethods
  include Rails.application.routes.url_helpers
  ThinkingSphinx::Callbacks.append(
    self, :behaviours => [:sql]
  )
  # if you're using namespaced models:
  ThinkingSphinx::Callbacks.append(
    self, 'action_text/rich_text', :behaviours => [:sql]
  )
  #acts_as_list scope: :key_point_id

  include RankedModel
  belongs_to :key_point, :optional => true
  ranks :position, with_same: :key_point_id

  belongs_to :artifact, :optional => true
  acts_as_list scope: :key_point

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
  has_many :characters, ->{ order(:last_name) }, :through => :character_scenes

  belongs_to :situated, polymorphic: true


  has_one :section, :as => :sectioned
  belongs_to :insert_scene, class_name: :Scene, :optional => true

  has_many :signets, as: :sigged

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

  def time_string
    info = time_to_array

    year = info[0] 
    month =  info[1]
    day =  info[2]
    return "%04d" % year.to_i + "-%02d" % month.to_i + "-%02d" % day.to_i
  end

    #
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

  def self.get_scenes(situated, toggle)
    stories = nil
    if situated.class.name == 'Book'
      stories = situated.stories.where(stand_alone: false, publish: true).order(:position)
    else
      stories = [ situated ]
    end

    scenes_h  = {}
    stories.each do |story|
      story.key_points.each do |key_point|
        key_point.scenes.each do |scene|
          unless toggle == "on"
              scenes = self.where(insert_scene_id: scene.id)
              scenes.each do |scene_2|
                next unless scene_2.key_point.scripted.publish?
                if scenes_h["#{scene_2.time_string}"].nil?
                  scenes_h["#{scene_2.time_string}"] = []
                end
                scenes_h["#{scene_2.time_string}"] << scene_2 unless scenes_h["#{scene_2.time_string}"].include?(scene_2)
              end
           end
           if scenes_h["#{scene.time_string}"].nil?
             scenes_h["#{scene.time_string}"] = []
           end
           scenes_h["#{scene.time_string}"] << scene unless scenes_h["#{scene.time_string}"].include?(scene)
        end
      end
    end

    scene_ids = []
    scenes_h.keys.sort.each do |x|
      scenes_h[x].each do |scene|
        scene_ids << scene
      end
    end
    if situated.class.name == 'Book'
      stories = situated.stories.where(stand_alone: true, publish: true).order(:position)

      stories.each do |story|
        story.key_points.order(:position).each do |key_point|
          key_point.scenes.order(:date_string,:abc,:position).each do |scene|
            unless toggle == "on" 
                scenes = self.where(insert_scene_id: scene.id)
                scenes.each do |scene_2|
                  next unless scene_2.key_point.scripted.publish?
                  scene_ids << scene_2
                end
             end
             scene_ids << scene
          end
        end
      end
    end

    return scene_ids
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

end
