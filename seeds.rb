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

if 1 == 0
if HoloceneEvent.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'holocene_events.csv'), headers: true) do |row|
    holocene_event = HoloceneEvent.new
    holocene_event.name = row['name']
    holocene_event.start_year = row['start_year'].to_i
    holocene_event.end_year = row['end_year'].to_i
    holocene_event.start_year_uncert = row['start_year_uncert'].to_i
    holocene_event.start_year_mod = row['start_year_mod'].to_i
    holocene_event.end_year_uncert = row['end_year_uncert'].to_i
    holocene_event.end_year_mod = row['end_year_mod'].to_i
    holocene_event.event_type_id = EventType.find_by_name(row['event_type']).id
    holocene_event.body = row['body']
    if row['region'] == ""
       holocene_event.region_id =  Region.find_by_name('Unknown').id
    else
       holocene_event.region_id =  Region.find_by_name(row['region']).id
    end
    holocene_event.save
  end
end
end
