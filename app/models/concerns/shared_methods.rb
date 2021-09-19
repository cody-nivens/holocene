module SharedMethods
  extend ActiveSupport::Concern

  #  included do
  #    scope :public, -> { where(…) }
  #  end

  def is_public?
    # your code
  end

  def mk_date(year)
    { year: year.to_s }
  end

  def mk_text(text, headline = '')
    { text: text.to_s, headline: headline.to_s }
  end

  module ClassMethods
    def convert_ad(value, uncert = nil)
      return '' if value.nil?

      a = (value < 0 ? "#{-value}&#160;BC" : "#{value}&#160;AD")
      a += " ± #{uncert} years" unless uncert.nil?
      a.html_safe
    end
  end
end
