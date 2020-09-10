#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'byebug'


Dir.glob('*.x').each do |file|
    next if [ 'book.x'].include?(file)
    @timeline_name = file.gsub(/.x/,'')
    dom = Nokogiri::XML(open(file))
    if dom.errors.length > 0
        puts file
        puts dom.errors
        debugger
        a = 1
    end
 end
