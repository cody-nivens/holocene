class Section < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position # Indicate a sort column

    has_rich_text :body

    belongs_to :sectioned, polymorphic: true

    #belongs_to :chapter, :optional => true
    #has_many :chapters, :as => :scripted
    #has_many :scenes

    has_many :footnotes, -> { where("slug != ?","") }, as: :noted
    has_many :signets, as: :sigged

    has_and_belongs_to_many :holocene_events


    validates :name, presence: true

    def embed?
      return self.embed != 0
    end

    def timeline_json(toggle)
        return {:events => self.holocene_events.order(:start_year).collect{|x| x.slide}}.to_json
    end

    def map_locs
        return self.holocene_events.collect{|x| (x.lat.nil? ? nil : x.location) }.compact
    end

    def word_count
      return WordsCounted.count(self.body.to_plain_text).token_count + WordsCounted.count(self.name).token_count
    end
end
