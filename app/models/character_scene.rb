class CharacterScene < ApplicationRecord
  has_rich_text :summary

  belongs_to :character
  belongs_to :scene
end
