module HoloceneEventsHelper

	def convert_ad(value)
        return "" if value.nil?
		return (value < 0 ? "#{-value} BC" : "#{value} AD")
    end
end
