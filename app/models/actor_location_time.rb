class ActorLocationTime < ApplicationRecord
  belongs_to :actor
  belongs_to :location_time
  has_one :location, through: :location_time

  has_rich_text :role

  def title
    role.to_plain_text[0..50]
  end
end
