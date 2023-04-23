class ActorCharacter < ApplicationRecord
  belongs_to :actor
  belongs_to :character
  has_rich_text :role

end
