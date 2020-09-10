#!/usr/bin/env ruby
#
require 'rubygems'
require 'nokogiri'
require 'byebug'
require 'optparse'
require 'yaml'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: read_timeline.rb [options]"

  opts.on('-n', '--sourcename NAME', 'Source name') { |v| options[:source_name] = v }

end.parse!
 
dest_options = YAML.load_file("#{options[:source_name]}.yaml")
@source_files = dest_options['source_files']

@slugs = []

def random_slug(length=10)
  chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
  slug = ''
  length.times { slug << chars[rand(chars.size)] }
  @slugs << slug unless @slugs.include?(slug)
  return slug
end

@body = ""
@para_body = ""
@tags = []
@index_terms = []
@title = ""
@citations = []
@start_year = ""
@end_year = ""
@region = "global"
@url = ""
@partition = ""
@partition_body = ""
@aside = ""
@aside_body = ""
@image = ""
@event_types = ""
@start_year_uncert = ""
@record_type = "chapter"
@footnote_count = 0
@footnotes = []
@slug = random_slug
@update_flag = false
@lat = ''
@lng = ''
@show_events = true
@always_display_events = false 
@file_slug = ""

def init_vars
@body = ""
@para_body = ""
@tags = []
@index_terms = []
@title = ""
@citations = []
@start_year = ""
@end_year = ""
@region = "global"
@url = ""
@partition = ""
@partition_body = ""
@aside = ""
@aside_body = ""
@image = ""
@event_types = ""
@start_year_uncert = ""
@record_type = "event"
@footnote_count = 0
@footnotes = []
@slug = random_slug
@update_flag = false
@lat = ''
@lng = ''
@show_events = true
@always_display_events = false 
@file_slug = ""
end

def do_indexterm(child)
  index = 0
  while index < child.children.length do
   unless child.children[index].name == "secondary"
    tline = child.children[index].text.gsub(/,/,'')
    @index_terms << tline unless @index_terms.include?(tline)
    @tags << "#{tline.gsub(/ /,'')}" unless @tags.include?(tline)
   end
    index += 1
  end
end

def process_title(title)
  my_m = title.match('(\d*) (BC|AD) - (\d*) (BC|AD): (.*)')
  if !my_m.nil?
      @title = my_m[5]
      @start_year = (my_m[2] == 'BC' ? -my_m[1].to_i  : my_m[1])
      @end_year = (my_m[4] == 'BC' ? -my_m[3].to_i  : my_m[3])
  else
    my_m = title.match('(\d*) (BC|AD): (.*)')
    if my_m.nil?
      @record_type = "section" unless @record_type == "chapter"
      @title = title
    elsif my_m.length > 0
      @title = my_m[3]
      @start_year = (my_m[2] == 'BC' ? -my_m[1].to_i  : my_m[1])
    end
  end
end

def do_title(child)
  process_title(child.children[0].text.gsub(/\n/," "))
  index = 1
  while index < child.children.length do
    case child.children[index].name 
    when "citation"
      cit = "#{child.children[index].text.downcase}"
      @citations << cit unless @citations.include?(cit)
    when "indexterm"
      do_indexterm(child.children[index])
    end
    index += 1
  end
end

def do_para(child, top = true)
  index = 0
  @para_body = "" if top
  while index < child.children.length do
    case child.children[index].name
    when "text"
      @para_body += "#{child.children[index].text}"
    when "citation", "footnote"
      xreflabel = (child.children[index].attributes['xreflabel'].nil? ? nil : child.children[index].attributes['xreflabel'].value)
      footnote_text = child.children[index].text
      footnote_slug =  random_slug if @footnote_slug.nil?
      #cit = "#{child.children[index].text.downcase}"
      #@citations << cit if child.children[index].name == "citation" && !@citations.include?(cit)
      @para_body += "[[#{footnote_slug}]] "
      @footnotes << {:xreflabel => "#{(xreflabel.nil? ? '' : xreflabel)}", :slug => "#{footnote_slug}", :body => "#{footnote_text}"}
    when "ul"
        @para_body += "<ul>#{child.children[index].children.to_s}</ul>"
    when "ol"
        @para_body += "<ol>#{child.children[index].children.to_s}</ol>"
    when "dl"
        @para_body += "<dl>#{child.children[index].children.to_s}</dl>"
    when "table"
        @para_body += "<table>#{child.children[index].children.to_s}</table>"
    when "p"
        @para_body += "<p>"
        do_para(child.children[index], false)
        @para_body += "</p>"
    when "div"
        div_class = (child.children[index].attributes['class'].nil? ? nil : child.children[index].attributes['class'].value)
        @para_body += "<div#{(div_class.nil? ? "" : " class='#{div_class}'")}>#{child.children[index].children.to_s}</div>"
    when "br"
      @para_body += "<br/>"
    when "indexterm"
      do_indexterm(child.children[index])
      @para_body += "#{child.children[index].text}"
    else
      debugger
      a = 1
    end
    index += 1
  end
  @para_body.gsub!(/"/,"'")
end

def do_region(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @region = "#{child.children[index].text.downcase.gsub(/ /,'')}"
        @update_flag = true
    end
    index += 1
  end
end

def do_url(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @url = "#{child.children[index].text}"
    end
    index += 1
  end
end

def do_gis(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
        if child.name == 'lat'
	    @lat = "#{child.children[index].text.downcase.gsub(/ /,'')}"
        else
	    @lng = "#{child.children[index].text.downcase.gsub(/ /,'')}"
        end
    end
    index += 1
  end
end

def do_partition(child)
   child.children.each do |child|
      next if child.name == "text"
      case child.name
      when "name"
	    @partition = "#{child.children[0].text}"
      when "body"
        do_para(child)
      end
   end
   @partition_body = @para_body
   @para_body = ""
end

def do_aside(child)
   child.children.each do |child|
      next if child.name == "text"
      case child.name
      when "name"
	    @aside = "#{child.children[0].text}"
      when "body"
        do_para(child)
      end
   end
   @aside_body = @para_body
   @para_body = ""
end

def do_image(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @image = "#{child.children[index].text.gsub(/ /,'_')}"
    end
    index += 1
  end
end

def do_event_type(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @event_types += "@#{child.children[index].text.downcase},"
        @update_flag = true
    end
    index += 1
  end
  #@event_types.chop!
end

def do_start_year_uncert(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @start_year_uncert = "#{child.children[index].text.downcase}"
    end
    index += 1
  end
end

def do_show_events(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @show_events = "#{child.children[index].text.downcase}"
    end
    index += 1
  end
end

def do_always_display_events(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @always_display_events = "#{child.children[index].text.downcase}"
    end
    index += 1
  end
end

def event_type_from_tags
  event_types = []
  event_types << "#{@event_types}" unless @event_types == "" 

  str = ""
  event_types.each do |event|
      str += "#{event},"
  end
  str.chop!
  str.chop! unless (str =~ /,$/).nil?
  #debugger if str.include?("biblical")
  return str
end


def print_record(record_type)
    @body = @para_body
  case record_type
  when "event"
    puts "result = HoloceneEvent.where(:name => \"#{@title}\", :start_year => #{@start_year})"
    puts "if result.length == 0"
    puts "result = HoloceneEvent.create({:name => \"#{@title}\","
    puts ":end_year => \"#{@end_year}\","
    puts ":body => \"#{@body}\","
    puts ":tag_list => #{@tags},"
    puts ":event_types => [  #{event_type_from_tags} ] ,"
    puts ":region => @#{@region},"
    puts ":url => \"#{@url}\","
    puts ":user_id => @user.id,"
    puts ":slug => \"#{@slug}\","
    puts ":lat => \"#{@lat}\","
    puts ":lng => \"#{@lng}\","
    puts ":start_year_uncert => \"#{@start_year_uncert}\","
    puts ":start_year => \"#{@start_year}\""
    puts "})"
    puts "else"
    puts "if result[0].body ==\"\""
    puts "res = result[0].update_attributes({:name => \"#{@title}\","
    puts ":end_year => \"#{@end_year}\","
    puts ":body => \"#{@body}\","
    puts ":tag_list => #{@tags},"
    puts ":event_types => [ #{event_type_from_tags} ],"
    puts ":region => @#{@region},"
    puts ":slug => \"#{@slug}\","
    puts ":lat => \"#{@lat}\","
    puts ":lng => \"#{@lng}\","
    puts ":url => \"#{@url}\","
    puts ":user_id => @user.id,"
    puts ":start_year_uncert => \"#{@start_year_uncert}\","
    puts ":start_year => \"#{@start_year}\""
    puts "})"
    puts "debugger if res.nil?"
    puts "result = result[0]"
    puts "end"
    puts "end"
    puts "result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '#{@image}')), filename: '#{@image}', content_type: 'image/#{@image.strip.downcase[1..-1]}')" unless @image == ''
    puts "@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)"
    puts "@#{@timeline_name}_timeline.holocene_events << result unless @#{@timeline_name}_timeline.holocene_events.include?(result)"
    puts "@object.holocene_events << result"
  when "section"
    puts "result = Section.create({:name => \"#{@title}\","
    puts ":body => \"#{@body}\","
    puts ":slug => \"#{@slug}\","
    puts ":position => section_index,"
    puts ":display_name => true,"
    puts ":chapter_id => @chapter.id"
    puts "})"
    puts "@object = result"
    puts "section_index += 1"
  when "chapter"
    puts "result = Chapter.create({:name => \"#{@title}\","
    puts ":position =>chapter_index,"
    puts ":show_events => #{@show_events},"
    puts ":always_display_events => #{@always_display_events},"
    puts ":slug => \"#{@file_slug}\","
    puts ":book => @book,"
    puts ":body => \"#{@body}\""
    puts "})"
    unless @partition.nil? || @partition == ""
    puts "res = Partition.create({"
    puts ":name => \"#{@partition}\","
    puts ":body => \"#{@partition_body}\","
    puts ":chapter_id => result.id"
    puts "})"
    end
    unless @aside.nil? || @aside == ""
    puts "res = Aside.create({"
    puts ":name => \"#{@aside}\","
    puts ":body => \"#{@aside_body}\","
    puts ":chapter_id => result.id"
    puts "})"
    end
    puts "@object = result"
    puts "@chapter = result"
    puts "chapter_index += 1"
    puts "section_index = 0"
  end
  @index_terms.each do |term|
    puts "rsl = GlossaryTerm.where(:name => \"#{term}\")" 
    puts "if rsl.length == 0"
    puts "rsl = GlossaryTerm.create({:name => \"#{term}\","
    puts ":user_id => @user.id,"
    puts ":book => @book"
    puts " })"
    puts "end"

  end

  unless @citations.nil?
    #debugger if record_type == "chapter"
  @citations.each do |cit|
      puts "biblio = Biblioentry.find_by_xreflabel(\"#{cit}\")"
      puts "rt = result.footnotes.where(slug: \"\", biblioentry_id: biblio.id)"
      puts "Footnote.create(:slug => \"\", :body => \"\", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0"
  end
  end

  if ["event", "section", "chapter"].include?(record_type)
    @footnotes.each do |footnote|
      if footnote[:xreflabel].nil? || footnote[:xreflabel] == ''
        puts "biblio = nil"
      else
        puts "biblio = Biblioentry.find_by_xreflabel(\"#{footnote[:xreflabel]}\")"
      end
      puts "Footnote.create(:slug => \"#{footnote[:slug]}\", :body => \"#{footnote[:body]}\", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)"
    end
  end
end

def do_section(child)
    print_record(@record_type)
  
    init_vars
    index1 = 0
    while index1 < child.children.length do
      case child.children[index1].name 
      when "name"
        do_title(child.children[index1])
      when "body"
        do_para(child.children[index1])
      when "holocene_event"
          do_holocene_event(child.children[index1])
      end
      index1 += 1
    end
end

def do_holocene_event(child)
    print_record(@record_type)
  
    init_vars
    index1 = 0
    while index1 < child.children.length do
      case child.children[index1].name 
      when "name"
        do_title(child.children[index1])
      when "body"
        do_para(child.children[index1])
      when "region"
        do_region(child.children[index1])
      when "image"
        do_image(child.children[index1])
      when "url"
        do_url(child.children[index1])
      when "lat","lng"
        do_gis(child.children[index1])
      when "event_type"
        do_event_type(child.children[index1])
      when "start_year_uncert"
        do_start_year_uncert(child.children[index1])
      end
      index1 += 1
    end
end

@source_files.each do |file|
    @timeline_name = file.gsub(/.xml/,'').gsub("#{options[:source_name]}/","")
dom = Nokogiri::XML(open(file))

doc = dom.children[0]
debugger if dom.errors.length > 0
#debugger if file == "cody_book/bronze_age.xml"

init_vars

@file_slug = File.basename(file, ".*")
@record_type = "chapter"
dom.children[0].children.each do |child|
  next if child.name == "text"
  case child.name
  when "name"
    do_title(child)
  when "body"
    do_para(child)
  when "partition"
    do_partition(child)
  when "aside"
    do_aside(child)
  when "section"
      do_section(child)
  when "holocene_event"
      do_holocene_event(child)
  when "show_events"
    do_show_events(child)
  when "always_display_events"
    do_always_display_events(child)
  end
end
      print_record(@record_type)
end

