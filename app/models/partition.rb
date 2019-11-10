class Partition < ApplicationRecord
    belongs_to :chapter

    validates :name, presence: true

    def word_count
      return WordsCounted.count(self.body).token_count
    end
end
