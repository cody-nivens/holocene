class Book < ApplicationRecord
    belongs_to :user

    has_many :glossary_terms
    has_many :biblioentries

    has_many :chapters
    has_and_belongs_to_many :authors


    validates :name, presence: true

    def word_count
      count = (self.body.nil? ? 0 : WordsCounted.count(self.body).token_count)
      self.chapters.each do |chap|
        count += chap.word_count
      end
      return count
    end

end
