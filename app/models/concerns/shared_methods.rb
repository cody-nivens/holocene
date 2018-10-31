module SharedMethods
  extend ActiveSupport::Concern

#  included do
#    scope :public, -> { where(…) }
#  end

  def is_public?
    # your code
  end

    def mk_date(year)
        return { :year => "#{year}"}
    end

    def mk_text(text,headline = "")
        return { :text => "#{text}",:headline => "#{headline}"}
    end

  module ClassMethods
  end
end
