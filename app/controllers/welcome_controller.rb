class WelcomeController < ApplicationController
  def index
    @today_mod        = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?",       current_user.id, Date.today.to_date, Date.today.to_date).order(created_at: :desc)
    @today_create     = Metric.where("user_id = ? and date(created_at) BETWEEN ? AND ?", current_user.id, Date.today.to_date, Date.today.to_date).order(created_at: :desc)

    @yesterday_mod    = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?", current_user.id, (Date.today - 1.day).to_date, (Date.today - 1.day).to_date).order(created_at: :desc)
    @yesterday_create = Metric.where("user_id = ? and date(created_at) BETWEEN ? AND ?",  current_user.id, (Date.today - 1.day).to_date, (Date.today - 1.day).to_date).order(created_at: :desc)

    @last_week_mod    = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?",       current_user.id, (Date.today - 1.week).to_date, Date.today.to_date).order(created_at: :desc)
    @last_week_create = Metric.where("user_id = ? and date(created_at) BETWEEN ? AND ?", current_user.id, (Date.today - 1.week).to_date, Date.today.to_date).order(created_at: :desc)

    items = {}
    metrics = Metric.where("user_id = ? and date(date) BETWEEN ? AND ?", current_user.id, Date.today.beginning_of_day - 1.week, Date.today.end_of_day).order(date: :desc)
    metrics.collect{|x| x.metrized_id}.each do |item|
      Metric.where(metrized_id: item).each do |y|
        if items[y.date].nil?
          items[y.date] = []
        end
        items[y.date] << [ y.id, y.metrized_id]
      end
    end
    @dates_counts = {}
    items.keys.sort.each do |key|
      items[key].each do |item|
        section = Section.find(item[1])

        if @dates_counts[key].nil?
          @dates_counts[key] = [0, 0]
        end
        mets = section.metrics.order(:date)
        @dates_counts[key][0] +=  mets[0].count if mets.length == 1
        @dates_counts[key][1] += (mets[mets.length - 1].count - mets[mets.length - 2].count)
      end
    end
  end

  def stats
  end

  def map_test
  end

  def tags
  end
end
