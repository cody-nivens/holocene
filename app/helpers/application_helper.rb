module ApplicationHelper
  include Pagy::Frontend

  def breadcrumb(book, story = nil, key_point = nil, scene = nil, section = nil, link = nil)
    str = ''
    unless book.nil?
      str += (link.nil? && story.nil? ? book.name : my_link_to(book.name, book_path(book)))
    end
    case story.class.name
    when 'Story'
      book ||= story.book unless story.nil?
    when 'Chapter'
      book ||= story.scripted unless story.nil?
    end
    unless story.nil?
      str += ' | ' unless str.empty?
      str += (link.nil? && key_point.nil? ? story.name : my_link_to(story.name, polymorphic_path(story)))
    end
    unless key_point.nil?
      str += ' | ' unless str.empty?
      str += (link.nil? && scene.nil? ? key_point.name : my_link_to(key_point.name, key_point_path(key_point)))
    end
    unless scene.nil?
      str += ' | ' unless str.empty?
      str += (link.nil? && section.nil? ? scene.name : my_link_to(scene.name, scene_path(id: scene.id)))
    end
    unless section.nil?
      str += ' | ' unless str.empty?
      str += (link.nil? ? section.name : my_link_to(section.name, section_path(section)))
    end
    str
  end

  def surpress_first(crumb)
    values = crumb.split(/\|/)
    value = values.shift
    return value if values.length == 0

    values.join('|')
  end

  def epub_friendly(body)
    body.to_s.gsub(/<br>/, '<br/>')
  end

  def my_link_to(text, href)
    "<a href='#{href}'>#{text}</a>".html_safe
  end

  def format_biblio_authors(authors)
    s = ''
    authors.each do |author|
      s += "#{author.first_name} #{author.last_name}, "
    end

    s.chomp(', ')
  end

  def format_biblioentry(bib)
    s = ''
    bib.authors.each do |author|
      s += "#{author.first_name} #{author.last_name},"
    end
    s += "<em>#{bib.name}</em>,"
    s += " #{bib.publisher}," unless bib.publisher.blank?
    s += " #{bib.copyright_year}" unless bib.copyright_year.blank?
    s
  end

  def event_types_to_s(types, epub)
    str = ''
    types.each do |ty|
      str += if epub
               " #{ty.name},"
             else
               " <a href=\"/event_types/#{ty.id}\">#{ty.name}</a>,"
             end
    end
    str.gsub(/^ /, '').gsub(/,$/, '')
  end

  def convert_ad(value, uncert = nil)
    return '' if value.nil?

    a = (value < 0 ? "#{-value}&nbsp;BC" : "#{value}&nbsp;AD")
    a += " &plusmn; #{uncert} years" unless uncert.nil?
    a.html_safe
  end
end
