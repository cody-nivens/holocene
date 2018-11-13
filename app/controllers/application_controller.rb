class ApplicationController < ActionController::Base
  before_action :authenticate_user!
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

  private

  def set_globals
      @book = Book.find(session['book_id']) unless !session.keys.include?('book_id')
  end
end
