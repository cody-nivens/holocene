module ApplicationHelper

    def event_types_to_s(types)
        str = ""
        types.each do |ty|
            str += " #{ty.name},"
        end
        return str.gsub(/^ /,'').gsub(/,$/,'')
    end

	def convert_ad(value)
        return "" if value.nil?
		return (value < 0 ? "#{-value} BC" : "#{value} AD")
    end

    def write_footnotes(slugs)
        str = "<hr/>"
        index = 1
        slugs.each do |slug|
            my_footnote = slug[1].footnotes.where(:slug => slug[0].gsub(/#{slug[1].slug}/,''))
            index = slug[2]
            if my_footnote.length == 0
                str += "<a href='/#{slug[1].class.name.underscore.pluralize}/#{slug[1].id}/footnotes/#{slug[0]}'>Missing footnote</a>"
            else
              str += "<sup id='fn#{index}'>#{index}. [#{my_footnote[0].body}]<a href='#ref#{index}' data-turbolinks='false' title='Jump back to footnote #{index} in the text.'>↩</a></sup><br/>"
            end
        end
        return str
    end

    def process_body(object, slugs, index = 1)
        footnote_slugs = []
        my_body = object.body
        unless my_body.nil?
          while my_m = my_body.match(/\[\[([^ ]*)\]\]/)
             my_body.gsub!(/\[\[#{my_m[1]}\]\]/,"<sup><a href=\"#fn#{index}\" data-turbolinks='false' id=\"ref#{index}\">#{index}</a></sup>")
             footnote_slugs << [ my_m[1], object, index]
             index += 1
          end
        end
        return [ my_body, footnote_slugs, index]
    end
end
