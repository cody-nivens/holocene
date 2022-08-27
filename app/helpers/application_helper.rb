module ApplicationHelper
  include Pagy::Frontend

  def add_to_footer(name, link, options = {})
    print = options[:print] || true
    method = options[:method] || :get
    data = options[:data] || {}
    classes = options[:classes] || "btn"

    t_classes = "#{classes}#{print ? ' hide-print' : ''}"

    @footer_content << (link_to name, link, class: t_classes, method: method, data: data).to_s
  end

  def return_or_default_path(default_path = root_path)
      session[:return_to].present? && session[:return_to] != request.fullpath ?
        session[:return_to] : default_path
  end

  def surpress_first(crumb)
    crumb.sub(/breadcrumb-item/,'breadcrumb-item d-none')
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
    bib.authors.includes([:authors_biblioentries]).each do |author|
      s += "#{author.first_name} #{author.last_name},"
    end
    s += "<em>#{bib.name}</em>,"
    s += " #{bib.publisher}," if bib.publisher.present?
    s += " #{bib.copyright_year}" if bib.copyright_year.present?
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

  def breadcrumb(book, story = nil, key_point = nil, scene = nil, section = nil, link: nil)
    str = ''
    tag.nav aria: { label: 'breadcrumb' } do
      tag.ol class: 'breadcrumb' do
        str = bc_book(book, story, link).to_s
        str += bc_story(story, book, link, key_point).to_s
        str += bc_key_point(key_point, scene, link).to_s
        str += bc_scene(scene, section, link).to_s if section.blank?
        str += bc_section(section, link).to_s
        str
      end
    end
  end

  def breadcrumb_page(title)
    tag.li(title, class: 'breadcrumb-item active', aria: { current: 'page' })
  end

  def breadcrumb_link(name, my_link, blank=false)
    if blank
      return tag.li class: 'breadcrumb-item' do
               link_to name, my_link, target: :_blank
             end
    else
      return tag.li class: 'breadcrumb-item' do
               link_to name, my_link
             end
    end
  end

  def bc_book(book, story, link)
    unless book.nil?
      if link.nil? && story.nil?
        breadcrumb_page(book.name)
      else
        breadcrumb_link(book.name, book_path(book), link)
      end
    end
  end

  def bc_story(story, book, link, key_point)
    unless story.nil?
      case story.class.name
      when 'Story'
        book ||= story.book
      when 'Chapter'
        book ||= story.scripted
      end
      if link.nil? && key_point.nil?
        breadcrumb_page(story.name)
      else
        breadcrumb_link(story.name, polymorphic_path(story), link)
      end
    end
  end


  def bc_key_point(key_point, scene, link)
    unless key_point.nil?
      if link.nil? && scene.nil?
        breadcrumb_page(key_point.name)
      else
        breadcrumb_link(key_point.name, key_point_path(key_point), link)
      end
    end
  end

  def bc_scene(scene, section, link)
    unless scene.nil?
      if link.nil? && section.nil?
        breadcrumb_page(scene.name)
      else
        breadcrumb_link(scene.name, scene_path(id: scene.id), link)
      end
    end
  end

  def bc_section(section, link)
    unless section.nil?
      if link.nil?
        breadcrumb_page(section.name)
      else
        breadcrumb_link(section.name, section_path(section), link)
      end
    end
  end

  def good_color
    '9FE2BF'
  end

  def okay_color
    '87CEFA'
  end

  def caution_color
    'DFFF00'
  end

  def bad_color
    'F08080'
  end

  def count_colors
    [ bad_color, caution_color, okay_color, good_color ]
  end

  def count_color(wc)
    (wc > 1000 ? good_color : ( wc > 650 ? okay_color : (wc > 250 ? caution_color : bad_color)))
  end

  def percent_color(wc)
    (wc >= 0.95 ? good_color : ( wc > 0.75 ? okay_color : (wc > 0.5 ? caution_color : bad_color)))
  end

  def wc_counts_info(obj)
    scene_count = obj.scene_count
    section_count = obj.section_count
    word_count = obj.word_count
    word_counts = obj.word_counts
    bt_count = word_counts.collect{|x| x > 1000 ? 1 : 0 }.sum
    bt_ratio = bt_count.zero? ? 0 : bt_count.to_f / word_counts.length
    g_count  = word_counts.collect{|x| x <= 1000 ? x > 650 ? 1 : 0 : 0 }.sum
    g_ratio = g_count.zero? ? 0 : g_count.to_f / word_counts.length
    o_count  = word_counts.collect{|x| x <= 650 ? x > 250 ? 1 : 0 : 0 }.sum
    o_ratio = o_count.zero? ? 0 : o_count.to_f / word_counts.length
    b_count  = word_counts.collect{|x| x <= 250 ? 1 : 0 }.sum
    b_ratio = b_count.zero? ? 0 : b_count.to_f / word_counts.length

    items = [{ label: 'Better', color: good_color, width:  100.0 * bt_ratio },
             { label: 'Good', color: okay_color, width: 100.0 * g_ratio },
             { label: 'Okay', color: caution_color, width: 100.0 * o_ratio },
             { label: 'Bad', color: bad_color, width:  100.0 * b_ratio }]

    return items
  end

  def physical_attributes(character)
    phy_pa  = CharacterCategory.where(name: 'Physical Appearance').first
    phy_gen = CharacterCategory.where(name: 'Gender').first
    phy_hc  = CharacterAttribute.where(character_category_id: phy_pa.id, name: 'Hair color').first
    phy_ec  = CharacterAttribute.where(character_category_id: phy_pa.id, name: 'Eye color').first
    phy_gen = CharacterAttribute.where(character_category_id: phy_gen.id, name: 'Gender').first
    hc      = CharacterValue.where(character_id: character.id, character_attribute_id: phy_hc).first
    ec      = CharacterValue.where(character_id: character.id, character_attribute_id: phy_ec).first
    gen     = CharacterValue.where(character_id: character.id, character_attribute_id: phy_gen).first

    "h: #{hc.nil? ? '' : hc.value[0..2]};e #{ec.nil? ? '' : ec.value[0..2]};g #{gen.nil? ? '' : gen.value[0..2]};"
  end
end
