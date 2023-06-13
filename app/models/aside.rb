class Aside < ApplicationRecord
  belongs_to :chapter

  has_rich_text :body

  validates :name, presence: true

  def word_count
    WordsCounted.count(body.to_plain_text).token_count + WordsCounted.count(name).token_count
  end
end
