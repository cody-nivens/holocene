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

  has_and_belongs_to_many :characters

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
    s = "Year #{self.time.to_i}"
    return  s if self.time.to_d.modulo(1) == 0
   s += " + "
   if self.time.to_d.modulo(1) < 0.083333333
     s += "#{(self.time.to_d.modulo(1)/0.019230769).to_i} week(s)"
   else
     s += "#{(self.time.to_d.modulo(1)/0.083333333).to_i} month(s)"
  end
   return s
  end
end
