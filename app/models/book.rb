class Book < ApplicationRecord
  include RankedModel
  ThinkingSphinx::Callbacks.append(
    self, :behaviours => [:sql]
  )

  belongs_to :user
  ranks :position, with_same: :user_id

  has_rich_text :body
  has_rich_text :publisher

  has_many :key_words, :dependent => :destroy
  has_many :glossary_terms, :dependent => :destroy
  has_many :biblioentries, :dependent => :destroy
  has_many :stories, :dependent => :destroy
  has_many :chapters, :as => :scripted
  has_many :key_points, :as => :scripted
  has_many :scenes, :as => :situated
  has_many :artifacts, :dependent => :destroy
  has_many :artifact_types, :dependent => :destroy

  has_and_belongs_to_many :authors, dependent: :nullify
  has_and_belongs_to_many :characters, dependent: :nullify


  validates :name, presence: true

  has_many :signets, as: :sigged

  def timeline_json(toggle)
    return {:events => Scene.get_scenes(self, toggle).collect{|x| x.slide}}.to_json
  end

  def show_events?
    return self.show_events
  end

  def is_fiction?
    return self.fiction
  end

  def word_count(published=false)
    count = (self.body.nil? ? 0 : WordsCounted.count(self.body.to_plain_text).token_count)
    if self.is_fiction?
      stories = (published ? self.stories.where(publish: true) : self.stories)
      stories.each do |story|
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

  def scene_count(published=false)
    count = 0
    stories = (published ? self.stories.where(publish: true) : self.stories)
    stories.each do |story|
      count += story.scene_count
    end
    return count
  end

  def section_count
    count = 0
    self.stories.each do |story|
      count += story.section_count
    end
    return count
  end

  def set_values
    return [  self, nil, nil, nil, nil ]
  end
end
