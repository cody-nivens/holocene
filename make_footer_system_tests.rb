include ActionView::Helpers
include ActionDispatch::Routing
include Rails.application.routes.url_helpers

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

controllers = %w[
artifacts artifact_types asides authors biblioentries books chapters character_attributes character_categories character_scenes characters character_values citations cities epochs event_types footnotes glossary_terms holocene_events itineraries key_points key_words partitions regions scenes sections signets stories timelines tours welcome
]
single_var = nil
plural_var =  nil
klass =  nil
pklass =  nil
view = nil
method = nil

def render_template
dir = "test"
Dir.mkdir(dir) unless Dir.exists?(dir)

files.each do |file|
  model, view = file.split('/')
  method, rest = view.split("\.")

  klass = model.camelcase
  pklass = klass.pluralize
  single_var = klass.underscore.singularize
  plural_var = pklass.underscore
  dir = "test/views/#{plural_var}"
  Dir.mkdir(dir) unless Dir.exists?(dir)

# Produce result.
  index_message = ERB.new(index_template, trim_mode: '%<>')
  results = index_message.result
  File.write("test/views/#{plural_var}/#{view}_test.rb", results)
  puts results
end
end
#ApplicationController.allow_forgery_protection = false
s = ActionDispatch::Integration::Session.new(Rails.application)
#s.post('/login', user: {login: 'admin', password: 'password'})
#s.get('/my')
#puts s.response.body"

connecting_models = {
'artifacts' => 'book',
'asides' => 'chapter',
'authors' => 'book',
'biblioentries' => 'book',
'chapters' => 'book',
'character_attributes' => 'character_category',
'characters' => 'story',
'character_values' => 'character',
'footnotes' => 'chapter',
'itineraries' => 'tour',
'partitions' => 'chapter',
'key_points' => 'book',
'scenes' => 'book',
'sections' => 'chapter',
'signets' => 'book',
'stories' => 'book',
'glossary_terms' => 'book',
'tours' => 'story',
'artifact_types' => 'book',
'values' => 'character_character',
'key_words' => 'book'
}
items = {}

controllers.each do |controller|
#['welcome'].each do |controller|
  if items[controller].nil?
    items[controller] = {}
  end
  puts "#{controller}_footers.txt"
  File.readlines("#{controller}_footers.txt", chomp: true).each do |line|
    if (m = line.match Regexp.new("app\/views\/#{controller}\/(.*).html.erb:\\s*<% @footer_content << \\(link_to '(.*)', (.*), class: .*\\).to_s %>"))
      if items[controller][m[1]].nil?
        items[controller][m[1]] = {}
      end
      items[controller][m[1]][m[2]] = m[3]
    end
  end
end
items.keys.sort.each do |controller|
  items[controller].keys.sort.each do |action|
      print "  test '#{controller} #{action}' do\n"
    items[controller][action].keys.sort.each do |link|
      next if link == 'Back'

      controlling_model = connecting_models[controller]
      path = items[controller][action][link]

      controlling_model = connecting_models[controller]
      print "#    visit "
      print link
      print "\n"
      print "    assert_text '#{link}'\n"
      print "    click_on '#{link}'\n"
      print "    assert_current_path "
      print path
      print "\n"
      print "    click 'Back'\n"
      print "    assert_current_path "
      print action
      print "\n"
    end
      print "  end\n\n"
  end
end
