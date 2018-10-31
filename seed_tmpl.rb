# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

if EventType.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'holocene_event_types.csv'), headers: true) do |row|
    s = EventType.new
    s.name = row['name']
    s.save
  end
end

if Region.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'holocene_regions.csv'), headers: true) do |row|
    s = Region.new
    s.name = row['name']
    s.save
  end
end

@africa = Region.find_by_name("Africa")
@australasia = Region.find_by_name("Australasia")
@centralasia = Region.find_by_name("Central Asia")
@centralamerica = Region.find_by_name("Central America")
@eastasia = Region.find_by_name("East Asia")
@eurasia = Region.find_by_name("Eurasia")
@europe = Region.find_by_name("Europe")
@global = Region.find_by_name("Global")
@icelandandarcticocean = Region.find_by_name("Iceland and Arctic Ocean")
@indianocean = Region.find_by_name("Indian Ocean")
@middleeast = Region.find_by_name("Middle East")
@neareast = Region.find_by_name("Near East")
@northamerica = Region.find_by_name("North America")
@southamerica = Region.find_by_name("South America")
@southeastasia = Region.find_by_name("Southeast Asia")
@unknown = Region.find_by_name("Unknown")


Citation.create(:name => "HoloceneEruptions")
@holoceneeruptions = Citation.find_by_name("HoloceneEruptions")
@holoceneeruption = @holoceneeruptions
Citation.create(:name => "AnnalesUlster")
@annalesulster = Citation.find_by_name("AnnalesUlster")
Citation.create(:name => "Baillie1999")
@baillie1999 = Citation.find_by_name("Baillie1999")
Citation.create(:name => "OlympiaEarthquake")
@olympiaearthquake = Citation.find_by_name("OlympiaEarthquake")
Citation.create(:name => "cantor2001")
@cantor2001 = Citation.find_by_name("cantor2001")
Citation.create(:name => "ziegler1969")
@ziegler1969 = Citation.find_by_name("ziegler1969")

@volcanic = EventType.find_by_name("Volcanic")
@impact = EventType.find_by_name("Impact")
@cultural = EventType.find_by_name("Cultural")
@climatic = EventType.find_by_name("Climate")
@earth = EventType.find_by_name("Earth")
@epidemic = EventType.find_by_name("Epidemic")

@timeline = Timeline.create({:name => "Main",:description => "Main timeline.  Should contain all events"})
@arthur_timeline = Timeline.create({:name => "Arthur & Second Plague",:description => "Timeline for events from 500 to 601 AD."})
@genesis_timeline = Timeline.create({:name => "Bible Events",:description => "Timeline of Biblical Events."})
@crisis_3rd_century_timeline = Timeline.create({:name => "Crisis of the 3rd century",:description => "Timeline of Events in the 3rd century relating to Rome."})
@cultural_timeline = Timeline.create({:name => "Cultural",:description => "Timeline of Cultural Events."})
@first_plague_timeline = Timeline.create({:name => "First Plague",:description => "Timeline of Events surrounding the first appearence of the Bubonic Plague."})
@timeline_timeline = Timeline.create({:name => "Timeline",:description => "Timeline of Earth related events."})

