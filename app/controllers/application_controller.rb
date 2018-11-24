class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_footer_content

  def home
  end

  def about
  end

  def secret
  end

  def contact
  end

  def faq
  end

  def add_background_events(object)
    @events = object.holocene_events.order(:start_year)
    my_ids = []
    unless @events.length == 0
      start_year = @events.minimum(:start_year)
      end_year = @events.maximum(:start_year)

      t_events = HoloceneEvent.where("user_id = ?", current_user.id)

      case1 = t_events.where("start_year >= ?",start_year).where("start_year <= ?",end_year)
      case2 = t_events.where("start_year >= ?",start_year).where("start_year <= ?",end_year).where("end_year is not null")
      case3 = t_events.where("end_year is not null").where("end_year >= ?",start_year).where("end_year <= ?",end_year)
      case4 = t_events.where("start_year >= ?",start_year).where("(start_year - start_year_uncert) <= ?",end_year)
      case5 = t_events.where("start_year >= ?",end_year).where("(start_year + start_year_uncert) <= ?",start_year)
      my_ids = (case1.ids + case2.ids + case3.ids + case4.ids + case5.ids).uniq
    end
    return my_ids
  end

  private
  def set_footer_content
      @footer_content = []
  end
end
