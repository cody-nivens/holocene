#!/bin/env ruby
ENV['RAILS_ENV'] = "test" # Set to your desired Rails environment name
require '/home/codynivens/devel/holocene/config/environment.rb'
include Rails.application.routes.url_helpers
require 'action_view'
include ActionView::Helpers::TextHelper
require '/home/codynivens/devel/holocene/app/helpers/application_helper.rb'
include ApplicationHelper
include ActionView::Helpers::UrlHelper
require "font_awesome5/rails/icon_helper"
include FontAwesome5::Rails::IconHelper

TEMPLATE_FILE="_nav_links.html.erb"
file = File.read(TEMPLATE_FILE)
session = {}
  #@chapter = chapters(:chapter_1)
#  @chapter = Chapter.first
#  @book = @chapter.scripted
@story = Story.first
@book = @story.book
@stage = Stage.first
render = ERB.new(file)
#puts render.result
doc = Nokogiri::HTML(render.result)
tops = doc.xpath("//li/a[contains(@class,'dropdown-toggle')]")
s = "  @menu_items = { "
tops.each do |master|
  s += " '#{master.text}' = ["
  sub_actions = doc.xpath("//li/a[text()='#{master.text}']/../ul/li/a")
  sub_actions.each do |sa|
    s += "'#{sa.text}',"
  end
  s = s.chop
  s += "],"
end
s = s.chop
s += "}"
puts s
  #byebug
  #a = 1
