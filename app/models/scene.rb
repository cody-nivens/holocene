class Scene < ApplicationRecord
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

  belongs_to :key_point #, :optional => true

  has_one :section, :as => :sectioned
  belongs_to :insert_scene, class_name: :Scene, :optional => true

  has_many :signets, as: :sigged

  #validates_presence_of :time

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

  def time_to_text
    year = self.time.to_i
    time = self.time
    s = "#{year}"
    return  "#{s}y " if time.to_d.modulo(1) == 0
    month_slice = 0.0833
    week_slice =  0.0192
    day_slice =   0.0027

   s += "y "
   if self.time.to_d.modulo(1) >= month_slice
     month = (self.time.to_d.modulo(1)/month_slice).to_i
     s += "#{month}m "
   end
   if self.time.to_d.modulo(1) >= week_slice
     week = ((self.time - (month.nil? ? 0 : month*month_slice)).to_d.modulo(1)/week_slice).to_i
     s += "#{week}w " unless week.to_i == 0
   else
  end

   if time.to_d.modulo(1) >= day_slice
     day = ((self.time - (week.nil? ? 0 : week*week_slice) - (month.nil? ? 0 : month*month_slice)).to_d.modulo(1)/day_slice).to_i
     s += "#{day}d" unless day.to_i == 0
   end
   return s
  end

  def min
    return self.time.to_i
  end

  def max
    return self.time.to_i
  end
end
