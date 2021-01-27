class Book < ApplicationRecord
    belongs_to :user

    has_many :glossary_terms
    has_many :biblioentries
    has_many :stories
    has_many :chapters, :as => :scripted
    has_many :key_points, :as => :scripted
    has_many :scenes, :as => :situated

    has_and_belongs_to_many :authors, dependent: :nullify
    has_and_belongs_to_many :characters, dependent: :nullify


    validates :name, presence: true

    has_many :signets, as: :sigged

    def show_events?
      return self.show_events
    end

    def is_fiction?
      return self.fiction
    end

    def word_count
      count = (self.body.nil? ? 0 : WordsCounted.count(self.body).token_count)
      if self.is_fiction?
        self.stories.each do |story|
          story.key_points.each do |key_point|
            key_point.scenes.each do |scene|
              unless scene.section.nil?
                count += scene.section.word_count
              end
            end
          end
        end
      else
        self.chapters.each do |chap|
          count += chap.word_count
        end
      end
      return count
    end

    def scene_count
      count = 0
      self.stories.each do |story|
        count += story.scene_count
      end
      return count
    end
end
