require 'csv'

if User.find_by_email('palo@alto.com').nil?
  @user = User.create!(email: 'palo@alto.com',
               password: '123456789',
               password_confirmation: '123456789')
  @user.add_role :admin
end


if EventType.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'holocene_event_types.csv'), headers: true) do |row|
    s = EventType.new
    s.name = row['name']
    s.user_id = @user.id
    s.save
  end
end

if Region.count == 0
  CSV.foreach(Rails.root.join('db', 'seeds', 'holocene_regions.csv'), headers: true) do |row|
    s = Region.new
    s.name = row['name']
    s.user_id = @user.id
    s.save
  end
end

Epoch.create({:name => "Before Common Era",:start_date => -15000, :end_date => 0,:user_id => @user.id})
Epoch.create({:name => "Common Era",:start_date => 1, :end_date => 2100,:user_id => @user.id})

@africa = Region.find_by_name("Africa")
@europe = Region.find_by_name("Europe")
@global = Region.find_by_name("Global")
@unknown = Region.find_by_name("Unknown")
@eurasia = Region.find_by_name("Eurasia")
@neareast = Region.find_by_name("Near East")
@fareast = Region.find_by_name("Far East")


@volcanic = EventType.find_by_name("Volcanic")
@climate = EventType.find_by_name("Climate")
@impact = EventType.find_by_name("Impact")
@cultural = EventType.find_by_name("Cultural")

@timeline = Timeline.create({:name => "Main",:description => "Main - contains all events", :user_id => @user.id})
@chapter1_timeline = Timeline.create({:name => "Domestication",:description => "Domestication events", :user_id => @user.id})
@chapter2_timeline = Timeline.create({:name => "Agriculture",:description => "Agriculture events", :user_id => @user.id})

@book = Book.create(:name => "Fun Events in History", :user_id => @user.id)
@author = Author.create(first_name: "Erggy", last_name: "Poincycle", user_id: @user.id)
@book.authors << @author

chapter_index = 0
