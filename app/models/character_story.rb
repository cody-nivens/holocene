class CharacterStory < ApplicationRecord
  has_rich_text :summary

  belongs_to :character
  belongs_to :story
end
