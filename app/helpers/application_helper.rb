module ApplicationHelper

    def format_biblioentry(bib)
        s = ""
        bib.authors.each do |author|
            s += "#{author.first_name} #{author.last_name},"
        end
        s += "<em>#{bib.name}</em>,"
        s += " #{bib.publisher}," unless bib.publisher.blank?
        s += " #{bib.copyright_year}" unless bib.copyright_year.blank?
        return s
    end

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
                footnote = (my_footnote[0].biblioentry.nil? ? my_footnote[0].body.gsub(/<br>/,'') :  my_footnote[0].biblioentry.name)
                str += "<sup id='fn#{index}'>#{index}. [#{footnote}]<a href='#ref#{index}' data-turbolinks='false' title='Jump back to footnote #{index} in the text.'>↩</a></sup><br/>"
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
