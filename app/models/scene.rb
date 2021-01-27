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

  belongs_to :key_point, :optional => true

  has_one :section, :as => :sectioned
  belongs_to :insert_scene, class_name: :Scene, :optional => true

  has_many :signets, as: :sigged

  validates_presence_of :time

  def full_name
    "#{self.abc}:#{self.summary.to_plain_text[0..99]}"
  end

  def name
    "#{self.summary.to_plain_text[0..99]}"
  end

  def time_to_text
    s = "#{self.time.to_i}"
    return  s if self.time.to_d.modulo(1) == 0
   s += " + "
   if self.time.to_d.modulo(1) < 0.0833
     s += "#{(self.time.to_d.modulo(1)/0.0192).to_i} week(s)"
   else
     s += "#{(self.time.to_d.modulo(1)/0.0833).to_i} month(s)"
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
