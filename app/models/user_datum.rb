class UserDatum < ApplicationRecord
   belongs_to :user
   #belongs_to :story, optional: true
   #belongs_to :book, optional: true
   #belongs_to :chapter, optional: true
   #belongs_to :stage, optional: true
end
