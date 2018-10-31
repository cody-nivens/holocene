#!/usr/bin/env ruby
#
require 'nokogiri'

page = Nokogiri::XML(open("timeline.xml"))
puts page.class   # => Nokogiri::HTML::Document
