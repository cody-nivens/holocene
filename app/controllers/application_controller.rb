class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_footer_content
  before_action :set_globals

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
      start_year = @events.first.start_year
      end_year = (@events[@events.length - 1].end_year.nil? ?  @events[@events.length - 1].start_year : @events[@events.length - 1].end_year)

      timeline = Timeline.find_by_name("Main")
      t_events = timeline.holocene_events

      my_events = t_events.where("start_year >= ?",start_year).where("start_year <= ?",end_year)
      my_ids = my_events.pluck(:id)
    end
    ids = object.holocene_events.pluck(:id)
    return ids + my_ids
  end

  private
  def set_footer_content
      @footer_content = []
  end


  def set_globals
      @book = Book.find(session['book_id']) unless session.nil? || !session.keys.include?('book_id')
  end
end
