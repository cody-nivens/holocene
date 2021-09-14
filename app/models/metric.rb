class Metric < ApplicationRecord
  belongs_to :user
  belongs_to :metrized, polymorphic: true

  def self.update_count(object, count, user)
    metric = Metric.where("user_id =? and date between ? and ? and metrized_id = ? and metrized_type = ?", user.id, Date.today, Date.today + 1.day, object.id, object.class.name)[0]
    if metric.nil?
      metric = Metric.new
      metric.metrized = object
      metric.user = user
      metric.date = Date.today.beginning_of_day
    end
    metric.count = count
    metric.save!
  end
end
