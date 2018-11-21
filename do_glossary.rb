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
@source_files = dest_options['glossary']

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
    puts "term = GlossaryTerm.find_or_create_by(name: \"#{@glossary[:title]}\")"
    puts "term.update_attributes({"
    puts "  :book => @book,"
    puts "  :user => @user,"
    puts "  :body => \"#{(@glossary[:body].nil? ? '' : @glossary[:body])}\"," 
    puts "  :see => #{(@glossary[:see].nil? ? 'nil' : "GlossaryTerm.find_or_create_by(name: \"#{@glossary[:see]}\")")}," 
    puts "  :seealso => #{(@glossary[:seealso].nil? ? 'nil' : "GlossaryTerm.find_or_create_by(name: \"#{@glossary[:seealso]}\")")},"
    puts "  :acronym => #{(@glossary[:acronym].nil? ? 'nil' : "GlossaryTerm.find_or_create_by(name: \"#{@glossary[:acronym]}\")")}" 
    puts "})"
    puts "debugger if term.errors.count > 0"
end


#["biblioglossarys.xml","biblioweb.xml"].each do |file|
@source_files.each do |file|
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


