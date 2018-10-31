class Era < ApplicationRecord
    include SharedMethods

    has_and_belongs_to_many :timelines

    validates :name, :start_date, :end_date, presence: true

    def era_json_tjs
        node = {:name => mk_text(self.name),
                :start_date => mk_date(self.start_date),
                :end_date => mk_date(self.end_date)
        }
        return node
    end
end
