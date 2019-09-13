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
        a = (value < 0 ? "#{ActiveSupport::NumberHelper.number_to_delimited(-value)} BC" : "#{ActiveSupport::NumberHelper.number_to_delimited(value)} AD")
        a += " ± #{uncert} years" unless uncert.nil?
        return a
    end
  end
end
