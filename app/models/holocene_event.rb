class HoloceneEvent < ApplicationRecord
    include SharedMethods

  belongs_to :region
  belongs_to :event_type
  has_and_belongs_to_many :citations
  has_and_belongs_to_many :timelines
  has_and_belongs_to_many :chapters

  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :event_type

  acts_as_taggable_on :tags

  validates :name, presence: true

  def slide
      slde = { :start_date => mk_date(self.start_year),
               :end_date => mk_date((self.end_year.blank? ? self.start_year : self.end_year)),
               :text => mk_text(self.body,self.name)
      }
      slde['media'] = { :url => self.url,
                        :link => self.url
      }
    return slde
  end

end
