class Metric < ApplicationRecord
  belongs_to :user
  belongs_to :metrized, polymorphic: true
end
