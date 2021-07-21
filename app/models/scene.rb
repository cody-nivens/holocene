class Scene < ApplicationRecord
  include SharedMethods
  include Rails.application.routes.url_helpers

  include RailsSortable::Model
  set_sortable :position # Indicate a sort column

  has_rich_text :summary
  has_rich_text :place
  has_rich_text :goal_reaction
  has_rich_text :conflict_dilemma
  has_rich_text :disaster_decision
  has_rich_text :short_term_goal
  has_rich_text :long_term_goal
  has_rich_text :over_arching_goal

  has_many :character_scenes
  has_many :characters, ->{ order(:last_name) }, :through => :character_scenes

  belongs_to :situated, polymorphic: true

  belongs_to :key_point, :optional => true

  has_one :section, :as => :sectioned
  belongs_to :insert_scene, class_name: :Scene, :optional => true

  has_many :signets, as: :sigged

  validates_presence_of :abc

  def mk_date
    info = time_to_array

    year = info[0] 
    month =  info[1]
    day =  info[2]
    return { :year => "#{year.to_i}", :month => "#{month.to_i}", :day => "#{day.to_i}"}
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


    scene_ids = []
    stories.each do |story|
      story.key_points.order(:position).each do |key_point|
        key_point.scenes.order(:time,:abc).each do |scene|
          unless toggle == "on"
              scenes = self.where(insert_scene_id: scene.id)
              scenes.each do |scene_2|
                next unless scene_2.key_point.scripted.publish?
                scene_ids << scene_2
              end
           end
           scene_ids << scene.id
        end
      end
    end

    if toggle == "on"
      all_scenes = self.where("id in (?)", scene_ids).order(:abc)
    else
      all_scenes = self.where("id in (?)", scene_ids).order(:time, :abc)
    end

    scene_ids = []
    if situated.class.name == 'Book'
      stories = situated.stories.where(stand_alone: true, publish: true).order(:position)

    stories.each do |story|
      story.key_points.order(:position).each do |key_point|
        key_point.scenes.order(:time,:abc).each do |scene|
          unless toggle == "on" 
              scenes = self.where(insert_scene_id: scene.id)
              scenes.each do |scene_2|
                next unless scene_2.key_point.scripted.publish?
                scene_ids << scene_2
              end
           end
           scene_ids << scene.id
        end
      end
    end

    end
    scenes2 = self.where("id in (?)", scene_ids).order(:time, :abc)

    return all_scenes + scenes2
  end

  def time_to_array
    year = self.time.to_i
    time = self.time
    month = 1
    week = 1
    day = 1
    return  [year,1,1] if time.to_d.modulo(1) == 0
    month_slice = 0.0833
    week_slice =  0.0192
    day_slice =   0.0027

   if self.time.to_d.modulo(1) >= month_slice
     month = (self.time.to_d.modulo(1)/month_slice).to_i
   end
   if self.time.to_d.modulo(1) >= week_slice
     week = ((self.time - (month.nil? ? 0 : month*month_slice)).to_d.modulo(1)/week_slice).to_i
   else
  end

   if time.to_d.modulo(1) >= day_slice
     day = ((self.time - (week.nil? ? 0 : week*week_slice) - (month.nil? ? 0 : month*month_slice)).to_d.modulo(1)/day_slice).to_i
   end
   return [year, month, day]
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
    return self.time.to_i
  end

  def max
    return self.time.to_i
  end
end
