class Page < ApplicationRecord
  has_rich_text :body
  belongs_to :user

end
