class Aside < ApplicationRecord
  belongs_to :chapter

  validates_uniqueness_of :chapter_id
  validates :name, presence: true

  def word_count
      return WordsCounted.count(self.body).token_count + WordsCounted.count(self.name).token_count
  end
end
