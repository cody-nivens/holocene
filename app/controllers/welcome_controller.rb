class WelcomeController < ApplicationController
  def index
    @title = "Progress"
    @today_mod        = Metric.today(:date).where(user_id: current_user.id).order(date: :desc)
    @today_create     = Metric.today.where(user_id: current_user.id).order(created_at: :desc)

    @yesterday_mod    = Metric.yesterday(:date).where(user_id: current_user.id).order(date: :desc)
    @yesterday_create = Metric.yesterday.where(user_id: current_user.id).order(created_at: :desc)

    @last_fortnight_mod    = Metric.past_fortnight(:date).where(user_id: current_user.id).order(date: :desc)
    @last_fortnight_create = Metric.past_fortnight.where(user_id: current_user.id).order(created_at: :desc)

    items = {}
    @dates_counts = {}
    metrics = Metric.past_fortnight(:date).where(user_id: current_user.id).order(date: :desc)
    metrics.collect { |x| x.metrized_id }.sort.uniq.each do |item|
      #Metric.past_fortnight(:date).where(metrized_id: item).each do |y|
      Metric.where(metrized_id: item).each do |y|
        items[y.date] = [] if items[y.date].nil?
        items[y.date] << [y.id, y.metrized_id] unless items[y.date].include?([y.id, y.metrized_id])
      end
    end
    items.keys.sort.each do |key|
      items[key].each do |item|
        @dates_counts[key] = [0, 0] if @dates_counts[key].nil?
        section = Section.find(item[1])
        met = Metric.find(item[0])
        mets = Metric.where(metrized_id: item[1]).before(key).order(date: :desc)
        if mets.length > 0
          @dates_counts[key][1] += met.count - mets[0].count
        else
          @dates_counts[key][0] += met.count
        end
      end
    end
  end

  def stats
    @title = "Stats"
  end

  def tags
    @title = "Tags"
  end
end
