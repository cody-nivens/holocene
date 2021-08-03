module ApplicationHelper

  def breadcrumb(book, story=nil, key_point=nil, scene=nil)
    str = my_link_to(book.name,book_path(:id => book.id))
    unless story.nil?
      str += " | "
      str += my_link_to(story.name,book_story_path(:book_id => book.id, :id => story.id))
    end
    unless key_point.nil?
      str += " | "
      str += my_link_to(key_point.hook,story_key_point_path(:story_id => story.id, :id => key_point.id))
    end
    return str
  end

  def epub_friendly(body)
    return body.to_s.gsub(/<br>/,'<br/>')
  end

  def my_link_to(text, href)
    "<a href='#{href}'>#{text}</a>".html_safe
  end

    def format_biblio_authors(authors)
        s = ""
        authors.each do |author|
            s += "#{author.first_name} #{author.last_name}, "
        end
        
        return s.chomp(", ")
    end

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

    def event_types_to_s(types, epub)
        str = ""
        types.each do |ty|
          if epub
            str += " #{ty.name},"
          else
            str += " <a href=\"/event_types/#{ty.id}\">#{ty.name}</a>,"
          end
        end
        return str.gsub(/^ /,'').gsub(/,$/,'')
    end

	def convert_ad(value,uncert = nil)
        return "" if value.nil?
        a = (value < 0 ? "#{-value}&nbsp;BC" : "#{value}&nbsp;AD")
        a += " &plusmn; #{uncert} years" unless uncert.nil?
        return a.html_safe
    end
end
