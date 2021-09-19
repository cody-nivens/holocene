require "erb"
require 'active_support/core_ext/string'
require 'byebug'

# Create template.
index_template = %q{require 'test_helper'

class <%= pklass %><%= method.camelcase %>HtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @<%= single_var %>= <%= plural_var %>(:<%= single_var %>_1)
    @book = @<%= single_var %>.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get <%= method %>' do
    get book_<%= plural_var %>_<%= method %>_url(:book_id => @book.id)

    assert_response 200
    @<%= plural_var %> = <%= klass %>.all

    assert_template '<%= plural_var %>/<%= method %>'

    assert_select 'h1','<%= method.camelcase %>'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
}

# Set up template data.
files = %w[
application/about.html.erb application/contact.html.erb application/faq.html.erb artifacts/tagged.html.erb authors/list.html.erb books/export.html.erb books/stats.html.erb books/sync_scenes.html.erb books/timeline.html.erb books/toc.html.erb characters/lineage.html.erb characters/list.html.erb character/steps/attributes.html.erb character/steps/characteristics.html.erb character/steps/identity.html.erb character/steps/update.html.erb cities/itinerary.html.erb epochs/geo_map.html.erb footnotes/section.html.erb holocene_events/chapters.html.erb holocene_events/display.html.erb holocene_events/geo_map.html.erb holocene_events/tagged.html.erb key_points/list.html.erb key_points/move.html.erb layouts/application.html.erb layouts/mailer.html.erb pages/about.html.erb scenes/move.html.erb sections/footnotes.html.erb sections/geo_map.html.erb stories/timeline.html.erb tours/geo_map.html.erb welcome/stats.html.erb welcome/tags.html.erb
]

single_var = nil
plural_var =  nil
klass =  nil
pklass =  nil
view = nil
method = nil

dir = "test"
Dir.mkdir(dir) unless Dir.exists?(dir)

files.each do |file|
  model, view = file.split("/")
  method, rest = view.split("\.")

  klass = model.camelcase
  pklass = klass.pluralize
  single_var = klass.underscore.singularize
  plural_var = pklass.underscore
  dir = "test/views/#{plural_var}"
  Dir.mkdir(dir) unless Dir.exists?(dir)

# Produce result.
  index_message = ERB.new(index_template, trim_mode: "%<>")
  results = index_message.result
  File.write("test/views/#{plural_var}/#{view}_test.rb", results)
  puts results
end
