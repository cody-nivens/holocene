class Partition < ApplicationRecord
    belongs_to :chapter

    has_rich_text :body

    validates :name, presence: true

    def word_count
      return WordsCounted.count(self.body.to_plain_text).token_count + WordsCounted.count(self.name).token_count
    end
end
