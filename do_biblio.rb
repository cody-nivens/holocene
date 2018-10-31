#!/usr/bin/env ruby
#
require 'rubygems'
require 'nokogiri'
require 'byebug'

@books = []

@title = ""
@firstname = ""
@surname = ""
@book = {:authors => []}

def init_vars
    @book = {:authors => [] }
end


def process_title(title)
end

def do_title(child)
  @book[:title] = child.children[0].text.gsub(/\n/," ")
end

def do_author(child)
  index = 0
  firstname = nil
  surname = nil
  while index < child.children.length do
      case child.children[index].name
      when 'firstname'
          firstname = child.children[index].text
      when 'surname'
          surname = child.children[index].text
      end
      index += 1
  end
  unless firstname.nil?
      @book[:authors] << {:firstname => firstname, :surname => surname}
  end
end

def do_authors(child)
  index = 0
  firstname = nil
  surname = nil
  while index < child.children.length do
      case child.children[index].name
      when "personname"
          do_author(child.children[index])
      end
      index += 1
  end
end

def do_authorgroup(child)
  index = 0
  while index < child.children.length do
    case child.children[index].name
    when "author"
      do_authors(child.children[index])
    end
    index += 1
  end
end

def do_copyright(child)
  index = 0
  year = nil
  holder = nil
  while index < child.children.length do
      case child.children[index].name
      when 'year'
          year = child.children[index].text
      when 'holder'
          holder = child.children[index].text
      end
      index += 1
  end
  unless year.nil?
      @book[:copyright] = {:year => year, :holder => holder}
  end
end

def do_publisher(child)
    @book[:publisher] = child.text
end

def print_record
    puts "result = Biblioentry.create({:name => \"#{@book[:title]}\","
    puts "  :xreflabel => \"#{@book[:xreflabel]}\","
    puts "  :copyright_year => \"#{@book[:copyright][:year]}\"," unless @book[:copyright].nil?
    puts "  :copyright_holder => \"#{@book[:copyright][:holder]}\"," unless @book[:copyright].nil?
    puts "  :publisher => \"#{@book[:publisher]}\""
    puts "})"
    puts "debugger if result.errors.count > 0"
    puts "#{@book[:authors]}.each do |name_info|"
    puts "  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])"
    puts "  if authors.length == 0"
    puts "    author = Author.create(:first_name => name_info[:firstname],"
    puts "                           :last_name => name_info[:surname])"
    puts "  else"
    puts "    author = authors[0]"
    puts "  end"
    puts "  result.authors << author"
    puts "end"
end


["bibliobooks.xml"].each do |file|
#["global_winter.xml"].each do |file|
@timeline_name = file.gsub(/.xml/,'')
dom = Nokogiri::XML(open(file))
doc = dom.children[0]

init_vars
@record_type = "chapter"
dom.children[0].children.each do |child|
  next if child.name == "text"
  case child.name
  when "title"
    do_title(child)
  when "biblioentry"
    init_vars
     @book[:xreflabel] = child.attributes['xreflabel'].value
    index1 = 0
    while index1 < child.children.length do
      case child.children[index1].name 
      when "title"
        do_title(child.children[index1])
      when "authorgroup"
        do_authorgroup(child.children[index1])
      when "copyright"
        do_copyright(child.children[index1])
      when "publisher"
        do_publisher(child.children[index1])
      end
      index1 += 1
    end
    print_record
  end
end
end


