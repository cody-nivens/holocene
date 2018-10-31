#!/usr/bin/env ruby
#
require 'rubygems'
require 'nokogiri'
require 'byebug'

@body = ""
@tags = []
@title = ""
@citation = []
@start_year = ""
@end_year = ""
@region = "global"
@url = ""
@image = ""
@event_type = ""
@start_year_uncert = ""
@record_type = "chapter"

def init_vars
@body = ""
@tags = []
@title = ""
@citation = []
@start_year = ""
@end_year = ""
@region = "global"
@url = ""
@image = ""
@event_type = ""
@start_year_uncert = ""
@record_type = "event"
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
	    @citation << "@#{child.children[index].text.downcase}"
    when "indexterm"
      do_indexterm(child.children[index])
    end
    index += 1
  end
end

def do_para(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
      @body += "<p>#{child.children[index].text}</p>"
    end
    index += 1
  end
end

def do_region(child)
  index = 0
  while index < child.children.length do
    if child.children[index].name == "text"
	    @region = "#{child.children[index].text.downcase.gsub(/ /,'')}"
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
	return "@#{@event_type}" if @event_type != ""
  return "@volcanic" if @tags.include?("Eruption")
  return "@impact" if @tags.include?("ImpactEvent")
  return "@cultural" if @tags.include?("Historical")
  return "@cultural" if @tags.include?("Famine")
  return "@cultural" if @tags.include?("Epidemic")
  return "@cultural" if @tags.include?("BiblicalEvent")
  return "@climatic" if @tags.include?("BondEvent")
  return "@climatic" if @tags.include?("TreeRingEvent")
  return "@cultural"
end


def citation_to_var(citations)
  s = "[ "
  citations.each do |cit|
    s += "#{cit},"
  end
  return "#{s.chop}]"
end

def print_record(record_type)
  case record_type
  when "event"
    puts "result = HoloceneEvent.create({:name => \"#{@title}\","
    puts ":end_year => \"#{@end_year}\","
    puts ":body => \"#{@body}\","
    puts ":tag_list => #{@tags},"
    puts ":event_type => #{event_type_from_tags},"
    puts ":citations => #{citation_to_var(@citation)},"
    puts ":region => @#{@region},"
    puts ":image => \"#{@image}\","
    puts ":url => \"#{@url}\","
    puts ":start_year_uncert => \"#{@start_year_uncert}\","
    puts ":start_year => \"#{@start_year}\""
    puts "})"
    puts "debugger if result.errors.count > 0"
    puts "@timeline.holocene_events << result"
    puts "@#{@timeline_name}_timeline.holocene_events << result"
    puts "@chapter.holocene_events << result"
  when "section"
    puts "result = Section.create({:name => \"#{@title}\","
    puts ":body => \"#{@body}\","
    puts ":chapter_id => @chapter.id"
    puts "})"
  when "chapter"
    puts "@chapter = Chapter.create({:name => \"#{@title}\","
    puts ":body => \"#{@body}\""
    puts "})"
  end
  end
["preface.xml","introduction.xml","global_winter.xml", "arthur.xml", "cultural.xml", "first_plague.xml", "crisis_3rd_century.xml", "genesis.xml", "timeline.xml"].each do |file|
#["timeline.xml"].each do |file|
#["global_winter.xml"].each do |file|
@timeline_name = file.gsub(/.xml/,'')
dom = Nokogiri::XML(open(file))
doc = dom.children[0]
#debugger if file == "cultural.xml"

init_vars
@record_type = "chapter"
dom.children[0].children.each do |child|
  next if child.name == "text"
  case child.name
  when "title"
    do_title(child)
  when "para"
    do_para(child)
  when "section"
    print_record("chapter") if @record_type == "chapter"  
  
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
      when "event_type"
        do_event_type(child.children[index1])
      when "start_year_uncert"
        do_start_year_uncert(child.children[index1])
      end
      index1 += 1
    end
    print_record(@record_type)
  end


end
    print_record("chapter") if @record_type == "chapter"  
end


