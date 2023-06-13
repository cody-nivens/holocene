class WelcomeController < ApplicationController
  def index
  end

  def progress
    session[:return_to] = request.fullpath
    @title = "Progress"
    @start_date       = params[:start_date]
    @today_date = @start_date.nil? ? Date.today.beginning_of_month.beginning_of_week : Date.parse(@start_date).beginning_of_month.beginning_of_week

    @today_mod        = Metric.by_day(@today_date, field: :date).where(user_id: current_user.id).order(date: :desc)
    @today_create     = Metric.by_day(@today_date).where(user_id: current_user.id).order(created_at: :desc)

    @yesterday_mod    = Metric.by_day(@today_date - 1.day, field: :date).where(user_id: current_user.id).order(date: :desc)
    @yesterday_create = Metric.by_day(@today_date - 1.day).where(user_id: current_user.id).order(created_at: :desc)

    @last_fortnight_mod    = Metric.between_dates(@today_date - 2.weeks, @today_date, field: :date).where(user_id: current_user.id).order(date: :desc)
    @last_fortnight_create = Metric.between_dates(@today_date - 2.weeks, @today_date).where(user_id: current_user.id).order(created_at: :desc)

    items = {}
    @dates_counts = {}

    metrics = Metric.between_dates(@today_date, @today_date + 42.days).where(user_id: current_user.id).order(date: :desc)
    metrics.pluck(:metrized_id).sort.uniq.each do |item|
      #Metric.past_fortnight(:date).where(metrized_id: item).each do |y|
      Metric.between_dates(@today_date, @today_date + 42.days).where(metrized_id: item).each do |y|
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
    report = "progress"
    report_path = 'welcome'
    respond_to do |format|
      format.turbo_stream { render 'report', locals: { report: report, report_path: report_path } }
    end
  end

  def history
    @title = "History"

    items = {}
    @dates_counts = {}

    metrics = Metric.where(user_id: current_user.id).order(date: :desc)
    metrics.pluck(:metrized_id).sort.uniq.each do |item|
      #Metric.past_fortnight(:date).where(metrized_id: item).each do |y|
      Metric.where(metrized_id: item).each do |y|
        items[y.date] = [] if items[y.date].nil?
        items[y.date] << [y.id, y.metrized_id] unless items[y.date].include?([y.id, y.metrized_id])
      end
    end
    items.keys.sort.each do |key|
      items[key].each do |item|
        @dates_counts[key] = [0, 0] if @dates_counts[key].nil?
        #section = Section.find(item[1])
        met = Metric.find(item[0])
        mets = Metric.where(metrized_id: item[1]).before(key).order(date: :desc)
        if mets.length > 0
          @dates_counts[key][1] += met.count - mets[0].count
        else
          @dates_counts[key][0] += met.count
        end
      end
    end
    report = "history"
    report_path = 'welcome'
    respond_to do |format|
      format.turbo_stream { render 'report', locals: { report: report, report_path: report_path } }
    end
  end

  def show
    @date = params[:date]
    items = {}
    @dates_counts = {}
    @metrics = Metric.where(user_id: current_user.id, date: @date.in_time_zone).order(date: :desc)
    #metrics = Metric.past_fortnight(:date).where(user_id: current_user.id).order(date: :desc)
    @metrics.pluck(:metrized_id).sort.uniq.each do |item|
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
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  def stats
    @title = "Stats"
    report = "stats"
    report_path = 'welcome'
    respond_to do |format|
      format.turbo_stream { render 'report', locals: { report: report, report_path: report_path } }
    end
  end

  def tags
    @title = "Tags"
    report = "tags"
    report_path = 'welcome'
    respond_to do |format|
      format.turbo_stream { render 'report', locals: { report: report, report_path: report_path } }
    end
  end
end
