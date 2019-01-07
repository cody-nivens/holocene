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
@title = ""
@citations = []
@start_year = ""
@end_year = ""
@region = "global"
@url = ""
@partition = ""
@partition_body = ""
@image = ""
@event_type = ""
@start_year_uncert = ""
@record_type = "chapter"
@footnote_count = 0
@footnotes = []
@slug = random_slug
@update_flag = false
@lat = ''
@lng = ''

def init_vars
@body = ""
@para_body = ""
@tags = []
@title = ""
@citations = []
@start_year = ""
@end_year = ""
@region = "global"
@url = ""
@partition = ""
@partition_body = ""
@image = ""
@event_type = ""
@start_year_uncert = ""
@record_type = "event"
@footnote_count = 0
@footnotes = []
@slug = random_slug
@update_flag = false
@lat = ''
@lng = ''
end

def do_indexterm(child)
  index = 0
  while index < child.children.length do
   unless child.children[index].name == "secondary"
    tline = child.children[index].text.gsub(/,/,'')
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
	    @citations << "#{child.children[index].text.downcase}"
    when "indexterm"
      do_indexterm(child.children[index])
    end
    index += 1
  end
end

def do_para(child)
  index = 0
  @para_body += "<p>"
  while index < child.children.length do
    case child.children[index].name
    when "text"
      @para_body += "#{child.children[index].text}"
    when "footnote"
      xreflabel = (child.children[index].attributes['xreflabel'].nil? ? nil : child.children[index].attributes['xreflabel'].value)
      footnote_text = child.children[index].text
      footnote_slug =  random_slug if @footnote_slug.nil?
      @para_body += "[[#{footnote_slug}]]"
      @footnotes << {:xreflabel => "#{(xreflabel.nil? ? '' : xreflabel)}", :slug => "#{footnote_slug}", :body => "#{footnote_text}"}
    when "ul"
        @para_body += "<ul>#{child.children[index].children.to_s}</ul>"
    when "div"
        div_class = (child.children[index].attributes['class'].nil? ? nil : child.children[index].attributes['class'].value)
        @para_body += "<div#{(div_class.nil? ? "" : " class='#{div_class}'")}>#{child.children[index].children.to_s}</div>"
    end
    index += 1
  end
  @para_body += "</p>"
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
	    @url = "#{child.children[index].text.downcase.gsub(/ /,'')}"
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
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @partition = "#{child.children[index].text}"
    end
    index += 1
  end
end

def do_partition_body(child)
   child.children.each do |child|
      next if child.name == "text"
      case child.name
      when "title"
        do_title(child)
      when "para"
        do_para(child)
      end
   end
end

def do_image(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @image = "#{child.children[index].text.downcase.gsub(/ /,'')}"
    end
    index += 1
  end
end

def do_event_type(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @event_type = "#{child.children[index].text.downcase}"
        @update_flag = true
    end
    index += 1
  end
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

def event_type_from_tags
  event_types = []
  event_types << "@#{@event_type}" unless @event_type == "" 
  event_types << "@volcanic" if @tags.include?("Eruption") && !event_types.include?("@volcanic")
  event_types << "@impact" if @tags.include?("ImpactEvent") && !event_types.include?("@impact")
  event_types << "@epidemic" if @tags.include?("Epidemic") && !event_types.include?("@epidemic")
  event_types << "@climate" if @tags.include?("BondEvent") && !event_types.include?("@climate")
  event_types << "@climate" if @tags.include?("TreeRingEvent") && !event_types.include?("@climate")
  event_types << "@cultural" if @tags.include?("Famine") && !event_types.include?("@cultural")
  event_types << "@cultural" if @tags.include?("BiblicalEvent") && !event_types.include?("@cultural")
  event_types << "@cultural" if @tags.include?("Historical") && !event_types.include?("@cultural")
  event_types << "@cultural" if event_types.length  == 0

  str = ""
  event_types.each do |event|
      str += "#{event},"
  end
  return str.gsub(/,$/,'')
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
    puts ":image => \"#{@image}\","
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
    puts ":image => \"#{@image}\","
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
    puts ":slug => \"#{@slug}\","
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
    puts "@object = result"
    puts "@chapter = result"
    puts "chapter_index += 1"
    puts "section_index = 0"
  end
  unless @citations.nil?
  @citations.each do |cit|
      puts "biblio = Biblioentry.find_by_xreflabel(\"#{cit}\")"
      puts "Footnote.create(:slug => \"\", :body => \"\", :noted => result,:biblioentry_id => biblio.id)"
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
      when "title"
        do_title(child.children[index1])
      when "para"
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
      when "section"
          do_section(child.children[index1])
      end
      index1 += 1
    end
end

@source_files.each do |file|
    @timeline_name = file.gsub(/.xml/,'').gsub("#{options[:source_name]}/","")
dom = Nokogiri::XML(open(file))

doc = dom.children[0]
debugger if dom.errors.length > 0
#debugger if file == "bronze_age.xml"

init_vars
@record_type = "chapter"
dom.children[0].children.each do |child|
  next if child.name == "text"
  case child.name
  when "title"
    do_title(child)
  when "para"
    do_para(child)
  when "partition"
    do_partition(child)
  when "partition_body"
    do_partition_body(child)
    @partition_body = @para_body
    @para_body = ""
  when "section"
      do_section(child)
  end
end
      print_record(@record_type)
end


