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
    def convert_ad(value,uncert = nil)
        return "" if value.nil?
        a = (value < 0 ? "#{-value}&#160;BC" : "#{value}&#160;AD")
        a += " ± #{uncert} years" unless uncert.nil?
        return a.html_safe
    end
  end
end
