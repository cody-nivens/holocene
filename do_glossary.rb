#!/usr/bin/env ruby
#
require 'rubygems'
require 'nokogiri'
require 'byebug'

@glossarys = []

@title = ""
@firstname = ""
@surname = ""
@glossary = {:authors => []}

def init_vars
    @glossary = {:authors => [] }
end


def do_title(child)
  @glossary[:title] = child.children[0].text.gsub(/\n/," ")
end

def do_glosssee(child)
  @glossary[:see] = child[:otherterm]
end

def do_glossseealso(child)
  @glossary[:seealso] = child[:otherterm]
end

def do_glossdef(child)
    index1 = 0
    @glossary[:body] = ""
    while index1 < child.children.length do
      case child.children[index1].name
      when "para"
         @glossary[:body] += child.children[index1].text.gsub(/\n/," ")
      end
      index1 += 1
    end
end

def do_acronym(child)
  @glossary[:acronym] = child.children[0].text.gsub(/\n/," ")
end


def print_record
    puts "result = Glossary.create({:name => \"#{@glossary[:title]}\","
    puts "  :body => \"#{(@glossary[:body].nil? ? '' : @glossary[:body])}\"" 
    puts "  :see => \"#{(@glossary[:see].nil? ? "" : @glossary[:see])}\"" 
    puts "  :seealso => \"#{(@glossary[:seealso].nil? ? "" : @glossary[:seealso])}\"" 
    puts "  :acronym => \"#{(@glossary[:acronym].nil? ? "" : @glossary[:acronym])}\"" 
    puts "})"
    puts "debugger if result.errors.count > 0"
end


#["biblioglossarys.xml","biblioweb.xml"].each do |file|
["glossary.xml"].each do |file|
#["global_winter.xml"].each do |file|
@timeline_name = file.gsub(/.xml/,'')
dom = Nokogiri::XML(open(file))
doc = dom.children[0]

init_vars
@record_type = "glossary"
#debugger
dom.children[0].children.each do |child|
  next if child.name == "text"
  case child.name
  when "title"
    do_title(child)
  when "glossentry"
    init_vars
    index1 = 0
    while index1 < child.children.length do
      case child.children[index1].name 
      when "glossterm"
        do_title(child.children[index1])
      when "acronym"
        do_acronym(child.children[index1])
      when "glossdef"
        do_glossdef(child.children[index1])
      when "glosssee"
        do_glosssee(child.children[index1])
      when "glossseealso"
        do_glossseealso(child.children[index1])
      else
  #        puts "#{child.children[index1].name} not found"
      end
      index1 += 1
    end
    print_record
  end
end
end


