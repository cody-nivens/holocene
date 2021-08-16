class WelcomeController < ApplicationController
  def index
    @today_mod        = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?",       current_user.id, Date.today.to_date, Date.today.to_date).order(created_at: :desc)
    @today_create     = Metric.where("user_id = ? and date(created_at) BETWEEN ? AND ?", current_user.id, Date.today.to_date, Date.today.to_date).order(created_at: :desc)

    @yesterday_mod    = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?", current_user.id, (Date.today - 1.day).to_date, (Date.today - 1.day).to_date).order(created_at: :desc)

    @yesterday_create = Metric.where("user_id = ? and date(created_at) BETWEEN ? AND ?",  current_user.id, (Date.today - 1.day).to_date, (Date.today - 1.day).to_date).order(created_at: :desc)

    @last_week_mod    = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?",       current_user.id, (Date.today - 1.week).to_date, Date.today.to_date).order(created_at: :desc)
    @last_week_create = Metric.where("user_id = ? and date(created_at) BETWEEN ? AND ?", current_user.id, (Date.today - 1.week).to_date, Date.today.to_date).order(created_at: :desc)


    items = []
    metrics = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?", current_user.id, Date.today.beginning_of_day - 1.week, Date.today.end_of_day).order(date: :desc)
    metrics.collect{|x| x.metrized_id}.each do |item|
      Metric.where(metrized_id: item).each do |y|
        items << [ y.id, y.date, y.metrized_id]
      end
    end
    j= []
    items.each do |item|
      section = Section.find(item[2])
      section.metrics.each do |y|
        j << [ item[2], y]
      end
    end
    #debugger
    #a = 1
  end

  def stats
  end

  def map_test
  end

  def tags
  end
end
