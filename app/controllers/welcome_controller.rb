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
    metrics = Metric.past_fortnight.where(user_id: current_user.id).order(date: :desc)
    metrics.collect { |x| x.metrized_id }.each do |item|
      Metric.where(metrized_id: item).each do |y|
        items[y.date] = [] if items[y.date].nil?
        items[y.date] << [y.id, y.metrized_id]
      end
    end
    @dates_counts = {}
    items.keys.sort.each do |key|
      items[key].each do |item|
        section = Section.find(item[1])

        @dates_counts[key] = [0, 0] if @dates_counts[key].nil?
        mets = section.metrics.order(date: :desc)
        @dates_counts[key][0] += mets[0].count if mets.count == 1
        @dates_counts[key][1] += mets[0].count - mets[1].count if mets.size > 1
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
