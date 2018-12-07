require 'csv'

@user = User.find_by_email('palo@alto.com')
if @user.nil?
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

    Epoch.create({:name => "Roman Republic",:start_date => -509, :end_date => -27,:user_id => @user.id})
    Epoch.create({:name => "Roman Empire",:start_date => -27, :end_date => 395,:user_id => @user.id})
    Epoch.create({:name => "Western Roman Empire",:start_date => 395, :end_date => 480,:user_id => @user.id})
    Epoch.create({:name => "Eastern Roman Empire",:start_date => 395, :end_date => 1453,:user_id => @user.id})
    Epoch.create({:name => "Bronze Age",:start_date => -3300, :end_date => -1200,:user_id => @user.id})
    Epoch.create({:name => "Early Bronze Age",:start_date => -3300, :end_date => -2100,:user_id => @user.id})
    Epoch.create({:name => "Middle Bronze Age",:start_date => -2100, :end_date => -1550,:user_id => @user.id})
    Epoch.create({:name => "Late Bronze Age",:start_date => -1550, :end_date => -1200,:user_id => @user.id})
    Epoch.create({:name => "Iron Age",:start_date => -1200, :end_date => -550,:user_id => @user.id})

    Epoch.create({:name => "Egypt: Early Dynatstic Period",:start_date => -3150, :end_date => -2686,:user_id => @user.id})
    Epoch.create({:name => "Egypt: Old Kingdom",:start_date => -2686, :end_date => -2181,:user_id => @user.id})
    Epoch.create({:name => "Egypt: 1st Intermediate Period",:start_date => -2181, :end_date => -2055,:user_id => @user.id})
    Epoch.create({:name => "Egypt: Middle Kingdom",:start_date => -2055, :end_date => -1650,:user_id => @user.id})
    Epoch.create({:name => "Egypt: 2nd Intermediate Period",:start_date => -1650, :end_date => -1550,:user_id => @user.id})
    Epoch.create({:name => "Egypt: New Kingdom",:start_date => -1550, :end_date => -1069,:user_id => @user.id})
    Epoch.create({:name => "Egypt: 3rd Intermediate Period",:start_date => -1069, :end_date => -744,:user_id => @user.id})
    Epoch.create({:name => "Egypt: Kushite Egypt",:start_date => -744, :end_date => -656,:user_id => @user.id})
    Epoch.create({:name => "Egypt: Twenty-sixth Dynasty of Egypt",:start_date => -664, :end_date => -525,:user_id => @user.id})

@africa = Region.find_by_name("Africa")
@australasia = Region.find_by_name("Australasia")
@centralasia = Region.find_by_name("Central Asia")
@centralamerica = Region.find_by_name("Central America")
@eastasia = Region.find_by_name("East Asia")
@eurasia = Region.find_by_name("Eurasia")
@europe = Region.find_by_name("Europe")
@global = Region.find_by_name("Global")
@fareast = Region.find_by_name("Far East")
@icelandandarcticocean = Region.find_by_name("Iceland and Arctic Ocean")
@indianocean = Region.find_by_name("Indian Ocean")
@middleeast = Region.find_by_name("Middle East")
@neareast = Region.find_by_name("Near East")
@northamerica = Region.find_by_name("North America")
@southamerica = Region.find_by_name("South America")
@southeastasia = Region.find_by_name("Southeast Asia")
@unknown = Region.find_by_name("Unknown")


@volcanic = EventType.find_by_name("Volcanic")
@impact = EventType.find_by_name("Impact")
@cultural = EventType.find_by_name("Cultural")
@climate = EventType.find_by_name("Climate")
@climatic = EventType.find_by_name("Climate")
@earth = EventType.find_by_name("Earth")
@epidemic = EventType.find_by_name("Epidemic")

@timeline = Timeline.create({:name => "Main",:description => "Main - contains all events", :user_id => @user.id})
@arthur_timeline = Timeline.create({:name => "Arthur & Second Plague",:description => "Events from 500 to 601 AD.", :user_id => @user.id})
@genesis_timeline = Timeline.create({:name => "Bible Events",:description => "Biblical Events.", :user_id => @user.id})
@crisis_3rd_century_timeline = Timeline.create({:name => "Crisis of the 3rd century",:description => "Events in the 3rd century relating to Rome.", :user_id => @user.id})
@cultural_timeline = Timeline.create({:name => "Cultural",:description => "Cultural Events.", :user_id => @user.id})
@first_plague_timeline = Timeline.create({:name => "First Plague",:description => "Events surrounding the first appearence of the Bubonic Plague.", :user_id => @user.id})
@little_ice_age_timeline = Timeline.create({:name => "Little Ice Age",:description => "Little Ice Age related events.", :user_id => @user.id})
@timeline_timeline = Timeline.create({:name => "Earth Events Timeline",:description => "Earth related events.", :user_id => @user.id})
@babylon_flood_timeline = Timeline.create({:name => "Babylon flood",:description => "Events related to floods.", :user_id => @user.id})
@global_winter_timeline = Timeline.create({:name => "Global Winter",:description => "Global winter events.", :user_id => @user.id})
@climate_factors_timeline = Timeline.create({:name => "Climate Factors",:description => "Factors affecting climate.", :user_id => @user.id})
@bronze_age_timeline = Timeline.create({:name => "Broze Age Collapse",:description => "Factors affecting the collapse of the late Bronze age.", :user_id => @user.id})

@book = Book.create(:name => "Climate and History", :user_id => @user.id)
@author = Author.create(first_name: "Cody", last_name: "Nivens", user_id: @user.id)
@book.authors << @author

chapter_index = 0
result = Biblioentry.create({:name => "Exodus to Arthur: Catastrophic encounters with comets",
  :xreflabel => "baillie1999",
  :copyright_year => "1999, 2000, 2001",
  :copyright_holder => "Mike Baillie",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "B. T. Batsford Ltd"
})
debugger if result.errors.count > 0
[{:firstname=>"Mike", :surname=>"Baillie"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The History of the Ancient World: from the earliest accounts to the fall of Rome",
  :xreflabel => "bauer2007",
  :copyright_year => "2007",
  :copyright_holder => "W. W. Norton & Co.",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Susan Wise", :surname=>"Bauer"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "In the wake of the Plague: The Black Death & the world it made",
  :xreflabel => "cantor2001",
  :copyright_year => "2001",
  :copyright_holder => "Pernnial Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Norman F.", :surname=>"Cantor"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Floods, Famines, and Emperors; El Nino and the fate of civilizations",
  :xreflabel => "fagan1999",
  :copyright_year => "1999,2009",
  :copyright_holder => "Basic Books",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Little Ice Age: How climate made history",
  :xreflabel => "fagan2000",
  :copyright_year => "2000",
  :copyright_holder => "Basic Books",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Long Summer: how climate changed civilization",
  :xreflabel => "fagan2004",
  :copyright_year => "2004",
  :copyright_holder => "Basic Books",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Great Warming: climate change and the rise and fall of civilizations",
  :xreflabel => "fagan2008",
  :copyright_year => "2008",
  :copyright_holder => "Bloomsbury Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Underworld: the mysterious origins of civilizations",
  :xreflabel => "gram2002",
  :copyright_year => "2002",
  :copyright_holder => "Crown Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Gram", :surname=>"Handcock"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Great Mortality: an intimate history of the Black Death, the most devastating plague of all time",
  :xreflabel => "kelly2005",
  :copyright_year => "2005",
  :copyright_holder => "Harper Collins",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"John", :surname=>"Kelly"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Catastrophe An investigation into the origins of the modern world",
  :xreflabel => "keyes1999",
  :copyright_year => "1999",
  :copyright_holder => "Balantine Books",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"David", :surname=>"Keyes"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Flu: The story of the Great Influenza Pandemic of 1918 and the search for the virus that caused it",
  :xreflabel => "kolata1999",
  :copyright_year => "1999, 2005",
  :copyright_holder => "Touchstone",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Gina", :surname=>"Kolata"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Plagues and People",
  :xreflabel => "mcneill1977",
  :copyright_year => "1977, 1989, 1998",
  :copyright_holder => "Anchorbooks",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"William H.", :surname=>"McNeill"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "After the Ice: A global Human History 20,000-5,000 BC",
  :xreflabel => "mithen2003",
  :copyright_year => "2003",
  :copyright_holder => "Harvard University Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Steven", :surname=>"Mithen"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Apocalypse: Earthquakes, archaeology, and the Wrath of God",
  :xreflabel => "nur2008",
  :copyright_year => "2008",
  :copyright_holder => "Princeton University Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Amos", :surname=>"Nur"}, {:firstname=>"Dawn", :surname=>"Burgess"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The End of Eden: The Comet that Changed Civilization",
  :xreflabel => "phillips2007",
  :copyright_year => "2007",
  :copyright_holder => "Bear and Company",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Graham", :surname=>"Phillips"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Noah's Flood: The new scientific discoveries about the event that changed history",
  :xreflabel => "pitman1998",
  :copyright_year => "1998",
  :copyright_holder => "Simon & Schuster",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"William", :surname=>"Ryan"}, {:firstname=>"Walter", :surname=>"Pitman"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Justinian's Flea",
  :xreflabel => "rosen2007",
  :copyright_year => "2007",
  :copyright_holder => "Viking",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"William", :surname=>"Rosen"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Supervolcano: the catastrophic event that changed the course of human history",
  :xreflabel => "savino2007",
  :copyright_year => "2007",
  :copyright_holder => "Career Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"John", :surname=>"Savino"}, {:firstname=>"Marie D.", :surname=>"Jones"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Famine and pestilence in the late Roman and early Byzantine empire: a ...",
  :xreflabel => "stathakopoulos",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Dionysios Ch", :surname=>"Stathakopoulos"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Volcano Weather: the story of 1816, the year without a summer",
  :xreflabel => "stommel1983",
  :copyright_year => "1983",
  :copyright_holder => "Seven Seas Press, Inc",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Henry", :surname=>"Stommel"}, {:firstname=>"Elizameth", :surname=>"Stommel"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Fall of Rome and the End of Civilization",
  :xreflabel => "wadeperkins2005",
  :copyright_year => "2005",
  :copyright_holder => "Oxford University Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Bryan", :surname=>"Wade-Perkins"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Yellow Fever, Black Goddess: The coevolution of people and plagues",
  :xreflabel => "wills1996",
  :copyright_year => "1996",
  :copyright_holder => "Helix Books",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Christopher", :surname=>"Wills"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Illiad of Homer",
  :xreflabel => "homer800bc",
  :copyright_year => "800 BC",
  :copyright_holder => "Public Domain",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Homer", :surname=>""}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Rats, Lice and History",
  :xreflabel => "zinsser1935",
  :copyright_year => "1935",
  :copyright_holder => "Routledge; Revised edition (November 1, 2007)",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Hans", :surname=>"Zinsser"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Krakatoa",
  :xreflabel => "winchester2003",
  :copyright_year => "2003",
  :copyright_holder => "Pernnial Press",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Simon", :surname=>"Winchester"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "The Black Death",
  :xreflabel => "ziegler1969",
  :copyright_year => "1969",
  :copyright_holder => "Modern Classics",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Philip", :surname=>"Ziegler"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Volcanic Dry Fogs, Climate Cooling, and Plague Pandemics in Europe and the Middle East",
  :xreflabel => "stothers1999",
  :releaseinfo => "<a href='https://link.springer.com/article/10.1023/A:1005480105370'>Volcanic Dry Fogs, Climate Cooling, and Plague Pandemics in Europe and the Middle East</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "List of impact craters on Earth",
  :xreflabel => "holoceneimpactcraters",
  :releaseinfo => "<a href='https://en.wikipedia.org/wiki/List_of_impact_craters_on_Earth'>List of impact craters on Earth</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Global Volcanism Program: Large Holocene Eruptions",
  :xreflabel => "holoceneeruptions",
  :releaseinfo => "<a href='http://www.volcano.si.edu/world/largeeruptions.cfm'>Global Volcanism Program: Large Holocene Eruptions</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Medieval Sourcebook: Annales Camriae 447-954 (The Annals of Wales)",
  :xreflabel => "annalescambriae",
  :releaseinfo => "<a href='http://www.fordham.edu/halsall/source/annalescambriae.asp'>Medieval Sourcebook: Annales Camriae 447-954 (The Annals of Wales)</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Olympia hypothesis: Tsunamis buried the cult site on the Peloponnese ",
  :xreflabel => "olympiaearthquake",
  :releaseinfo => "<a href='http://www.uni-mainz.de/eng/14389.php'>Olympia hypothesis: Tsunamis buried the cult site on the Peloponnese</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Corpus of Electronic Texts: The Annals of Ulster",
  :xreflabel => "annalesulster",
  :releaseinfo => "<a href='http://www.ucc.ie/celt/published/t100001A/'>Corpus of Electronic Texts: The Annals of Ulster</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :user_id => @user.id,
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
term = GlossaryTerm.find_or_create_by(name: "Dendrochronology")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "The use of tree rings to reconstruct the date during which a piece of timber was cut.",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Extensible Markup Language")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "Some reasonable definition here.",
  :see => nil,
  :seealso => nil,
  :acronym => GlossaryTerm.find_or_create_by(name: "XML")
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "SGML")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => GlossaryTerm.find_or_create_by(name: "sgml"),
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Standard Generalized Markup Language")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "Some reasonable definition here.",
  :see => nil,
  :seealso => nil,
  :acronym => GlossaryTerm.find_or_create_by(name: "SGML")
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "VEI")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => GlossaryTerm.find_or_create_by(name: "vei"),
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Volcanic Explosion Index")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "A numeric value denoting how large a volcanic explosion is compaired to other explosions.  Indexes greater than 5 affect the global climate.",
  :see => nil,
  :seealso => nil,
  :acronym => GlossaryTerm.find_or_create_by(name: "VEI")
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Typhus")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "Spread by lice.  Rodents have lice which carry typhus. When the rodent is in close quarters with people, the disease is spread via the rodent lice turning to humans when the rodents die from the disease.  The rodent lice infect the human lice and the person sickens as a result.",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Bubonic Plague")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Smallpox")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Rio Tinto")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Tree Ring Event")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Bond Event")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Global Winter")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
term = GlossaryTerm.find_or_create_by(name: "Black Death")
term.update_attributes({
  :book => @book,
  :user => @user,
  :body => "",
  :see => nil,
  :seealso => nil,
  :acronym => nil
})
debugger if term.errors.count > 0
result = Chapter.create({:name => "Preface ",
:position =>chapter_index,
:slug => "gBJS5xC95Y",
:book => @book,
:body => "<p>This book started with the book 'After the Ice'.  During it's reading, I began to look at history in a different way.  Previously, I had followed the tradition of cultural forces verses population as the main driver of history. 
'After the Ice' presented the idea that the environment's changes and the trail left by various peoples as they have struggled to live and ensure they children's survival influenced the development of civilization.
</p><p>
Brian Fagan's books and their assorted information on climate and its affect on history further informed this concept with data in recorded history.
Patterns in weather and their effects on the history of people became very apparent. 
Yet it was apparent from these books that weather could not explain all the various changes in the development of civilization.
A question formed in my mind as to what caused the breaks in historical development.  
Richard Stothers' work presented the Global Winter pattern by applying to many cases in the last 2,000 years.  
These cases showed a simple elegant solution for these drop-outs of history.  
Other historical periods should also have simple solutions as their causes especially when changes are wide spread.  A simple bad winter in one region may not affect another.  When it does, then a solution should explain why.
</p><p>
This search has lead me to the Holocene Project's work and its importance to our future as well as its significance to our past.  
While many argue that such events can not happen or happen so infrequently that their significance in history are not relevant, the 2011 earthquake at Fukushima has showed that ignoring the past can have disastrous consequences.  
The nuclear disaster at Fukushima would not have happened if the project proponents had not ignored evidence of tsunamis that were not within written history and instead relied upon written records.  
Past civilizations may not have had the scientific sophistication to recognize what was happening, but the could record it in the limited world view they held.  
Such recording must not be ignored if we are to understand the dynamics of history.
</p><p>
In writing this book, I understand that I run the risk of the wrath of many group.
Many will of course state that I do not have the credentials to present this 
information.
My experience is in Computer Science, not Geology or History.
</p><p>
Second, various religious communities will not like a possible explanation for the beginnings of the Bible.
My faith does not suffer when archaeology shows that events in the Bible can be dated to an era different from the calculations based on the 'begets'.  It is not the document that matters, it is the fact that this book's relevance has endured that is the important thing.  
Today many advocate beliefs that differ from what the central figure of their religion believed and stated.  Yet, they feel that their faith ensured that what they believe and how they behave are okay with their founder because they have a statement of faith that their deity would not let them believe anything that would be inconsistent with the founder's teachings.
Such is not my faith.
</p><p>
Third, Climate deniers will not like the concept that climate can effect history.  They believe that by ignoring the reality of the world, they can influence.  The Bible's admonishment to go forth and multiple can not be hindered by science which is after all evil as reason is the product of the Devil.  
A planet with limited resources does play a part in the Bible.  
Many great events of destruction have been a result of the God's wrath again the raise in population of 'sinful' people.  
The Book of Revelations seems to indicate that such destruction of resources will herald the return of the Christ so such things must be good since the faster we destroy them, the sooner that Christ returns.
With the advent of the Atomic Age, many people fell into the belief that if we destroy the the world with the bomb, the Good Lord will return.  
Such a belief that God can be manipulated by our actions is huberic at best.
Christ will return in his own time not at a time set by Man.
</p><p>
Last, there are those who seem to believe that preparing for the possibility that an event can occur which preclude the ability of the government to help its people is either an act of terrorism or one of treason.
Such beliefs are understandable given the actions of a few.
Yet to label all because of such behavior is to limit the ability to recognize the difference between reality, truth and the Truth.  
Such behavior endangers the very government which professes to know what is best for all.
Mormonism despite it past has a prophecy which states that they will be the salvation of America.
Such a believe could be based on the fact that they prepare for the possibility of events outlined in this book.
Such a belief is worthy of faith indeed.
</p>"
})
res = Partition.create({
:name => "Preface",
:body => "<p>
Survivalists worry that the government is out to get them.  
</p><p>
Preppers worry that the government will not be there when they need it.
</p>",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("mithen2003")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("fagan1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("fagan2000")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("fagan2004")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("fagan2008")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = Chapter.create({:name => "Introduction ",
:position =>chapter_index,
:slug => "0aX9JB5r3L",
:book => @book,
:body => "<p>My first and primary occupation in life has been Computer Science.  From beginning with Basic on a Woods[[hvFLFEtvVW]] computer and the December 1973 Popular Science magazine's article on the Intel 8080 microprocessor chip to today's cloud environment, Computer Science and its practice has allowed me to sharpen my skills at pattern recognition.  
</p><p>
The science of Computer Science is finding the patterns that define the interaction and manipulation of data and doing so in an efficient manner.  The engineering art of Computer Science is in finding ways to apply those patterns to an ever changing array of data and the needs for knowledge that arises from the crunching of that data.
</p><p>
This pattern awareness lead me to Chinese Medicine and a degree and license in Chinese Medicine and Acupuncture.    The Chinese over the course of millennium have discovered patterns in how the body reacts to bacteriological and viral influences as well as metabolic changes.
Their effect lead to a model of what a healthy person should be as they age.  
As time passed the Chinese scholars augmented the understanding of these traditions with descriptions of patterns related to epidemics and chronic health problems endemic to Mankind.  
</p><p>
Chinese Medicine

 lead me to study the epidemics of history looking at the patterns that a virus would have on society.  In 220 AD Zhong Zhung Zhing 
published the 'Shan Han Lun' (The treatment of Cold Disorders).   
This book came about because Dr Zhong lost three quarters of his clan to an epidemic (believed to be Typhus)
causing him to begin the practice of medicine to aid the survivors. 
85% of the herbal formulas in this book are still in use today.
</p><p>
Having looked at the history of several epidemics, it is apparent to me that many people cannot comprehend the horror of the mass destruction of humanity and as a result reduce the observations of past historians with remarks of 'of course, that cannot be correct'  in reference to figures stated by various people in their writings.
Yet, time has proved many historians of the past to be accurate to the extent of their observations and it is not incomprehensible that in fact at various place during the Justian Plague and the Black Death that populations in some areas were indeed decimated with 9 of 10 people dying just as other places felt no losses.
</p><p>
Documentation of this phenomena are in the modern worlds interactions with 'lost' tribes in the Amazon and how first contact results in a 90% loss of life.
Cortez conquered Mexico due to Smallpox and other viruses that the Incas had caught from Cortez and his crew.   
</p><p>
In the Amazon, there are archaeological digs going on documenting the settlements abandoned 500 years ago[[9RuLzLwxgJ]].   
With the destruction of a civilization to such an extent, more than culture is lost as the skills to continue basic survival are reduced to subsistence level at best.  
Plague is indiscriminate in its effects on the knowledge level of a population.  
During a famine,

 it is the young, the sick, the old, the weak who die first.  
People with skills survive because people reliant on those skills will support those individuals possessing them.   
The concept of the 'noblar third'.  During a plague, the loss of this third results in the degredation of civilization.
During a plague, your chances are dependent on exposure, genes and preexisting immune system strength which paradoxically does not ensure the survival of the fittest.  
During the 'Swine' flu epidemic of 1919, it was the young and strong that died is most numbers.  
Their immune systems launched too strong of an attack resulting in an autoimmune condition.  
During the 2008 round of Swine flu, it was children who were most effected with prolonged effects observed.  
[[agzmaECHXx]]</p><p>
This pattern of epidemics on a native[[TE5Mf2VGJA]] population can possibly be used to explain the mystery of the Minion's disappearance from history as well as the interesting fact that an epidemic of 1,500BC left its mark on the gene pool of Europe[[ck2GFMSGp6]].
</p><p>
Modern sanitation tends to belay the effects of disease on a naive population.  
Even the comparatively recent impact of European diseases on American Indians is reduced to the 'Moral' principle with the idea being that those who are not affected by a disease have higher morals than those affected.  
This is similar to the 'Barbarian Virtues' theory of behavior in parts of the modern world.  
If we practice 'Barbarian Virtues' (rape, pillage and murder) we will be praised and rewarded by God as those are the Virtues that God has rewarded in the past.  
</p><p>
These acts of God as plagues have been labeled in the past have often appeared at times of extreme upheaval in human affairs.  
This begs the chicken-egg question of are the upheavals at such times a result of the plague, a cause of the plague or are both caused by some third set of circumstances.  
</p><p>
The premises of this book is that there are types of events which can lead to both the conditions for societal upheaval as well as account for an explosion of plague causing agents.  
These events are caused by extreme weather due to volcanic events or the impact of a comet or meteor.  
Each type of event has its own effects yet all have a similar effect on weather and short term climate changes.
</p><p>
This effect is to create a Global or Hemispheric Winter. 
 
A condition under which the temperature is low and plants do not grow due to cold and low light conditions.  
In the 535-6 event, the effect was described as a year of living in eclipse as that was the resulting light density from the sun filtering through the dust throw up into the atmosphere. During the 'Cold War', much discussion was given to the effects of a Nuclear Winter.  A similar condition, but with nuclear radiation to contend with as well.  
</p>"
})
res = Partition.create({
:name => "Introduction",
:body => "",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = nil
Footnote.create(:slug => "hvFLFEtvVW", :body => "Pencil and paper", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "9RuLzLwxgJ", :body => "Amazon archaeology of 1500 settlements", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "agzmaECHXx", :body => "I remember that during the Swine flu the early 1970's, my father was struck with flu and pneumonia.", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "TE5Mf2VGJA", :body => "Exposure of 'lost' tribes to diseases", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "ck2GFMSGp6", :body => "Gene study which lead to discovery of European plague in 1500BC", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Chapter.create({:name => "Climatology ",
:position =>chapter_index,
:slug => "Ks57CyFx6C",
:book => @book,
:body => "<p>
Climatology is the study of the interaction of the atmosphere, the oceans and the land to produce the observed climatic effects - the weather.   
The atmosphere was the first mass influence on the earth studied.  
It is simple enough to do so, barometric pressure, temperature, humidity, wind speed and direction are simple to chart.  
Yet, how they will differ from season to season and year to year was shown than the real driving engine of the world climate is the oceans.
</p><p>
There are three major factors affecting climate.  First, the major factor is the oceans as their currents and patterns influence the majority of the 
Earth.  Second, solar affects the atmosphere via solar heating.  Heat creates thermal updrafts which affect the circulation of the air.
</p><p>
The third factor affecting the climate are events which can not be predicted, yet have a global impact.
These events are volcanoes and meteor impacts.  If a volcanic eruption is large enough, it can directly affect the weather by sulfuric acid cooling t
he atmosphere as well as the cooling effect of the shadowing of the oceans by the ash cloud created by the eruption.  
Eruptions which are spaced close together can have an accumulative affect.  
These events can create a Global Winter which affecting all parts of the world.
</p><p>
This section discuses the ocean circulation patterns and how they affect various regions of the world.  
Catastrophic events are then covered by examining volcanic eruptions and impacts.  
Then a definition of Global Winter is formed as well as a discussion of what such a winter entails.
</p>"
})
res = Partition.create({
:name => "Climatology",
:body => "",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "Oceans Circulation ",
:body => "<p>The Thermohaline circulation is the name of a current that circulates in the world's oceans which brings moderating temperatures to western Europe and South Africa.  
Should this circulation shutdown, Europe would return to an Ice age with glacial advances and summer ice.  
Europe is at the same latitude as Greenland.
</p>",
:slug => "5uLcKeAs2q",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Climate Reconstruction ",
:body => "<p>Climate reconstruction has become an important part of explaining changes in societies.  The reconstructions from ice cores and tree rings as well as accumulations on stalactites and rat nests.
</p><p>
The greater the range of types of reconstructions as well as the breadth of geological coverage of climate information expands our understanding of past climate history.
</p><p>
Ice cores, tree rings and stalactite slices are allow called proxies as they are  representative of the temperature at the time the at 'layer' was deposited.  Ice cores provide a additional benefit from the accumulation of dust and its contents.  One of the few ways to distinguish a volcanic winter event from a meteorite event is that a meteorite event usually has micro spears of glass and metal.  The micro-spears are thrown up when the body impacts the planet.  With a comet impact such spears do not seem to be present[[D8ubKbq79y]].
</p><p>
In reconstructing the climate of the planet,  tree rings provide a picture of the local climate and changes in it.  While ice cores paint a picture of the planet as a whole providing a Forest view for the trees view of the trees (You really don't think I would miss that would you?)</p>",
:slug => "RpPEu9zPRJ",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "D8ubKbq79y", :body => "Arizona University website", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Ice Core ",
:body => "<p>The drilling of ice cores in the move 'The day after tomorrow' provide a wonderful window into climate in the hemisphere and together from both the Arctic and Antarctic provide a picture of global weather on a yearly basis.  Ice traps dust as well as gases as show deposits.  The ice provide isotopes which together with gases and such things as sulfuric acid give information as to the temperature, CO2 content of the air, even the sun's influence via solar flares.</p>",
:slug => "99gAJYSwgS",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Sulfuric Acid ",
:body => "<p>Sulfuric Acid in the ice is indicative of Volcanic activity.
</p>",
:slug => "MhJp2jzZjb",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Nitrate ",
:body => "<p>Nitrates relate to biomass burning measured with Ammonia and solar activity by itself.
</p>",
:slug => "AKuN2RymuS",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Ammonia ",
:body => "<p>Ammonia with nitrates measure burning biomass.  Ammonia is also an indicator of cometary impacts.
</p>",
:slug => "6sDqtMG6UD",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Dust Particles ",
:body => "<p>Dust particles relate to volcanic activity as well as impact events. 
</p>",
:slug => "JZXA4d1NdX",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Metallic Spheres ",
:body => "<p>Small silicon and metallic spears relate to impact events as ejected mass for micro spears in the atmosphere.
</p>",
:slug => "nnfZK343NC",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Chapter.create({:name => "Factors affecting the climate ",
:position =>chapter_index,
:slug => "kJ0PaA0Y2P",
:book => @book,
:body => "<p>Climate is usually a pretty stable system.  Oscillations do occurs, yet they are predictable.  Sometime things happen which affect the climate, but are not predictable.  Such things as volcanic eruptions and impact events from space do leave their mark on the climate and have a profound impact on history.</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "Volcanic Events ",
:body => "<p>When volcanoes erupt, they are grade on what is called the Volcanic Explosivity Index.  This is a scale from 1 to 8.  An eruption of 6 or above is going to significantly effect the climate for a few years.
</p><p>
The eruption which create the Year without a Summer (1815 - Tambora) was a 7 on the VEI.</p><p>A partial list of eruptions during the Holocene:
</p>",
:slug => "bVb0EkGWrq",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7", :start_year => 1815)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "VCvFsD3Ff8",
:start_year_uncert => "",
:start_year => "1815"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "VCvFsD3Ff8",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1815"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Rinjani VEI 7 ", :start_year => 1257)
if result.length == 0
result = HoloceneEvent.create({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "RYZm3DmvLw",
:start_year_uncert => "",
:start_year => "1257"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "RYZm3DmvLw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1257"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Changbaishan VEI 7 ", :start_year => 942)
if result.length == 0
result = HoloceneEvent.create({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "1dYDyzS8fF",
:start_year_uncert => "",
:start_year => "942"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "1dYDyzS8fF",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "942"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Blanco, Cerro VEI 7 ", :start_year => -2300)
if result.length == 0
result = HoloceneEvent.create({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "w4TzHjDw9s",
:start_year_uncert => "",
:start_year => "-2300"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "w4TzHjDw9s",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ", :start_year => -4350)
if result.length == 0
result = HoloceneEvent.create({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "pkkBf4AqPZ",
:start_year_uncert => "",
:start_year => "-4350"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "pkkBf4AqPZ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4350"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Crater Lakes Caldera VEI 7 ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lakes Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "STVxnLWD2j",
:start_year_uncert => "",
:start_year => "-5677"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Crater Lakes Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "STVxnLWD2j",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kurile Lake Caldera VEI 7 ", :start_year => -6440)
if result.length == 0
result = HoloceneEvent.create({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "8fLDns88Cr",
:start_year_uncert => "",
:start_year => "-6440"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "8fLDns88Cr",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6440"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Xuct0zg0RS",
:start_year_uncert => "",
:start_year => "-1628"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "Xuct0zg0RS",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 7 ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "1EAryc1x3U",
:start_year_uncert => "",
:start_year => "180"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "1EAryc1x3U",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kuwae, Vanuatu VEI 7 ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "tR3zgeE0jk",
:start_year_uncert => "",
:start_year => "1453"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "tR3zgeE0jk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Impact Events ",
:body => "<p>The frequency of impact events is inconclusive as to how often a history changer occurs.  The climate effects comes from the impact ejaculate being blown into the atmosphere as if it were a volcanic event.
</p><p>
A potential measure would be the check the ammonia levels in the ice core caps to determine if there is a relationship to impact events and high levels.  The level of the 535 impact event was the second highest of the last 2,000 year in the Greenland ice cores.  The highest in that time frame was at 1014 AD.</p><p>A partial list of impact events for the Holocene:
</p>",
:slug => "X3adqeznpb",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "The Clovis Comet ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Uc4SXEZefa",
:start_year_uncert => "",
:start_year => "-10900"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "Uc4SXEZefa",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Campo del Cielo Crater ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ZGSnC0sv1q",
:start_year_uncert => "",
:start_year => "-2000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "ZGSnC0sv1q",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carancas Impact Crater ", :start_year => 2007)
if result.length == 0
result = HoloceneEvent.create({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "3gRS7RqFsy",
:start_year_uncert => "",
:start_year => "2007"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "3gRS7RqFsy",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2007"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chelyabinsk meteor ", :start_year => 2013)
if result.length == 0
result = HoloceneEvent.create({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "hTjfAyNDnE",
:start_year_uncert => "",
:start_year => "2013"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "hTjfAyNDnE",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2013"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grendel Crater ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "DyZ5MHCfeE",
:start_year_uncert => "",
:start_year => "536"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "DyZ5MHCfeE",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Haviland Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "3dtwa1QX6y",
:start_year_uncert => "",
:start_year => "1000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "3dtwa1QX6y",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Henbury Meteorites Conservation Reserve ", :start_year => -2700)
if result.length == 0
result = HoloceneEvent.create({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "NUJnqwnMAk",
:start_year_uncert => "",
:start_year => "-2700"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "NUJnqwnMAk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilumetsa Crater ", :start_year => -4600)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FjwChtxSgr",
:start_year_uncert => "",
:start_year => "-4600"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "FjwChtxSgr",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Morasko Meterorite Nature Reseve ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ZTYBS6LZT1",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "ZTYBS6LZT1",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Caurto Craters ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "kzBZfG3Lxx",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "kzBZfG3Lxx",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sirente Crater ", :start_year => 312)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "6dEHbN1uhp",
:start_year_uncert => "",
:start_year => "312"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "6dEHbN1uhp",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "312"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sobolev Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "805aKK8SLV",
:start_year_uncert => "",
:start_year => "1000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "805aKK8SLV",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tai Hu Lake ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "xakYEjhJHR",
:start_year_uncert => "",
:start_year => "-2500"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "xakYEjhJHR",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wabar Craters ", :start_year => 1863)
if result.length == 0
result = HoloceneEvent.create({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "udBRyjNZNc",
:start_year_uncert => "",
:start_year => "1863"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "udBRyjNZNc",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1863"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kamil Crater ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "tgyE5tAgE0",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "tgyE5tAgE0",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Whitecourt Crater ", :start_year => 1105)
if result.length == 0
result = HoloceneEvent.create({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "5w0VLTBbMQ",
:start_year_uncert => "",
:start_year => "1105"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "5w0VLTBbMQ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1105"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dalgaranga crater ", :start_year => -1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FvS9nXxA98",
:start_year_uncert => "",
:start_year => "-1000"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "FvS9nXxA98",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Bond Events ",
:body => "<p>Bond events

 are events which have occurred in the climate of the earth on a regularly reoccurring basis of about 1470 years.  They are observed in sediments that come from changes in the ice flows in the Arctic.[[2FRBwTUJH9]]</p>",
:slug => "cTsYdczv1c",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "2FRBwTUJH9", :body => "http://rivernet.ncsu.edu/courselocker/PaleoClimate/Bond et al., 1997 Millenial Scale Holocene Change.pdf", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Bond 9 - Colvis Impact Event ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "XBAh9DYG6d",
:start_year_uncert => "",
:start_year => "-10900"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "XBAh9DYG6d",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 8 - End of Younger Dryas ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "nSpqS0AhHD",
:start_year_uncert => "",
:start_year => "-9100"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "nSpqS0AhHD",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 7 ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "bW9yn2CvAE",
:start_year_uncert => "",
:start_year => "-8300"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "bW9yn2CvAE",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 6 - Erdalen Glacial activity ", :start_year => -7400)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "KV2crMCNNV",
:start_year_uncert => "",
:start_year => "-7400"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "KV2crMCNNV",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 5 - 8.2K Event ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "e59FRg5g4Z",
:start_year_uncert => "",
:start_year => "-6200"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "e59FRg5g4Z",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 4 - 5.9K Event - intense aridification ", :start_year => -4200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "pRNRyTxtBM",
:start_year_uncert => "",
:start_year => "-4200"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "pRNRyTxtBM",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Fq9v5PV8pA",
:start_year_uncert => "",
:start_year => "-2200"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "Fq9v5PV8pA",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 2 ", :start_year => -800)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FB19ZKV9At",
:start_year_uncert => "",
:start_year => "-800"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "FB19ZKV9At",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 1 Tree Ring Event ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event ",
:end_year => "545",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "7Dw22XgAyk",
:start_year_uncert => "",
:start_year => "536"
})
@timeline.holocene_events << result
@climate_factors_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 1 Tree Ring Event ",
:end_year => "545",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "7Dw22XgAyk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Global Winter",
:position =>chapter_index,
:slug => "Pwgh3VqZ0c",
:book => @book,
:body => "<p>A global winter is a condition that was first examined in relation to Nuclear war.  What would happen if the globe suffered a winter condition that lasted several years?
While we hope that Nuclear war is not something that will affect history anytime soon, a volcano can and often does produce the effect.
Additionally, the impact of a comet or meteorite sufficiently large would also impact weather.
</p><p>
A global winter must be distinguished from a hemispheric winter which  affects only the middle to upper latitudes above or below the equator.
In 2009, a volcano in Iceland exploded and in the winter of 2010, Western Europe is suffering a severely cold winter.
While today, it is great  inconvenience to the inhabitants of Western Europe, in the past it would have meant the deaths of young and old from exposure and starvation.
When the cold extends into summer, a 'Winter' is happening.
</p><p>
In 1815, the Tambora volcano exploded resulting in a global winter within 'recorded' history.[[DcnUwHqmFx]]
Indeed the records available demonstrate the extent to which the weather in North Eastern America changed is very dramatic.
When examined along side the records from Krakatoa, it can be seen that 1815 'winter' effect was significantly larger.
1815 is called the last crisis of subsistence where the ability of people to feed themselves was greatly challenged.</p>"
})
res = Partition.create({
:name => "Of things that go boom",
:body => "",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "DcnUwHqmFx", :body => "Volcano Weather: the story of 1816, the year without a summer", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Definition",
:body => "<p>A Global winter is a climate event which encompasses the whole planet[[LLjUgfkszn]].
A cooling of the planet's temperature which affects plant growth significantly enough to affect food production.
Visions of Nuclear Winter have prevailed in the West since the inception of the Atomic bomb.
Yet, nature has provided us with an example of what we need fear.
Until the age of modern transportation and specifically the train, famine would be the result during the cold years due to bare subsistence living of most of the people.
</p><p>
The 'Winter' follows a pattern of a couple of years of cold followed by a couple of years of relatively normal weather.
Then an additional couple of years of cold.
After this, the weather would begin to dampen back to the normal patterns established by the ocean circulation.
</p><p>
This sequence is usually 5 to 7 years longs and consists of the following:

</p><p>
The difference between a global  and a hemispheric winter is that the hemispheric winter is usually a couple of years of cold followed by fairly normal weather.  In the northern hemisphere, the weather would be a cold atmosphere with a warm ocean current.
Not much effect would be felt about four years down the line when waters warmed in the Pacific tootles along side Europe as most of those waters are warmed in the southern pacific.
</p><p>
A event in the Southern Hemisphere would have an immediate effect on Australia and South America and southern Africa as well as an effect on Europe as soon as two years latter since all the waters on the way to Europe are coursing through the southern hemisphere and would last longer than a purely northern event as the main volume of water in the Thermohaline circulation runs through the southern hemisphere.</p>",
:slug => "9z2yAL4fLD",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = Biblioentry.find_by_xreflabel("stothers1999")
Footnote.create(:slug => "LLjUgfkszn", :body => "Volcanic Dry Fogs, Climate Cooling, and Plague Pandemics in Europe and the Middle East", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Famine",
:body => "<p>Famine was very common event with an extreme change of weather.
The Year without a Summer in 1816 was the last great Crisis of subsistence in the Western Hemisphere.
After that year, modern transportation has eased the burdens of feeding the population.
</p><p>
In ancient time, an extreme weather event would result in famine with in a year.
If the event occur ed early in the year and no real crops where harvested, famine would occur.
With a truncated harvest, famine would start early the next year.
From a simple event, there could be 1 to 2 years of no or substandard harvests followed by 2 years of barely sufficient harvests followed by another 2 to 3 years of substandard harvests.</p>",
:slug => "6GJURNWPGD",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "The Great Famine ", :start_year => 1315)
if result.length == 0
result = HoloceneEvent.create({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "HtSBxvyyqL",
:start_year_uncert => "",
:start_year => "1315"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "HtSBxvyyqL",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1315"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Year of Darkness - global winter ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "t6FLe4HeT9",
:start_year_uncert => "",
:start_year => "535"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "t6FLe4HeT9",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "GnXpydx9wN",
:start_year_uncert => "",
:start_year => "535"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "GnXpydx9wN",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 539)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "7kbMNdRHTF",
:start_year_uncert => "",
:start_year => "539"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "7kbMNdRHTF",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "539"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "1sX3fNyXKj",
:start_year_uncert => "",
:start_year => "540"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "1sX3fNyXKj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Famines and Epidemics", :start_year => 304)
if result.length == 0
result = HoloceneEvent.create({:name => "Famines and Epidemics",
:end_year => "306",
:body => "<p>Empire wide Stathakopoulos states that the statement that the living were outnumbered by the dead is topoi as far as records go, but many have a basis in fact.
Consider that the Plague of Cyprian was smallpox and when introduced to new areas would have a potential decimating effect.</p>",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "AwkDnSKqzS",
:start_year_uncert => "",
:start_year => "304"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Famines and Epidemics",
:end_year => "306",
:body => "<p>Empire wide Stathakopoulos states that the statement that the living were outnumbered by the dead is topoi as far as records go, but many have a basis in fact.
Consider that the Plague of Cyprian was smallpox and when introduced to new areas would have a potential decimating effect.</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @global,
:image => "",
:slug => "AwkDnSKqzS",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "304"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Plagues: A history of plagues, a plague of histories ",
:body => "<p>A common pattern to extreme weather events is plague.
Plague is different from an epidemic in that diseases like smallpox, measles and mumps were introduced and stayed in the populations of Europe and the Middle east eventually becoming childhood diseases in the cases of mumps and measles.
</p><p>
The plagues of Antonine[[0mtxaPLcAw]]  and Cyprian[[36taaEE848]] were the result of the introduction of Smallpox into the Roman army on the borders of the empire resulting in the spread of the disease into the heart land of Rome.
It is believed that both of these epidemic were Smallpox because tests on the measles virus lead some to believe that it did not evolve into it present form until around 1,000 AD[[wPjGjGcW2h]].
</p><p>
Global Winter events always have some sort of epidemic factors involved be it typhoid fever via local rodent population explosion/collapse or the plague from the same explosion/collapse on the plague caring rodents in Africa.
If the 'Winter' is severe enough, plague rears out of Africa traveling along the eastern coast to the Red sea and it connection to the Mediterranean[[RZpGQwuvXB]].
</p><p>
During the Little Ice Age (1300-1850), the Black  Death was not the only plague to hit Europe[[b9eMjZEs4S]].
</p><p>
Typhus made an appearance as the Plague of Athens becoming the second appearance in recorded Greek history.
The fist is argued as the appearance of disease in the openings of the Iliad which ravages for 9 days destroying horses, mules, dogs and finally humans.
Sent by Apollo via his 'army' of mice[[aqKAKbTtBY]].
</p><p>
Bubonic plague's effects on animals other than rats and man is complex.
Cats are very susceptible to the plague and as hunters of rats would be the first animals affects when a rat die off occurs.
Dogs are not affected by the plague, but can carry the plague fleas until they die of malnutrition and dehydration.
Black footed ferrets can also carry the plague fleas without harm[[VLPTR0FkXN]].
</p>",
:slug => "A1Y5mNS5DW",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "0mtxaPLcAw", :body => "165 - 189 AD", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "36taaEE848", :body => "251 - 270 AD", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "wPjGjGcW2h", :body => "Wiki reference", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("rosen2007")
Footnote.create(:slug => "RZpGQwuvXB", :body => "Justinian's Flea", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("zinsser1935")
Footnote.create(:slug => "b9eMjZEs4S", :body => "Rats, Lice and History", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("homer800BC")
Footnote.create(:slug => "aqKAKbTtBY", :body => "Illiad", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("wills1996")
Footnote.create(:slug => "VLPTR0FkXN", :body => "Yellow fever, black goddess", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Trojan War", :start_year => -1150)
if result.length == 0
result = HoloceneEvent.create({:name => "Trojan War",
:end_year => "",
:body => "<p>Apollo his association with mice and their caring of plague was noted in the Iliad.
That such an association should be stated so clearly indicated a long standing understanding of causes of disease.
</p>",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "zZ2CUywKAA",
:start_year_uncert => "",
:start_year => "-1150"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Trojan War",
:end_year => "",
:body => "<p>Apollo his association with mice and their caring of plague was noted in the Iliad.
That such an association should be stated so clearly indicated a long standing understanding of causes of disease.
</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @global,
:image => "",
:slug => "zZ2CUywKAA",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1150"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Athens ", :start_year => -430)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Athens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "7BzTTme6JC",
:start_year_uncert => "",
:start_year => "-430"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Athens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "7BzTTme6JC",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-430"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Antonine Plague - First appearance of Smallpox ", :start_year => 165)
if result.length == 0
result = HoloceneEvent.create({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "8Hv8362ryX",
:start_year_uncert => "",
:start_year => "165"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "8Hv8362ryX",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "165"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Cyprian - Second appearance of Smallpox ", :start_year => 251)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Cyprian - Second appearance of Smallpox ",
:end_year => "270",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "93LAPA2XqB",
:start_year_uncert => "",
:start_year => "251"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Cyprian - Second appearance of Smallpox ",
:end_year => "270",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "93LAPA2XqB",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "251"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Bubonic Plague ",
:body => "<p>The first occurrence of plague in Europe was about 1500 BC.
This first epidemic did not reach Britain.
The second plague was 541 and then the third in 1347.
The reason that I say not Britain in the first plague is that in the second, the Celtic portion of Britain (the Anglo-Saxons had the other half) the effect was a decimation of the population.
The Waste Lands of Arthur legions started here with area totally emptied of population and others reflecting the shrunken survivors.
</p><p>
Anglo-Saxon Britons did not suffer the same extent of population damage when the plague finally hit them in the 560's.
When the Black Death hit England, the death toll was similar to that suffered by Constantinople in 541, about half.
</p><p>
While the first two occurrences of plague came to Europe via climate change, the third visit was due to that other great determiner of cultural change - War.</p>",
:slug => "uPzCnAmff5",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Bubonic Plague first appearance ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mtjVU5wwRd",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @global,
:image => "",
:slug => "mtjVU5wwRd",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Justian Plague.  Second Occurrence ", :start_year => 541)
if result.length == 0
result = HoloceneEvent.create({:name => "Justian Plague.  Second Occurrence ",
:end_year => "",
:body => "<p>An Empire is not only the ground help by those disposed to its existence, but also the people.
Its citizens who serve as government, religious, cultural and business leaders from ties between communities that are based on trust and mutual understanding.  When plague strikes, the indiscriminate manner of death leads to an uneven distribution of contacts over the larger state.
</p><p>
With such a reduction in communal contentedness, the concept of greater nationhood ceases to exist.
The trust and mutual understanding coming from known personal constants reduces to knowledge of a brother's cousin's friend's cousin.
Family to Family contacts exist if the Family exists.
After a plague, a family's reduction in size reduces it knowledge of the business and its properties.
</p><p>
The Manorialism started in the Third century contributed to this reduction in knowledge because instead of masters of a craft spread out amount the population, they were isolated in number to a Manor.
The lost of an estates master with the job following to a journeyman would cause the Estate owner to seek out a master of the craft if they could be found.</p>",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic,@cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ehFuJbMSNE",
:start_year_uncert => "",
:start_year => "541"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Justian Plague.  Second Occurrence ",
:end_year => "",
:body => "<p>An Empire is not only the ground help by those disposed to its existence, but also the people.
Its citizens who serve as government, religious, cultural and business leaders from ties between communities that are based on trust and mutual understanding.  When plague strikes, the indiscriminate manner of death leads to an uneven distribution of contacts over the larger state.
</p><p>
With such a reduction in communal contentedness, the concept of greater nationhood ceases to exist.
The trust and mutual understanding coming from known personal constants reduces to knowledge of a brother's cousin's friend's cousin.
Family to Family contacts exist if the Family exists.
After a plague, a family's reduction in size reduces it knowledge of the business and its properties.
</p><p>
The Manorialism started in the Third century contributed to this reduction in knowledge because instead of masters of a craft spread out amount the population, they were isolated in number to a Manor.
The lost of an estates master with the job following to a journeyman would cause the Estate owner to seek out a master of the craft if they could be found.</p>",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic,@cultural ],
:region => @global,
:image => "",
:slug => "ehFuJbMSNE",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "541"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Black Death - The third occurance of Plague in Europe ", :start_year => 1347)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Death - The third occurance of Plague in Europe ",
:end_year => "1351",
:body => "",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic,@cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "4ZcHnQVKKR",
:start_year_uncert => "",
:start_year => "1347"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Death - The third occurance of Plague in Europe ",
:end_year => "1351",
:body => "",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic,@cultural ],
:region => @global,
:image => "",
:slug => "4ZcHnQVKKR",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1347"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Great Plague ", :start_year => 1665)
if result.length == 0
result = HoloceneEvent.create({:name => "The Great Plague ",
:end_year => "",
:body => "<p>Plague stricks London.  30% reduction in the population.
</p>",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic,@cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "bJgLZBQwPf",
:start_year_uncert => "",
:start_year => "1665"
})
@timeline.holocene_events << result
@global_winter_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Plague ",
:end_year => "",
:body => "<p>Plague stricks London.  30% reduction in the population.
</p>",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic,@cultural ],
:region => @global,
:image => "",
:slug => "bJgLZBQwPf",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1665"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Plague vs. Famine",
:body => "<p>The after effects of Plagues and Famines differ in who dies during such an event.
During Famines, it is the young, the old, the sick, the poor.
People with skills are cared for by the community and its lord.   At least successful cultures provided for the skilled during famine.
</p><p>
In terms of cultural disasters, a plague is the worst save war.
Plague are non-discriminatory in the selection of victims.
Rich, poor, healthy, sick - all are likely to be struck.
A plague does not differentiate between classes, anyone exposed become a potently victim.
This consequent of plague is called 'The loss of cultural complexity'.
</p><p>
A typical shop would consist of the owner/master craftsman, a journeyman and a few apprentices.
During a famine, the apprentices may have to fend for themselves.
During a plague, one of the apprentices may be the only person left after the epidemic is over.
How then does the business recover?
With the master, he can start over with new apprentices until they are journeymen themselves.
The journeyman can take over with a loss of complexity of what is possible for the business.
The master held all the keys, the journeyman most.
An apprentice may be able with talent, skill and determination rebuild a business in the event on the only surviving practitioner of that occupation.
An intelligent person would be able to work backwards from examples of existing items to recreate their appearance, but not the real item.
The type of glassed used in pottery, the technique used to temper iron for a certain use, the herbal mixture which helps with joint pain are examples lost when a plague strikes.
</p><p>
Imagine you are setting at a dinner table at a conference.
To think of a famine, look at the people around you and think that 1 or 2 people were not there.
This is a famine in it first couple of years.
If a couple of more people are missing then, a longer famine is ensuring.
Now image that the person on either side of you is gone.
A plague which removes half the population.
Look on at every other person at the table.
Now think that you are only person at the table and that you have to look at other tables for company.
This is a plague where 90% die.
Culture does not survive because the simple act of survival does not allow for complex anything.
</p><p>
In the first year, grandma dies; the youngest child.
In the second year, the middle child; perhaps an aunt.
In the third year, we recover.  In the fourth year, we have another child.
In the fifth year, the child dies from starvation; another middle child; perhaps  an uncle.
Finally, the eldest child is endangered.
What parent would not do what they must to ensure survival of their eldest child?</p>",
:slug => "TLc24Wn2Pu",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Chapter.create({:name => "The Confusion of Civilizations:  Too many floods ",
:position =>chapter_index,
:slug => "AVQYm9k8Zr",
:book => @book,
:body => "<p>Archeologests are begining to recognize that many events in oral history are really two seperate events with enough of an overlap
to be compressed by story tellers into one story.  In the Bible, the Exodus is now recognized as such a split event.
</p><p>I contend that there are several stories in the Bible that have had the 'Tale of two' applied: Cast out of Eden, the Exodus,
the great flood and more.  Other events in history have had the same treatment applied.  The story of Atlantis is one example.  The original event in 9,600 BC and the explosion of 
Santorini/Thera in 1,628 BC.
</p><p>The Gilgamesh story records a great flood in the general region of the middle east.  It states that certain area were flooded.  During the Biblical Event flood, cities were lost from history.</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Umm al Bini: The confusion of Civilizations ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini: The confusion of Civilizations ",
:end_year => "",
:body => "<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300 BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather.
</p><p>
The Egyptian Drought</p>",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "RP4ELxCjvT",
:start_year_uncert => "",
:start_year => "-2354"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini: The confusion of Civilizations ",
:end_year => "",
:body => "<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300 BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather.
</p><p>
The Egyptian Drought</p>",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @global,
:image => "",
:slug => "RP4ELxCjvT",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gilgamesh: The Babylonian Flood ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Gilgamesh: The Babylonian Flood ",
:end_year => "-2345",
:body => "<p>The Gilgamesh story records a great flood in the general region of the middle east.  It states that certain area were flooded.  During the Biblical Event flood, cities were lost from history.</p>",
:tag_list => ["Gilgamesh", "Earth", "Flood"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "rxZHtKXV22",
:start_year_uncert => "",
:start_year => "-2354"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gilgamesh: The Babylonian Flood ",
:end_year => "-2345",
:body => "<p>The Gilgamesh story records a great flood in the general region of the middle east.  It states that certain area were flooded.  During the Biblical Event flood, cities were lost from history.</p>",
:tag_list => ["Gilgamesh", "Earth", "Flood"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "rxZHtKXV22",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "HMsChDtUnU",
:start_year_uncert => "",
:start_year => "-2354"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "HMsChDtUnU",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Umm al Bini ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "UM39NTCR6X",
:start_year_uncert => "",
:start_year => "-2354"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "UM39NTCR6X",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Floods - too many floods ",
:body => "",
:slug => "E4LnJyUFTK",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "<p>Kicked out of Eden the first time.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "EjyQqmAUrg",
:start_year_uncert => "",
:start_year => "-16000"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "<p>Kicked out of Eden the first time.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "EjyQqmAUrg",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Ogyges ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Ogyges ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "30Ngt6s2uw",
:start_year_uncert => "",
:start_year => "-9600"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Ogyges ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "30Ngt6s2uw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Dardanus ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Dardanus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "PyfdtQ69GT",
:start_year_uncert => "",
:start_year => "-8500"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Dardanus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "PyfdtQ69GT",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Noah's Flood ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "AP1VhL5zLQ",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "AP1VhL5zLQ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Deucalion Deluge ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "nYPqJqAAwp",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "nYPqJqAAwp",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Eden - Two seperate events ",
:body => "<p>The first exile from Eden occured with the flooding of the Pursian Gulf.  This event seemed to occured around 16,000 BC.
</p><p>
The second exile from Eden was the flooding of the Black sea in 5500 BC.
With this event is a hint of what what was being achieved in terms of plant management.
</p>",
:slug => "4JNV0Pq06a",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "",
:body => "<p>The furtile vally formed by the combination of the rivers floods from the Ocean to three quarters of its present length.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FKz9gytPwQ",
:start_year_uncert => "",
:start_year => "-8500"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "",
:body => "<p>The furtile vally formed by the combination of the rivers floods from the Ocean to three quarters of its present length.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "FKz9gytPwQ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "b3YZWsNT9R",
:start_year_uncert => "",
:start_year => "-16000"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "b3YZWsNT9R",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cast out of Eden - Flooding of the Black Sea ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "v9RvS21SC6",
:start_year_uncert => "",
:start_year => "-5500"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "v9RvS21SC6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Exodus - Two seperate events ",
:body => "<p>The first Exodus occured sometime between the explosing of Santorini in 1628 BC and the distruction of Jerico.
</p><p>The second Exodus occured during the time of Ramsis due to the expusion of the Hyxos from Egypt.
</p>",
:slug => "ZuQdMAdFWr",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "UbFcarjFwg",
:start_year_uncert => "",
:start_year => "-1628"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "UbFcarjFwg",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Which Joshua? ",
:body => "<p>With the changes in dating of the mass destruction of Jerico, the issue of did Joshua exist and was there a battle of 
Jericho?  I see this as a tale of two different things: first the battle of Jericho and the battles of Joshua. I believe that
what has happened is that the battle of Jericho was committed on the first Exodus because the city had acquired the plague and 
visitors were gettig sick.  There are two items that lead me to this conclusion.  During the archeological excavations, it was
found that all the grain  was present and burnt.  Raiders of a community would not leave food stuffs.  Second the elaborate 
cleansing ritual that the troops had to perform after the battle.  This 'ritual' bespeaks of decomtaination from any pathogenic
factors in Jerico as the troops destroyed everything.
</p><p>When Joshua reached his majority and began leading battles against various locations, the cleansing ritual had to be performed
due to the containated state of some locations.  I belive that the scribes used the cleansing ritual to tie the battle of Jericho
and Joshua.
</p>",
:slug => "pckrhHRY9R",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1500",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "eU9fj4wRAg",
:start_year_uncert => "",
:start_year => "-1600"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1500",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "eU9fj4wRAg",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua ", :start_year => -1485)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua ",
:end_year => "-1375",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Km7aAgDvG2",
:start_year_uncert => "",
:start_year => "-1485"
})
@timeline.holocene_events << result
@babylon_flood_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua ",
:end_year => "-1375",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "Km7aAgDvG2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1485"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Genesis ",
:position =>chapter_index,
:slug => "Mm7rXRBRts",
:book => @book,
:body => "<p>My maternal grandmother corralled my one day just before I went off to college.  She exponded to me the history of the Bible and that someday I 
or someone else would demonstrate it's validity.
</p><p>In the years since, I have watched the fate of archeology as one school and then another demonstrated why or why not biblical events could occur.
</p>"
})
res = Partition.create({
:name => "History by Climate",
:body => "",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "10900 BC - 9600 BC - Day 1 Let there be Light ",
:body => "<p>
One of the things that fascinated me about the Tunguska
 blast was the report of the bright sky at night in London allowed reading the newspaper.
An effect after the event that lasted 9 days.
This luminous effects is a result of ice crystals in the atmosphere and it is believed that it was similar to the display caused by the reentry of the space shuttle.
A similar effect on an significantly larger scale would have occurred at the Clovis impact.
</p><p>
God spoke (the noise of the impact), and there was Light (the luminescent display by ice particles over the northern hemisphere).
</p><p>
Simplistic explanation?
Perhaps, but consider that Mankind at that time was dispersed over a large area of the globe.
Such an event  would be known by by those in the Eurasian continent with awe as a supernatural event.
Unlike the peoples of the new world for which the event was catastrophe, the Old world was awed into the beginnings of awareness of a single Creator of events.
</p>",
:slug => "ASSgjVZM65",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 1 Let there be Light ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 1 Let there be Light ",
:end_year => "-9600",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "xdbyU3HmXM",
:start_year_uncert => "",
:start_year => "-10900"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 1 Let there be Light ",
:end_year => "-9600",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "xdbyU3HmXM",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "9600 BC - 9100 BC - Day 2 - Dividing the Waters ",
:body => "<p>
The end of the Younger Dryas started the thawing of the ice across the contents of world.
This would especially affect anyone living on the plains around the Exiune Sea (ancient Black Sea).
Molins would release random amounts of water at random times of the warm season (summer).  Such conditions are not conducive to any activities.
Hunting be based on following herds as they transverse the tundra below the ice fields as the retreat north.
</p><p>
During such a period of sudden flooding, the question of where is the normal flow of water coming from would be a primary need.
Rivers would swell with sudden influxes of water and streams that seem to have a permanence would disappear as the ice moves north.
By the end of the period most major rivers had formed.
Their wandering over their ancient beds would continue, but their jumping over vast areas would have subsided.
</p>",
:slug => "kELhvzzAMV",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 2 - Dividing the Waters ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 2 - Dividing the Waters ",
:end_year => "-9100",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "JPrTBxfjCN",
:start_year_uncert => "",
:start_year => "-9600"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 2 - Dividing the Waters ",
:end_year => "-9100",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "JPrTBxfjCN",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "9100 BC - 8300 BC - Day 3: Dry Land ",
:body => "<p>
During the thawing of the great ice sheets over the Eurasian continent, flooding was a constant feature along a wide area.
Any area below an ice field would have been subject to flash floods when a mulon opens from a surface lake on the ice.
</p><p>
This constant flooding made life difficult for more than just man.
Plants and nesting animals would have little change of survival in such floods.
Humans adapted by either retreating to the hills above such flood areas or fortified their towns with stone towers to act as a water break allowing the flood waters to go around a town.
Jericho had such a stone tower giving the community the shape of a foot.
I believe that part of the ancient traditions in Judaism which refer to worship of the 'foot' refer to similar structures that acquired a purely religious function when the flooding finally subsided.
</p><p>
This Day's end effect was the creation of the herbs, grasses and fruit trees.
Plants could finally establish permanent residence on the plains and mankind began planting grains.
</p>",
:slug => "ZMfcFSgBrt",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 3: Dry Land ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 3: Dry Land ",
:end_year => "-8300",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "v8wPqh4zbg",
:start_year_uncert => "",
:start_year => "-9100"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 3: Dry Land ",
:end_year => "-8300",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "v8wPqh4zbg",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "7400 BC - Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ",
:body => "<p>
A 'Day' which seems to reflect the growing wonder at God's creation.
A cold period with low atmospheric particulates or moisture.
Cold nights offer clearer sighs of the stars, planets and possible Aurora Brollies displays.
</p>",
:slug => "ReFseMX0gq",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ", :start_year => -7400)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "VXgTt0LkBK",
:start_year_uncert => "",
:start_year => "-7400"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "VXgTt0LkBK",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "6100 BC - Day 5 - Water and Air creatures ",
:body => "<p>
After such flooding caused by the ice melt, the rivers and streams would have been washed clean.
The time needed for fish to establish themselves in the rivers and streams would have varied by species.
I think that as fish populations increase, so would Avian species preying on them.
</p>",
:slug => "59PGmG34rT",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 5 - Water and Air creatures ", :start_year => -6100)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 5 - Water and Air creatures ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "LHgd95SQp3",
:start_year_uncert => "",
:start_year => "-6100"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 5 - Water and Air creatures ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "LHgd95SQp3",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "6000 BC - 5700 BC - Day 6 - Land creatures and Man ",
:body => "<p>
I would contend that Days 5 and 6 are a bit 'shorter' that the previous one.
These reason for the is that as the Lord 'rested' and man played in the Garden of Eden, the ocean level rose.
Eventually, they cased the inflow of sea water into the Black Sea.
</p><p>
The domestication of animals has allowed man to expand in a manner never before seen in human history. While some animals have been with mankind for millennium, others are more recent and some will never be tamed.
As man's awareness has grown over time, the dependency on livestock for food and labor has grown as well.
</p>",
:slug => "rqfLKvzh1T",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 6 - Land creatures and Man ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 6 - Land creatures and Man ",
:end_year => "-5700",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "TwdCq7kVxq",
:start_year_uncert => "",
:start_year => "-6000"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 6 - Land creatures and Man ",
:end_year => "-5700",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "TwdCq7kVxq",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "5700 BC - Day 7 - The Lord Rested ",
:body => "",
:slug => "fMNamUGUAw",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 7 - The Lord Rested ", :start_year => -5700)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 7 - The Lord Rested ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "MjdLfGQd26",
:start_year_uncert => "",
:start_year => "-5700"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 7 - The Lord Rested ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "MjdLfGQd26",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "5677 BC - God Comes to visit ",
:body => "<p>
What would a person consider as a visit from God?  I content that a volcano exploding with enough force would generate a sound heard around the world.
</p><p>
I could also contend that an impact event would also qualify.  First the bright sreak across the sky.  Then an explosion generating a massive sound. 
Two such impacts are the Tunguska event and the Chelyabinsk meteor.
</p>",
:slug => "f5m0czZFK5",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "God Comes to visit ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "God Comes to visit ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "NE5vyePBRm",
:start_year_uncert => "",
:start_year => "-5677"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "God Comes to visit ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "NE5vyePBRm",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Crater Lakes Caldera VEI 7", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lakes Caldera VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @northamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "vuJkpGVtp0",
:start_year_uncert => "",
:start_year => "-5677"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Crater Lakes Caldera VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @northamerica,
:image => "",
:slug => "vuJkpGVtp0",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = Section.create({:name => "5500 BC - Cast out of Eden - Flooding of the Black Sea ",
:body => "<p>
At that time the Black sea area was truly Eden.
Large fresh water lake with gentle rolling hills.
Four rivers flowing to the area proving a guide out of the area.
Having had several thousand years to adapt to the valley, it's loss would be a religious experience.
The Black Sea basin before the flooding by the sea was a paradice compaired to other areas during the Holocene. Fresh water with four river running into it profiding trails leading out. The plain would have been firtile with grass as well as marshes with birds, fish and other animals. 
</p><p>
Depending on the rate of rise of the wasters, one could find oneself at the edge of the new ocean with literally the cloths on ones back.
</p>",
:slug => "bhuPfJJm77",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Eve's Apple ",
:body => "<p>
One of the quesions that has always interested me is the question of Eve, the apple and the snake.  Apple trees are an awesome source of food.
It can be dried.  I can imagine some women trying to harvest apples and running into snakes in the trees.  Not a desirable work condition.
I imagine that to remady this, they cut branches to skirt the tree pointing downward so that a snake would fall back to earth trying to climb the tree.
Now imagine some of the branches are apple and being stuck into the apple tree, they grew.
Not somethings that those who grow beards and know things know about.
</p>",
:slug => "0rbFb8XYSR",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Cast out of Eden - Flooding of the Black Sea ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "5eY3aMDrVW",
:start_year_uncert => "",
:start_year => "-5500"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "5eY3aMDrVW",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "3000 BC - Noah's Flood ",
:body => "<p>
When research conducted by William Ryan, Walter Pitman was first published in 1998, the Christian community was not very receiving.
First, the Biblical flood covered the whole world, while the flooding of the Black Sea basin was not global in nature.
</p><p>
Research done by Abbott, et la concerning specific types of chevron dunes along the coasts of various places lead to the discovery of the Buckle Crater.
This event would have been global with solid rain for several months.
</p><p>
This event is called the Piora Oscillation and lasted from 3250BC to 2900BC.
A Greenland GISP2 ice core sample shows a sulfate spike and methane trough about 3250 BC.
</p>",
:slug => "58Tan3PNPL",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Burckle Crater ", :start_year => -2800)
if result.length == 0
result = HoloceneEvent.create({:name => "Burckle Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "tz01GjbBMV",
:start_year_uncert => "",
:start_year => "-2800"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burckle Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "tz01GjbBMV",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Deucalion Deluge ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "fy5KqvkuFD",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "fy5KqvkuFD",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Noah's Flood ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "PQH5HjAvj0",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "PQH5HjAvj0",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "1628 BC - Destrection of Sodom and Gomorrah ",
:body => "<p>Thera had two minor eruptions before exploding.  The first eruption cast a plume trace to the northeast of the 
Mediteranian.  Traces of the plume have been found in Turkey and parts of Lebinon.  The second eruption was towards the
south east over the land of Isreal.  Abraham  in the plains of Mamre would have seen the first eruption as something 
devine and safe as no fallout from the plume reached his location.  The interviening months between the first and second
eruptions would have allowed time for new of the destruction caused by the fallout of the first explosion to filter to 
Abraham.
</p><p>When the second explosion occured and the plume came overhead, Abraham was visited by people who survived the first plume.
These survivors were surely angles have survived by being on God's side.  They sought to warm Lot, his family and friends
that the fallout from the plume could destroy them.  Who or what the angles sent to Lot in Sodom is unknowable.
There effect on the crowd at Sodom seems real enough.  If something or someone is brought to the city with knowledge
of what is happening with the eruption plume overhead would be very sought after.  
</p><p>
Steven Collins' work at Tall el-Hammam in Jordon has shown that the city he found matches the description of Sodom
as defined in the Bible.  During the work of excuvation, large quantities of glass where found that resemble Trinitite
indicating a very hot explotion.  That the glass was located in a area covering Tall el-Hammam suggests to me a 
volcanic cinder bomb not cooling correctly as it comes down resulting in a superheated explosion on a limited scale.
</p>",
:slug => "CkgAb252zS",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Destrection of Sodom and Gomorrah ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Destrection of Sodom and Gomorrah ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "AHne3KUFsc",
:start_year_uncert => "",
:start_year => "-1628"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destrection of Sodom and Gomorrah ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "AHne3KUFsc",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mSMtdgWUdQ",
:start_year_uncert => "",
:start_year => "-1628"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "mSMtdgWUdQ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The 10 Plagues of Egypt ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "The 10 Plagues of Egypt ",
:end_year => "",
:body => "<p>Plague 1 - Water turned into blood, fish died</p><p>
The redness in the Nile was caused by volcanic ash from Thera which is found in the Nile region. The silt would have make the Nile turn blood red, and would also render it undrinkable. Heavy rains in the red-soiled area of Lake Victoria could have caused reddened water to wash downstream.
</p><p>Plague 2 - Frogs</p><p>
Any blight on the water that killed fish also would have caused frogs to leave the river and probably die.
</p><p>Plagues 3 and 4 - Biting insects and flies</p><p>
The lack of frogs in the river would have let insect populations, normally kept in check by the frogs, increase massively.
</p><p>Plagues 5 and 6 - Livestock disease and boils</p><p>
There are biting flies in the region which transmit livestock diseases; a sudden increase in their number could spark epidemics.
</p><p>Plague 7 - Fiery hail</p><p>
Volcanic activity not only brings with it ash, but brimstone, and also alters the weather system, occasionally producing hail. Hail could also have occurred as a completely independent natural weather event, with accompanying lightning as the 'fire'.
</p><p>Plague 8 - Locusts</p><p>
The weight of hail will destroy most crops, leaving several insects and other animals without a normal food source. The remaining crops therefore would become targeted heavily, and thus be destroyed by swarms of locusts which would otherwise be distributed rather thinly. Or the locusts could have increased because of a lack of predators. Even without these explanations, swarms of locusts are not uncommon today.
</p><p>Plague 9 - Darkness</p><p>
There could be several causes for unusual darkness: a solar eclipse, a sandstorm, volcanic ash, or simply swarms of locusts large enough to block out the sun.
</p><p>Plague 10 - Death of the firstborn</p><p>
If the last plague indeed selectively tended to affect the firstborn, it could be due to food polluted during the time of darkness, either by locusts or by the black mold Cladosporium. When people emerged after the darkness, the firstborn would be given priority, as was usual, and would consequently be more likely to be affected by any toxin or disease carried by the food. Meanwhile, the Israelites ate food prepared and eaten very quickly which would have made it less likely to be infected.
</p><p>
In the 2006 documentary Exodus Decoded, Jewish Canadian filmmaker Simcha Jacobovici hypothesized the selectiveness of the tenth plague was under the circumstances similar to the 1986 disaster of Lake Nyos that is related to geological activities that caused the previous plagues in a related chain of events. The hypothesis was that the plagues took place shortly after the eruption of Thera (now known as Santorini), which happened some time between 1550 BC and 1650 BC, and recently narrowed to between 1627 BC - 1600 BC, with a 95% probability of accuracy. Jacobovici however places the eruption in 1500 BC. According to the documentary, the eruption sets off a chain of events resulting in the plagues and eventually the killing of the first born. Jacobovici suggests that the first born in ancient Egypt had the privilege to sleep close to the floor while other children slept on higher ground or even on roofs. This view, however, is not supported by any archaeological or historical evidence. As in Lake Nyos, when carbon dioxide or other toxic gases escape the surface tension of a nearby water body because of either geological activity or over-saturation, the gas, being heavier than air, 'flooded' the nearby area displacing oxygen and killing those who were in its path. Jewish households escaped the fate because they were told to observe their first Passover rituals.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "dR14J8ctZj",
:start_year_uncert => "",
:start_year => "-1628"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The 10 Plagues of Egypt ",
:end_year => "",
:body => "<p>Plague 1 - Water turned into blood, fish died</p><p>
The redness in the Nile was caused by volcanic ash from Thera which is found in the Nile region. The silt would have make the Nile turn blood red, and would also render it undrinkable. Heavy rains in the red-soiled area of Lake Victoria could have caused reddened water to wash downstream.
</p><p>Plague 2 - Frogs</p><p>
Any blight on the water that killed fish also would have caused frogs to leave the river and probably die.
</p><p>Plagues 3 and 4 - Biting insects and flies</p><p>
The lack of frogs in the river would have let insect populations, normally kept in check by the frogs, increase massively.
</p><p>Plagues 5 and 6 - Livestock disease and boils</p><p>
There are biting flies in the region which transmit livestock diseases; a sudden increase in their number could spark epidemics.
</p><p>Plague 7 - Fiery hail</p><p>
Volcanic activity not only brings with it ash, but brimstone, and also alters the weather system, occasionally producing hail. Hail could also have occurred as a completely independent natural weather event, with accompanying lightning as the 'fire'.
</p><p>Plague 8 - Locusts</p><p>
The weight of hail will destroy most crops, leaving several insects and other animals without a normal food source. The remaining crops therefore would become targeted heavily, and thus be destroyed by swarms of locusts which would otherwise be distributed rather thinly. Or the locusts could have increased because of a lack of predators. Even without these explanations, swarms of locusts are not uncommon today.
</p><p>Plague 9 - Darkness</p><p>
There could be several causes for unusual darkness: a solar eclipse, a sandstorm, volcanic ash, or simply swarms of locusts large enough to block out the sun.
</p><p>Plague 10 - Death of the firstborn</p><p>
If the last plague indeed selectively tended to affect the firstborn, it could be due to food polluted during the time of darkness, either by locusts or by the black mold Cladosporium. When people emerged after the darkness, the firstborn would be given priority, as was usual, and would consequently be more likely to be affected by any toxin or disease carried by the food. Meanwhile, the Israelites ate food prepared and eaten very quickly which would have made it less likely to be infected.
</p><p>
In the 2006 documentary Exodus Decoded, Jewish Canadian filmmaker Simcha Jacobovici hypothesized the selectiveness of the tenth plague was under the circumstances similar to the 1986 disaster of Lake Nyos that is related to geological activities that caused the previous plagues in a related chain of events. The hypothesis was that the plagues took place shortly after the eruption of Thera (now known as Santorini), which happened some time between 1550 BC and 1650 BC, and recently narrowed to between 1627 BC - 1600 BC, with a 95% probability of accuracy. Jacobovici however places the eruption in 1500 BC. According to the documentary, the eruption sets off a chain of events resulting in the plagues and eventually the killing of the first born. Jacobovici suggests that the first born in ancient Egypt had the privilege to sleep close to the floor while other children slept on higher ground or even on roofs. This view, however, is not supported by any archaeological or historical evidence. As in Lake Nyos, when carbon dioxide or other toxic gases escape the surface tension of a nearby water body because of either geological activity or over-saturation, the gas, being heavier than air, 'flooded' the nearby area displacing oxygen and killing those who were in its path. Jewish households escaped the fate because they were told to observe their first Passover rituals.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "dR14J8ctZj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "Exodus ",
:body => "<p>
Research has shown that there were possibly two Exodus episodes.  The first due to the plagues of Egypt during the Santorini explosion and the 
section during the expltion of the Hyksos.
</p>",
:slug => "a6khWyWRN6",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Exodus - First ", :start_year => -1446)
if result.length == 0
result = HoloceneEvent.create({:name => "Exodus - First ",
:end_year => "-1350",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "R5EPNqMqTd",
:start_year_uncert => "",
:start_year => "-1446"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Exodus - First ",
:end_year => "-1350",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "R5EPNqMqTd",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1446"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Exodus - Second ", :start_year => -1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Exodus - Second ",
:end_year => "-1200",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "37x8hXwWZq",
:start_year_uncert => "",
:start_year => "-1300"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Exodus - Second ",
:end_year => "-1200",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "37x8hXwWZq",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Moses ", :start_year => -1391)
if result.length == 0
result = HoloceneEvent.create({:name => "Moses ",
:end_year => "-1271",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "dMUDwdnqCw",
:start_year_uncert => "",
:start_year => "-1391"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Moses ",
:end_year => "-1271",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "dMUDwdnqCw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1391"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Leviticus 19:19 ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Leviticus 19:19 ",
:end_year => "",
:body => "<p>
' [the Hebrew people] shalt not sow their field with mingled seed... '(King James Bible)
</p><p>
Some scholars believe the phrase mingled seeds includes grafting, although this interpretation remains contentious among scholars.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "sBV7pKSQ5J",
:start_year_uncert => "",
:start_year => "-1400"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leviticus 19:19 ",
:end_year => "",
:body => "<p>
' [the Hebrew people] shalt not sow their field with mingled seed... '(King James Bible)
</p><p>
Some scholars believe the phrase mingled seeds includes grafting, although this interpretation remains contentious among scholars.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "sBV7pKSQ5J",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tsunami at Tartessos area ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "64gtS6UJrY",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "64gtS6UJrY",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kaali Meteor Impact ", :start_year => -1530)
if result.length == 0
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "q7bCZszW25",
:start_year_uncert => "",
:start_year => "-1530"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kaali Meteor Impact ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "q7bCZszW25",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1530"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 6 ", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FCDM8Wd864",
:start_year_uncert => "",
:start_year => "-1460"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "FCDM8Wd864",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1460"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1500",
:body => "<p>The 'Battle' of Jerico and it subsiquent destruction of all living souls is a curious event in the history of Moses and the tribes.
The elaborate clensing ritual for the aftermath of the battle seems to be more of a contamination clense than calming the soul so as 
to not murder your wife and children after killing everyone in Jerico.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "xzKzQJNfxa",
:start_year_uncert => "",
:start_year => "-1600"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1500",
:body => "<p>The 'Battle' of Jerico and it subsiquent destruction of all living souls is a curious event in the history of Moses and the tribes.
The elaborate clensing ritual for the aftermath of the battle seems to be more of a contamination clense than calming the soul so as 
to not murder your wife and children after killing everyone in Jerico.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "xzKzQJNfxa",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua ", :start_year => -1485)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua ",
:end_year => "-1375",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "8vYfxZSsLw",
:start_year_uncert => "",
:start_year => "-1485"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua ",
:end_year => "-1375",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "8vYfxZSsLw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1485"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Small reoccupation of Jerico ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Small reoccupation of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "upTXeJK6ee",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Small reoccupation of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "upTXeJK6ee",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jerico unoccupied ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Jerico unoccupied ",
:end_year => "-900",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "pytNkhdBwv",
:start_year_uncert => "",
:start_year => "-1400"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jerico unoccupied ",
:end_year => "-900",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "pytNkhdBwv",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Period of the Judges ", :start_year => -1350)
if result.length == 0
result = HoloceneEvent.create({:name => "Period of the Judges ",
:end_year => "-1050",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "05TTYBBNhP",
:start_year_uncert => "",
:start_year => "-1350"
})
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Period of the Judges ",
:end_year => "-1050",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "05TTYBBNhP",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1350"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Comets, plague, survivors and the issue of War ",
:position =>chapter_index,
:slug => "TcKnLeGAkw",
:book => @book,
:body => "<p>Research on DNA traces of epidemics identified a epidemic that struck Europe about 1,500BC.
Curiously, it did not affect the population of the Middle East.
If a disease followed the same pattern of out of Africa via the Red Sea, then the Minoans would have taken it back to Crete and from there to its colonies in Greece and Anatolia.
With a naive population, the reduction of the Minoan population by 90% would reduce any culture to rubble.
</p><p>That plague is non-discriminitory towards status, the loss of leaders in any given group would lead to contests to
determine leadership.  It is possible that much of the violence that Graham Phillips (below) attributes to a comet is 
possibly related to the unrestrained mass of people faced with collapsed leadership and organized food production.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1500",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "P596EmmAut",
:start_year_uncert => "",
:start_year => "-1600"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1500",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "P596EmmAut",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bubonic Plague first appearance ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "<p>Gentic research into heart disease arrived at the conclustion that Bubonic plage appeared in Europe around 1,500 BC.
This epidemic possibly reduced the population by 90%.  The British isles being the exception.
The evidence for this is the destuction of trading cities in Cornwall.  The archelogy showed a 90% reducton in the trading cities.  
</p>",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic,@cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "sk2LHRBhKw",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "<p>Gentic research into heart disease arrived at the conclustion that Bubonic plage appeared in Europe around 1,500 BC.
This epidemic possibly reduced the population by 90%.  The British isles being the exception.
The evidence for this is the destuction of trading cities in Cornwall.  The archelogy showed a 90% reducton in the trading cities.  
</p>",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic,@cultural ],
:region => @europe,
:image => "",
:slug => "sk2LHRBhKw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague strikes Egypt ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague strikes Egypt ",
:end_year => "",
:body => "<p>Plague strikes Egypt.</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "MHN6tjvUdG",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague strikes Egypt ",
:end_year => "",
:body => "<p>Plague strikes Egypt.</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @global,
:image => "",
:slug => "MHN6tjvUdG",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Comet ", :start_year => -1486)
if result.length == 0
result = HoloceneEvent.create({:name => "Comet ",
:end_year => "",
:body => "<p>Graham Phillips presents compelling evidence that civilization in the northern hemisphere became warlike and monotheistic after Earth passed through the tail of a comet.
</p><p>
There is a text in Egypt which describes the comet and its breaking up.
</p><p>
The comet ice may have contained large amounts of amino acids which promoted aggression.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "GfBpGgNDcw",
:start_year_uncert => "",
:start_year => "-1486"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Comet ",
:end_year => "",
:body => "<p>Graham Phillips presents compelling evidence that civilization in the northern hemisphere became warlike and monotheistic after Earth passed through the tail of a comet.
</p><p>
There is a text in Egypt which describes the comet and its breaking up.
</p><p>
The comet ice may have contained large amounts of amino acids which promoted aggression.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "GfBpGgNDcw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1486"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Suppiluliuma I died in the plague which spread across the region ", :start_year => -1322)
if result.length == 0
result = HoloceneEvent.create({:name => "Suppiluliuma I died in the plague which spread across the region ",
:end_year => "",
:body => "<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "QypnELRkyK",
:start_year_uncert => "",
:start_year => "-1322"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Suppiluliuma I died in the plague which spread across the region ",
:end_year => "",
:body => "<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @global,
:image => "",
:slug => "QypnELRkyK",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1322"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tsunami at Tartessos area ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "7zQdMTjTvc",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "7zQdMTjTvc",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kaali Meteor Impact ", :start_year => -1530)
if result.length == 0
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "9KStBnBAek",
:start_year_uncert => "",
:start_year => "-1530"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kaali Meteor Impact ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "9KStBnBAek",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1530"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 6 ", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Up3rnLtg55",
:start_year_uncert => "",
:start_year => "-1460"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "Up3rnLtg55",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1460"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Small reoccupation of Jerico ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Small reoccupation of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "KauMy1qKwp",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Small reoccupation of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "KauMy1qKwp",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Bronze Age Collapse ",
:position =>chapter_index,
:slug => "BZA6EUpdTc",
:book => @book,
:body => "<p>A great question in history has always been the collapse of the Prototypical Manoral societies in the Macadonian and Greek areas.  With an event which produced an 18 year substandard harvest resulting in a transgenerational famine
 with peoples facing genocide due to the weather.   Peoples searching for substance flooded south into any area that had any food without care as to those there already.  The most famous is the
Sea People.
</p><p>
The appearance of the Sea People it is believed were peoples from the various islands of the Mediterranean.  It is speculated that the Trojans and their allies were a major part of the Sea People.</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "2200 BC - 2100 BC - 4.2 Kiloyear Event",
:body => "",
:slug => "FkqRfe7dbj",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "4.2 Kiloyear Event", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "4.2 Kiloyear Event",
:end_year => "-2100",
:body => "<p>A 180-km-long wall, the 'Repeller of the Amorites', was built across central Mesopotamia to stem nomadic incursions to the south.</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "0sPHMcQ9xq",
:start_year_uncert => "",
:start_year => "-2200"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "4.2 Kiloyear Event",
:end_year => "-2100",
:body => "<p>A 180-km-long wall, the 'Repeller of the Amorites', was built across central Mesopotamia to stem nomadic incursions to the south.</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "0sPHMcQ9xq",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-1900",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "LKWfHMrwLK",
:start_year_uncert => "",
:start_year => "-2200"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-1900",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "LKWfHMrwLK",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Lycian Sea People ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "The Lycian Sea People ",
:end_year => "-1700",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "EBFTWs29VB",
:start_year_uncert => "",
:start_year => "-2000"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Lycian Sea People ",
:end_year => "-1700",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "EBFTWs29VB",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Sherden Sea People ", :start_year => -1399)
if result.length == 0
result = HoloceneEvent.create({:name => "The Sherden Sea People ",
:end_year => "-1300",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "5MetvwPbpe",
:start_year_uncert => "",
:start_year => "-1399"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Sherden Sea People ",
:end_year => "-1300",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "5MetvwPbpe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1399"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jason and the Argonauts ", :start_year => -1299)
if result.length == 0
result = HoloceneEvent.create({:name => "Jason and the Argonauts ",
:end_year => "-1200",
:body => "<p>The classic tale defining a part of Greek culture.  There is discussion about the story being one of the 
descendents of a people who occupied parts of Greece going on a voyage back to their ancestrial home land.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "https://www.ancient.eu/article/425/jason--the-argonauts/",
:user_id => @user.id,
:slug => "8JFH86cqam",
:start_year_uncert => "",
:start_year => "-1299"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jason and the Argonauts ",
:end_year => "-1200",
:body => "<p>The classic tale defining a part of Greek culture.  There is discussion about the story being one of the 
descendents of a people who occupied parts of Greece going on a voyage back to their ancestrial home land.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "8JFH86cqam",
:url => "https://www.ancient.eu/article/425/jason--the-argonauts/",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1299"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "1150 BC - Trojan War ",
:body => "<p>That the Trojan war is placed in the bronze Age Collapse, the question of motives is that the Trojans and their allies may have been the
Sea Peoples and were finally cornered as told by the Iliad.
</p><p>
Apollo his association with mice and their caring of plague was noted in the Iliad.  That such an association should be stated so clearly indicated along standing understanding of causes of disease.
</p><p></p>",
:slug => "Gkbqn2ZPRf",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Trojan War ", :start_year => -1150)
if result.length == 0
result = HoloceneEvent.create({:name => "Trojan War ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "rtL8kTu1Ug",
:start_year_uncert => "",
:start_year => "-1150"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Trojan War ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "rtL8kTu1Ug",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1150"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bronze Age Collapse ", :start_year => -1206)
if result.length == 0
result = HoloceneEvent.create({:name => "Bronze Age Collapse ",
:end_year => "-1150",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BYXqW4JGjk",
:start_year_uncert => "",
:start_year => "-1206"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bronze Age Collapse ",
:end_year => "-1150",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "BYXqW4JGjk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1206"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mycenea - Earthquake ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea - Earthquake ",
:end_year => "-1190",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "C5XDCc3cAz",
:start_year_uncert => "",
:start_year => "-1200"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea - Earthquake ",
:end_year => "-1190",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "C5XDCc3cAz",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Helka 3, Iceland VEI 6 ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Helka 3, Iceland VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "TdA8gaKAv6",
:start_year_uncert => "",
:start_year => "-1159"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helka 3, Iceland VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "TdA8gaKAv6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Downturn of environment: Tree Ring Event ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event ",
:end_year => "-1141",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "U5eFXy3kxP",
:start_year_uncert => "",
:start_year => "-1159"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Downturn of environment: Tree Ring Event ",
:end_year => "-1141",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "U5eFXy3kxP",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Late Bronze Age Collapse ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "aNN7He1ZUj",
:start_year_uncert => "",
:start_year => "-1200"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "aNN7He1ZUj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Poseidon's Horses: Earthquake Swarm ", :start_year => -1225)
if result.length == 0
result = HoloceneEvent.create({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "58KDvQacHm",
:start_year_uncert => "",
:start_year => "-1225"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @neareast,
:image => "",
:slug => "58KDvQacHm",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1225"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Section.create({:name => "1100 BC - 776 BC - Greek Dark Ages ",
:body => "",
:slug => "dnR5qD9u9E",
:position => section_index,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Greek Dark Ages ", :start_year => -1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Greek Dark Ages ",
:end_year => "-776",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "KDHP3RvFzv",
:start_year_uncert => "",
:start_year => "-1100"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Greek Dark Ages ",
:end_year => "-776",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "KDHP3RvFzv",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Olympic Games ", :start_year => -776)
if result.length == 0
result = HoloceneEvent.create({:name => "First Olympic Games ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "df7MhubKJc",
:start_year_uncert => "",
:start_year => "-776"
})
@timeline.holocene_events << result
@bronze_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Olympic Games ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "df7MhubKJc",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-776"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Crisis of the Third Century ",
:position =>chapter_index,
:slug => "CGPDx8sdCS",
:book => @book,
:body => "<p>
Perhaps one the most enduring mysteries of the Roman empire, the crisis of the Third Century has been difficult to explain in terms of the standard dynamics of culture.  
Here was a empire, prosperous and stable which suddenly experienced a monumental schism between the army and the government.  
What lead to such a crisis?
</p><p>
A non-cultural explanation is that the explosion of the Taupo volcano around 180 AD in the southern hemisphere lead to a hemispheric winter in Africa which caused the various peoples to migrate northward seeks subsistence.  
This migration eventually lead the Mauri people to invade southern Spain conquering the Rio Tinto area and its mine.
</p><p>
Rio Tinto was the stability of the Roman empire.  
While the output in gold was not significant, the silver was the stable income to pay for bread and curcuses.  
With its loss, the pay was made up from other areas of the empire eventually leading to the devaluation of the Demare and the eventually collapse of the tax system resulting in the Army's revolt in 235 AD.  The silver being used to pay both bread and curcuses and the army was streatched too thin.
</p><p>
The 'Crisis of the Third Century' resulted in the lost of safe passage along the Roman highway, the most amazing feat of the Roman world.  
The roads systems allowed the common Roman the ability to travel over a large range of the empire without fear of out and out banditry.  
After the third century, safety was in numbers and via the sea until the advent of the Vandals and their pirating out of Carthage starting in the mid 5Th century.
</p><p>
Beginnings of Serfdom with the giving up of rights by people fleeing the cities.  
These people were called coloni being tied to the land via Imperial Reforms with the resulting descendant suffrage.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Romans Arrive at Rio Tinto ", :start_year => -206)
if result.length == 0
result = HoloceneEvent.create({:name => "Romans Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "E9Lst2nD7f",
:start_year_uncert => "",
:start_year => "-206"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Romans Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "E9Lst2nD7f",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-206"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Antonine Plague - First appearance of Smallpox ", :start_year => 165)
if result.length == 0
result = HoloceneEvent.create({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "<p>First appearance of Smallpox.  It is thought that about one third to one half the empire died in the epidemic.
</p><p>
The plague decimated the army with a 13 to 15 percent loss with the cities suffering 25% while the rural population suffered up to one third in loss of life.  When the Roman army contracted due to the plague, the Mauri invaded conquering the
Rio Tinto area leading to the loss of the silver supplying the army.
</p><p>
Striping the value from the coin lead to economic unrest resulting in the Crisis of the Third Century.</p>",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [  @epidemic ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Xg02gFBwAL",
:start_year_uncert => "",
:start_year => "165"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "<p>First appearance of Smallpox.  It is thought that about one third to one half the empire died in the epidemic.
</p><p>
The plague decimated the army with a 13 to 15 percent loss with the cities suffering 25% while the rural population suffered up to one third in loss of life.  When the Roman army contracted due to the plague, the Mauri invaded conquering the
Rio Tinto area leading to the loss of the silver supplying the army.
</p><p>
Striping the value from the coin lead to economic unrest resulting in the Crisis of the Third Century.</p>",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [ @epidemic ],
:region => @europe,
:image => "",
:slug => "Xg02gFBwAL",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "165"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 7 ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "TjrMMz5Edw",
:start_year_uncert => "",
:start_year => "180"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "TjrMMz5Edw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mauri Conquer Rio Tinto and area ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Mauri Conquer Rio Tinto and area ",
:end_year => "200",
:body => "<p>The loss of the

Rio Tinto mines silver output to the Roman empire brought about the crisis of the Third century.
</p><p>
The Mauri conquered the area when the Roman army contracted due to the plague of Antonine.  The plague decimated the army with a 13 to 15 percent loss with the cities suffering similarly while the rural population suffered 7 to 10 percent in loss of life.</p>",
:tag_list => ["RioTinto"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "LcMVJysEw6",
:start_year_uncert => "",
:start_year => "180"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mauri Conquer Rio Tinto and area ",
:end_year => "200",
:body => "<p>The loss of the

Rio Tinto mines silver output to the Roman empire brought about the crisis of the Third century.
</p><p>
The Mauri conquered the area when the Roman army contracted due to the plague of Antonine.  The plague decimated the army with a 13 to 15 percent loss with the cities suffering similarly while the rural population suffered 7 to 10 percent in loss of life.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "LcMVJysEw6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginnings of Serfdom and Manorialism ", :start_year => 284)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginnings of Serfdom and Manorialism ",
:end_year => "",
:body => "<p>
The destruction of the safe transport system lead to a drop in products getting to cities.  
Such a drop drove the poor into the country side seeking food and protection.  They formed the first coloni - people bound to the land by law.
</p><p>
The disappearance of consistent trade goods lead many land owners to create manors where all goods needed by the manor were produced.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "qaGjekpAk7",
:start_year_uncert => "",
:start_year => "284"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginnings of Serfdom and Manorialism ",
:end_year => "",
:body => "<p>
The destruction of the safe transport system lead to a drop in products getting to cities.  
Such a drop drove the poor into the country side seeking food and protection.  They formed the first coloni - people bound to the land by law.
</p><p>
The disappearance of consistent trade goods lead many land owners to create manors where all goods needed by the manor were produced.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "qaGjekpAk7",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "284"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Start of Migration Period ", :start_year => 300)
if result.length == 0
result = HoloceneEvent.create({:name => "Start of Migration Period ",
:end_year => "",
:body => "<p>
Several smaller volcanic eruptions about this time may have lead to the Age of Migration.  Volcanic eruptions can have an accumulative effect on the climate resulting in a global winter without a single cause.  A 'Winter' would be the straw that broke as at the end of such a 'Winter', a patent starts to see that their eldest child is failing due to lack of nourishment.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "L2mjhB4jdB",
:start_year_uncert => "",
:start_year => "300"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Start of Migration Period ",
:end_year => "",
:body => "<p>
Several smaller volcanic eruptions about this time may have lead to the Age of Migration.  Volcanic eruptions can have an accumulative effect on the climate resulting in a global winter without a single cause.  A 'Winter' would be the straw that broke as at the end of such a 'Winter', a patent starts to see that their eldest child is failing due to lack of nourishment.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "L2mjhB4jdB",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Constantine I - Law reaffirming Coloni(serfdom) ", :start_year => 325)
if result.length == 0
result = HoloceneEvent.create({:name => "Constantine I - Law reaffirming Coloni(serfdom) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "qQqmVbjwvd",
:start_year_uncert => "",
:start_year => "325"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Constantine I - Law reaffirming Coloni(serfdom) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "qQqmVbjwvd",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "325"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Huns force Goths into Roman Empire ", :start_year => 376)
if result.length == 0
result = HoloceneEvent.create({:name => "Huns force Goths into Roman Empire ",
:end_year => "",
:body => "<p>The arriving Huns force the Goths to flee into Roman territories.  Beginning of the Migration-Invasion question as groups try to get out of the way of the Huns.</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "2n4Nqg7HxL",
:start_year_uncert => "",
:start_year => "376"
})
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Huns force Goths into Roman Empire ",
:end_year => "",
:body => "<p>The arriving Huns force the Goths to flee into Roman territories.  Beginning of the Migration-Invasion question as groups try to get out of the way of the Huns.</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "2n4Nqg7HxL",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "376"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Arthur and The Justian Plague ",
:position =>chapter_index,
:slug => "61QCCfhD20",
:book => @book,
:body => "<p>
The cold period lasted 9 years in the tree ring records.
This event left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.
It's ocular density was 2 and a half times the explosion of Tambora (1815).
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Badon Hill ", :start_year => 516)
if result.length == 0
result = HoloceneEvent.create({:name => "Badon Hill ",
:end_year => "",
:body => "<p>
This battle was between the Britons and the Anglo-Saxons in Britain.
There is controversy over the date of this battle as the Anneals Cambriae had an unreliable dating of Easter before 525.
Consider though that such a battle probably would have taken place late summer or early fall when it became obvious that crop failure was dooming even the eldest children of the group.
</p><p>
Given Rabul's location on the globe, a Global 'Winter' would have resulted.
So imagine that the first couple of years when famine was present, the Anglo-Saxons raided some areas of Britain for supplies.
The couple of reasonable years would have eased the need for such raids but not let them be forgotten.
When the cold weather returned in the fourth years, the raids resumed.
The fifth year, the whole Anglo-Saxon presence would have been looking to find anyway to ease the famine and the Britons would not be welcoming.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "https://en.wikipedia.org/wiki/battle_of_badon",
:user_id => @user.id,
:slug => "nwCkG6QxPj",
:start_year_uncert => "",
:start_year => "516"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Badon Hill ",
:end_year => "",
:body => "<p>
This battle was between the Britons and the Anglo-Saxons in Britain.
There is controversy over the date of this battle as the Anneals Cambriae had an unreliable dating of Easter before 525.
Consider though that such a battle probably would have taken place late summer or early fall when it became obvious that crop failure was dooming even the eldest children of the group.
</p><p>
Given Rabul's location on the globe, a Global 'Winter' would have resulted.
So imagine that the first couple of years when famine was present, the Anglo-Saxons raided some areas of Britain for supplies.
The couple of reasonable years would have eased the need for such raids but not let them be forgotten.
When the cold weather returned in the fourth years, the raids resumed.
The fifth year, the whole Anglo-Saxon presence would have been looking to find anyway to ease the famine and the Britons would not be welcoming.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "nwCkG6QxPj",
:url => "https://en.wikipedia.org/wiki/battle_of_badon",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "516"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ",
:end_year => "536",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mgqE99vN9d",
:start_year_uncert => "",
:start_year => "535"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ",
:end_year => "536",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "mgqE99vN9d",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Year of Darkness - global winter ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "a2pUzfZf2G",
:start_year_uncert => "",
:start_year => "535"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "a2pUzfZf2G",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Year of Darkness - total weather affect ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - total weather affect ",
:end_year => "595",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "EyuQz4JdJT",
:start_year_uncert => "",
:start_year => "535"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Year of Darkness - total weather affect ",
:end_year => "595",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "EyuQz4JdJT",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Death of Arthur ", :start_year => 537)
if result.length == 0
result = HoloceneEvent.create({:name => "Death of Arthur ",
:end_year => "",
:body => "<p>
In the Anneals Cambriae entry for 537 states 'The Strife of Camlann in which Arthur and Medraut fell [and there was death in Britain and in Ireland].'
The '[and there was death in Britain and Ireland]' ties the death of Arthur to the deaths resulting from the 535 event.
</p>",
:tag_list => ["Arthur"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "DynZ1WDWMh",
:start_year_uncert => "",
:start_year => "537"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Death of Arthur ",
:end_year => "",
:body => "<p>
In the Anneals Cambriae entry for 537 states 'The Strife of Camlann in which Arthur and Medraut fell [and there was death in Britain and in Ireland].'
The '[and there was death in Britain and Ireland]' ties the death of Arthur to the deaths resulting from the 535 event.
</p>",
:tag_list => ["Arthur"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "DynZ1WDWMh",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "537"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Famine"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FrqXyK3Mqy",
:start_year_uncert => "",
:start_year => "535"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Famine"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "FrqXyK3Mqy",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("annalesulster")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Manchán of Mohill ", :start_year => 464)
if result.length == 0
result = HoloceneEvent.create({:name => "Manchán of Mohill ",
:end_year => "538",
:body => "<p>Manchán of Mohill founded many early Christian churches in Ireland.  Died during the Cold/Famine events of the global winter associated with the 535/536 event.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "https://en.wikipedia.org/wiki/manch%c3%a1n_of_mohill",
:user_id => @user.id,
:slug => "pAT5rNkBeK",
:start_year_uncert => "",
:start_year => "464"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Manchán of Mohill ",
:end_year => "538",
:body => "<p>Manchán of Mohill founded many early Christian churches in Ireland.  Died during the Cold/Famine events of the global winter associated with the 535/536 event.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "pAT5rNkBeK",
:url => "https://en.wikipedia.org/wiki/manch%c3%a1n_of_mohill",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "464"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Emmaus ", :start_year => 639)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Emmaus ",
:end_year => "",
:body => "<p>Bubonic Plague struck after conquest by the Rashidun Caliphate who setup a military camp.
</p>",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "XbzK26gzYy",
:start_year_uncert => "",
:start_year => "639"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Emmaus ",
:end_year => "",
:body => "<p>Bubonic Plague struck after conquest by the Rashidun Caliphate who setup a military camp.
</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @europe,
:image => "",
:slug => "XbzK26gzYy",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "639"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Mohill ", :start_year => 544)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Mohill ",
:end_year => "",
:body => "<p>Arrival of Plague in Ireland.
</p>",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @europe,
:image => "",
:url => "https://en.wikipedia.org/wiki/plague_of_mohill",
:user_id => @user.id,
:slug => "88Th7pFLzR",
:start_year_uncert => "",
:start_year => "544"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Mohill ",
:end_year => "",
:body => "<p>Arrival of Plague in Ireland.
</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @europe,
:image => "",
:slug => "88Th7pFLzR",
:url => "https://en.wikipedia.org/wiki/plague_of_mohill",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "544"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread", :start_year => 539)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "nKg8Rt1vA5",
:start_year_uncert => "",
:start_year => "539"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "nKg8Rt1vA5",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "539"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("annalesulster")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Failure of Bread", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "MPFq4pnqhk",
:start_year_uncert => "",
:start_year => "540"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "MPFq4pnqhk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("annalesulster")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Justian Plague.  Second Occurrence of Plague in Europe ", :start_year => 541)
if result.length == 0
result = HoloceneEvent.create({:name => "Justian Plague.  Second Occurrence of Plague in Europe ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mkkaXnB1bF",
:start_year_uncert => "",
:start_year => "541"
})
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Justian Plague.  Second Occurrence of Plague in Europe ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "mkkaXnB1bF",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "541"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "The Little Ice Age ",
:position =>chapter_index,
:slug => "yHBhJx2w2g",
:book => @book,
:body => "<p>
Recent research has provided a model under which an explanation of the Little Ice Age can be explained.  
The model shows that with a volcanic explosion in 1253 started a chain of events including three other volcanic explosions over the next two hundred years.  
</p><p>
The accumulation of volcanic ash and sulfur dioxide resulted in the cold events of the 1400s to the 1900s.  
Such climate events influenced the development of European exploration and civilization during the Middle Ages into the Age of Reason.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "The Little Ice Age ", :start_year => 1253)
if result.length == 0
result = HoloceneEvent.create({:name => "The Little Ice Age ",
:end_year => "1860",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "V2k1D6K6b9",
:start_year_uncert => "",
:start_year => "1253"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Little Ice Age ",
:end_year => "1860",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "V2k1D6K6b9",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1253"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Little Ice Age starts with a series of volanic eruptions. ", :start_year => 1253)
if result.length == 0
result = HoloceneEvent.create({:name => "Little Ice Age starts with a series of volanic eruptions. ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "DyPc7thftV",
:start_year_uncert => "",
:start_year => "1253"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Little Ice Age starts with a series of volanic eruptions. ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "DyPc7thftV",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1253"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginning of Little Ice Age ", :start_year => 1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "kEzrLfJtSE",
:start_year_uncert => "",
:start_year => "1550"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "kEzrLfJtSE",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1550"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Cold Point of Little Ice Age ", :start_year => 1650)
if result.length == 0
result = HoloceneEvent.create({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "r37gQFcCmV",
:start_year_uncert => "",
:start_year => "1650"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "r37gQFcCmV",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1650"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Second Cold Point of Little Ice Age ", :start_year => 1770)
if result.length == 0
result = HoloceneEvent.create({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "4CeDySn08b",
:start_year_uncert => "",
:start_year => "1770"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "4CeDySn08b",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1770"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ", :start_year => 1783)
if result.length == 0
result = HoloceneEvent.create({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ypgzzg0184",
:start_year_uncert => "",
:start_year => "1783"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "ypgzzg0184",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1783"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Third Cold Point of the Little Ice Age ", :start_year => 1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "29wJE7sG6A",
:start_year_uncert => "",
:start_year => "1850"
})
@timeline.holocene_events << result
@little_ice_age_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "29wJE7sG6A",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1850"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = Chapter.create({:name => "Bond Event 0 ",
:position =>chapter_index,
:slug => "3gjN0jvPAa",
:book => @book,
:body => "<p>
 
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Chapter.create({:name => "Cultural Events ",
:position =>chapter_index,
:slug => "TVsADCsybD",
:book => @book,
:body => "<p>Events caused by Man or happeded to Mankind.
</p>"
})
res = Partition.create({
:name => "Timelines",
:body => "",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Çatalhöyük ", :start_year => -7500)
if result.length == 0
result = HoloceneEvent.create({:name => "Çatalhöyük ",
:end_year => "-5700",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "GvPkx4fpbr",
:start_year_uncert => "",
:start_year => "-7500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Çatalhöyük ",
:end_year => "-5700",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "GvPkx4fpbr",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tell Sabi Abyad ", :start_year => -7550)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Sabi Abyad ",
:end_year => "-1250",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "https://en.wikipedia.org/wiki/tell_sabi_abyad",
:user_id => @user.id,
:slug => "ndrLuBKsKC",
:start_year_uncert => "",
:start_year => "-7550"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Sabi Abyad ",
:end_year => "-1250",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "ndrLuBKsKC",
:url => "https://en.wikipedia.org/wiki/tell_sabi_abyad",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7550"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Oldest pottery in Syria - Tell Sabi Abyad ", :start_year => -6900)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest pottery in Syria - Tell Sabi Abyad ",
:end_year => "-6800",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "https://en.wikipedia.org/wiki/tell_sabi_abyad",
:user_id => @user.id,
:slug => "UD5EGfm1Ys",
:start_year_uncert => "",
:start_year => "-6900"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Oldest pottery in Syria - Tell Sabi Abyad ",
:end_year => "-6800",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "UD5EGfm1Ys",
:url => "https://en.wikipedia.org/wiki/tell_sabi_abyad",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua  ", :start_year => -1485)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua  ",
:end_year => "-1375",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "https://en.wikipedia.org/wiki/battle_of_jericho",
:user_id => @user.id,
:slug => "NxgrJLwAHF",
:start_year_uncert => "",
:start_year => "-1485"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua  ",
:end_year => "-1375",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "NxgrJLwAHF",
:url => "https://en.wikipedia.org/wiki/battle_of_jericho",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1485"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mureybet ", :start_year => -10200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mureybet ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "https://en.wikipedia.org/wiki/mureybet",
:user_id => @user.id,
:slug => "DDDXWqVvU1",
:start_year_uncert => "",
:start_year => "-10200"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mureybet ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "DDDXWqVvU1",
:url => "https://en.wikipedia.org/wiki/mureybet",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Çayönü ", :start_year => -7200)
if result.length == 0
result = HoloceneEvent.create({:name => "Çayönü ",
:end_year => "-6600",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "https://en.wikipedia.org/wiki/%c3%87ay%c3%b6n%c3%bc",
:user_id => @user.id,
:slug => "pAKWqh1Uv6",
:start_year_uncert => "",
:start_year => "-7200"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Çayönü ",
:end_year => "-6600",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "pAKWqh1Uv6",
:url => "https://en.wikipedia.org/wiki/%c3%87ay%c3%b6n%c3%bc",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sweet Track in Britian ", :start_year => -3807)
if result.length == 0
result = HoloceneEvent.create({:name => "Sweet Track in Britian ",
:end_year => "",
:body => "<p>Trackway built over older trackway from 3838 BC.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BjXFDwpceZ",
:start_year_uncert => "",
:start_year => "-3807"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sweet Track in Britian ",
:end_year => "",
:body => "<p>Trackway built over older trackway from 3838 BC.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "BjXFDwpceZ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3807"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Galen ", :start_year => 216)
if result.length == 0
result = HoloceneEvent.create({:name => "Galen ",
:end_year => "",
:body => "<p>Doctor during the Antonine Plague.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "tp1KsKBCdC",
:start_year_uncert => "",
:start_year => "216"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Galen ",
:end_year => "",
:body => "<p>Doctor during the Antonine Plague.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "tp1KsKBCdC",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "216"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Measles emerges as an infectious disease ", :start_year => 500)
if result.length == 0
result = HoloceneEvent.create({:name => "Measles emerges as an infectious disease ",
:end_year => "900",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "26czKQcLB1",
:start_year_uncert => "",
:start_year => "500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Measles emerges as an infectious disease ",
:end_year => "900",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "26czKQcLB1",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Persian physician Rhazes 860–932 ", :start_year => 932)
if result.length == 0
result = HoloceneEvent.create({:name => "Persian physician Rhazes 860–932 ",
:end_year => "",
:body => "<p>The first systematic description of measles, and its distinction from smallpox and chickenpox, in 'The Book of Smallpox and Measles'.
</p>",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Wr6Xv8a7S8",
:start_year_uncert => "",
:start_year => "932"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Persian physician Rhazes 860–932 ",
:end_year => "",
:body => "<p>The first systematic description of measles, and its distinction from smallpox and chickenpox, in 'The Book of Smallpox and Measles'.
</p>",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "Wr6Xv8a7S8",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "932"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Ogyges ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Ogyges ",
:end_year => "",
:body => "<p>
Plato, Laws, Book III.
</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "w93KZkbk6Z",
:start_year_uncert => "",
:start_year => "-9600"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Ogyges ",
:end_year => "",
:body => "<p>
Plato, Laws, Book III.
</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "w93KZkbk6Z",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chickens reached Europe ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Europe ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "4kH46fTGUz",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chickens reached Europe ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "4kH46fTGUz",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chickens reached Syria ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Syria ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "JZscr5TrJu",
:start_year_uncert => "",
:start_year => "-2000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chickens reached Syria ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "JZscr5TrJu",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chickens reached Egypt ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "d7wzmvydwH",
:start_year_uncert => "",
:start_year => "-1400"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chickens reached Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "d7wzmvydwH",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "China/Harappan origins of Chickens ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "China/Harappan origins of Chickens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @fareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ee8xNYPrRF",
:start_year_uncert => "",
:start_year => "-6000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "China/Harappan origins of Chickens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @fareast,
:image => "",
:slug => "ee8xNYPrRF",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Signs of Tuberculosis in humans ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Signs of Tuberculosis in humans ",
:end_year => "",
:body => "<p>Acquired from domesticated animals</p>",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ghZwWjSaa2",
:start_year_uncert => "",
:start_year => "-4000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Signs of Tuberculosis in humans ",
:end_year => "",
:body => "<p>Acquired from domesticated animals</p>",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "ghZwWjSaa2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tubercular decay in the spines of Egyptian mummies ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Tubercular decay in the spines of Egyptian mummies ",
:end_year => "-2400",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "V5TeGPWKpe",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tubercular decay in the spines of Egyptian mummies ",
:end_year => "-2400",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "V5TeGPWKpe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "One in four deaths in England was due to 'consumption'/Tuberculosis ", :start_year => 1815)
if result.length == 0
result = HoloceneEvent.create({:name => "One in four deaths in England was due to 'consumption'/Tuberculosis ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "CbcQ7zkRde",
:start_year_uncert => "",
:start_year => "1815"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "One in four deaths in England was due to 'consumption'/Tuberculosis ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "CbcQ7zkRde",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1815"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Oldest skeletal evidence for Leprosy ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest skeletal evidence for Leprosy ",
:end_year => "",
:body => "<p>Found in human remains from the archaeological sites of Balathal in India and Harappa in Pakistan</p>",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "nCUE1ptbyg",
:start_year_uncert => "",
:start_year => "-2000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Oldest skeletal evidence for Leprosy ",
:end_year => "",
:body => "<p>Found in human remains from the archaeological sites of Balathal in India and Harappa in Pakistan</p>",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @eurasia,
:image => "",
:slug => "nCUE1ptbyg",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Leprosy probably did not exist in Greece or the Middle East before Common Era ", :start_year => 1)
if result.length == 0
result = HoloceneEvent.create({:name => "Leprosy probably did not exist in Greece or the Middle East before Common Era ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "q1S7v7ANG5",
:start_year_uncert => "",
:start_year => "1"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leprosy probably did not exist in Greece or the Middle East before Common Era ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "q1S7v7ANG5",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Hippocrates describes Leprosy ", :start_year => -460)
if result.length == 0
result = HoloceneEvent.create({:name => "Hippocrates describes Leprosy ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "D1CFrht6Z9",
:start_year_uncert => "",
:start_year => "-460"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hippocrates describes Leprosy ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "D1CFrht6Z9",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-460"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pigs were domesticated from wild boar ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Pigs were domesticated from wild boar ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "3Q0KSuy5Rs",
:start_year_uncert => "",
:start_year => "-12700"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pigs were domesticated from wild boar ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "3Q0KSuy5Rs",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Horses ", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Horses ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "https://en.wikipedia.org/wiki/domestication_of_the_horse",
:user_id => @user.id,
:slug => "n401a0GSgz",
:start_year_uncert => "",
:start_year => "-3500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Horses ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "n401a0GSgz",
:url => "https://en.wikipedia.org/wiki/domestication_of_the_horse",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dog buried inside of human dwellings ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Dog buried inside of human dwellings ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "QFXc7uSC3K",
:start_year_uncert => "",
:start_year => "-12700"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dog buried inside of human dwellings ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @eurasia,
:image => "",
:slug => "QFXc7uSC3K",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Two distinct dog branches - East and West ", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Two distinct dog branches - East and West ",
:end_year => "-4400",
:body => "<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "uhYhrXVYTr",
:start_year_uncert => "",
:start_year => "-12000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Two distinct dog branches - East and West ",
:end_year => "-4400",
:body => "<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @eurasia,
:image => "",
:slug => "uhYhrXVYTr",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Sheep ", :start_year => -11000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Sheep ",
:end_year => "-9000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "nCZ03WesjY",
:start_year_uncert => "",
:start_year => "-11000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Sheep ",
:end_year => "-9000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "nCZ03WesjY",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-11000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Goats ", :start_year => -7000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Goats ",
:end_year => "-6000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "NAb3kKXnkN",
:start_year_uncert => "",
:start_year => "-7000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Goats ",
:end_year => "-6000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "NAb3kKXnkN",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Cats ", :start_year => -7500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Cats ",
:end_year => "-7000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ERya3THaXQ",
:start_year_uncert => "",
:start_year => "-7500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Cats ",
:end_year => "-7000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "ERya3THaXQ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Hunter/Gatherer Agriculture ", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Hunter/Gatherer Agriculture ",
:end_year => "-10900",
:body => "<p>The first agriculture or selection of plants for food to carry started with wild grains as the groups moved across the landscape.
</p><p>This ended with the Colvis Impact.  The Younger Dryus pushed the growing zones for grain more southward.  Starvation and the 
abandonment of settlements as the people moved around to find food.  Their movement and attempts to find grain caused them to try to grow
it where conditions seemed right creating true agriculture.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "x0dtc4N5qM",
:start_year_uncert => "",
:start_year => "-12000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hunter/Gatherer Agriculture ",
:end_year => "-10900",
:body => "<p>The first agriculture or selection of plants for food to carry started with wild grains as the groups moved across the landscape.
</p><p>This ended with the Colvis Impact.  The Younger Dryus pushed the growing zones for grain more southward.  Starvation and the 
abandonment of settlements as the people moved around to find food.  Their movement and attempts to find grain caused them to try to grow
it where conditions seemed right creating true agriculture.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eurasia,
:image => "",
:slug => "x0dtc4N5qM",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The eight Neolithic founder crops ", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "The eight Neolithic founder crops ",
:end_year => "",
:body => "<p> The crops were the first to be domesticated: emmer and einkorn wheat, hulled barley, peas, lentils, bitter vetch, chick peas and flax.
The first cultivation was in the Levant.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "dRjykjXJ9V",
:start_year_uncert => "",
:start_year => "-9500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The eight Neolithic founder crops ",
:end_year => "",
:body => "<p> The crops were the first to be domesticated: emmer and einkorn wheat, hulled barley, peas, lentils, bitter vetch, chick peas and flax.
The first cultivation was in the Levant.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "dRjykjXJ9V",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Atlantus sinks beneath the waves ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Atlantus sinks beneath the waves ",
:end_year => "",
:body => "<p>Gobekli Tepe gives credance of an advanced civilization which sank beneath the wave of the sea.
The survivors went to Gobekli Tepe.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "DYhmbRHfcD",
:start_year_uncert => "",
:start_year => "-9600"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Atlantus sinks beneath the waves ",
:end_year => "",
:body => "<p>Gobekli Tepe gives credance of an advanced civilization which sank beneath the wave of the sea.
The survivors went to Gobekli Tepe.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "DYhmbRHfcD",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Battle of Kedesh ", :start_year => -1274)
if result.length == 0
result = HoloceneEvent.create({:name => "Battle of Kedesh ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "sg4yqN5Yq6",
:start_year_uncert => "",
:start_year => "-1274"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Battle of Kedesh ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "sg4yqN5Yq6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1274"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Clovis Comet ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "bF7VY44pZH",
:start_year_uncert => "",
:start_year => "-10900"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "bF7VY44pZH",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level III ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level III ",
:end_year => "-8800",
:body => "<p>The light from the Clovis Comet event would have brought to the attention of mankind the animals of the night in a prolonged way.  This allowed for an understanding based on sight.  The animals and insects would not have been affected by the night brightness and would have continued their diurnal activities.
</p><p>
Consider that mankind on the plains of the Anatolia region would have had structures which where partially embedded in the earth.  This was an insulation feature due to the winter cold.
</p><p>
During the Clovis Event illumination, the tops of the structures would have been removed to use the light.  This would present a view of the sky and the earth around the habitation.
</p><p>
A group remembrance of this would have lead to recreations of such an event with the ribs of the habitation's structure, the animals seen and the night sky.</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mBwA15vgMD",
:start_year_uncert => "",
:start_year => "-9600"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level III ",
:end_year => "-8800",
:body => "<p>The light from the Clovis Comet event would have brought to the attention of mankind the animals of the night in a prolonged way.  This allowed for an understanding based on sight.  The animals and insects would not have been affected by the night brightness and would have continued their diurnal activities.
</p><p>
Consider that mankind on the plains of the Anatolia region would have had structures which where partially embedded in the earth.  This was an insulation feature due to the winter cold.
</p><p>
During the Clovis Event illumination, the tops of the structures would have been removed to use the light.  This would present a view of the sky and the earth around the habitation.
</p><p>
A group remembrance of this would have lead to recreations of such an event with the ribs of the habitation's structure, the animals seen and the night sky.</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "mBwA15vgMD",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Cows ", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Cows ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "https://en.wikipedia.org/wiki/cattle",
:user_id => @user.id,
:slug => "eGgNyERG06",
:start_year_uncert => "",
:start_year => "-9500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Cows ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "eGgNyERG06",
:url => "https://en.wikipedia.org/wiki/cattle",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level II ", :start_year => -8800)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "fRbY9n9tRt",
:start_year_uncert => "",
:start_year => "-8800"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "fRbY9n9tRt",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Dardanus ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Dardanus ",
:end_year => "",
:body => "<p>The story of the flood of Dardanus states that Dardanus survived on the  mountain which became Samothraki island in the Aegean sea.  The date for the flooding of the Samothraki plateau is about 8,500 BC.</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "tCU6NaBHKf",
:start_year_uncert => "",
:start_year => "-8500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Dardanus ",
:end_year => "",
:body => "<p>The story of the flood of Dardanus states that Dardanus survived on the  mountain which became Samothraki island in the Aegean sea.  The date for the flooding of the Samothraki plateau is about 8,500 BC.</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "tCU6NaBHKf",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginnings of grain agriculture ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginnings of grain agriculture ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "bHhC1Lp4e8",
:start_year_uncert => "",
:start_year => "-8300"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginnings of grain agriculture ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "bHhC1Lp4e8",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level I ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "5bX093gqkr",
:start_year_uncert => "",
:start_year => "-8000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "5bX093gqkr",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Monolith worked on at submerged site south of Sicily ", :start_year => -7350)
if result.length == 0
result = HoloceneEvent.create({:name => "Monolith worked on at submerged site south of Sicily ",
:end_year => "",
:body => "<p>Pantelleria Vecchia Bank</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "kyHUte4cPA",
:start_year_uncert => "",
:start_year => "-7350"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Monolith worked on at submerged site south of Sicily ",
:end_year => "",
:body => "<p>Pantelleria Vecchia Bank</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "kyHUte4cPA",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7350"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nevali Cori ", :start_year => -8400)
if result.length == 0
result = HoloceneEvent.create({:name => "Nevali Cori ",
:end_year => "-8100",
:body => "<p>The site is known for having some of the world's oldest known temples and monumental sculpture. Together with the earlier site of Göbekli Tepe, it has revolutionised scientific understanding of the Eurasian Neolithic period. The oldest domesticated Einkorn wheat was found there
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "bnxw1zbcdP",
:start_year_uncert => "",
:start_year => "-8400"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nevali Cori ",
:end_year => "-8100",
:body => "<p>The site is known for having some of the world's oldest known temples and monumental sculpture. Together with the earlier site of Göbekli Tepe, it has revolutionised scientific understanding of the Eurasian Neolithic period. The oldest domesticated Einkorn wheat was found there
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:image => "",
:slug => "bnxw1zbcdP",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Çayönü Tepesi ", :start_year => -7200)
if result.length == 0
result = HoloceneEvent.create({:name => "Çayönü Tepesi ",
:end_year => "-6600",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "1p6UG2bsrH",
:start_year_uncert => "",
:start_year => "-7200"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Çayönü Tepesi ",
:end_year => "-6600",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "1p6UG2bsrH",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sphinx created in Egypt ", :start_year => -10500)
if result.length == 0
result = HoloceneEvent.create({:name => "Sphinx created in Egypt ",
:end_year => "",
:body => "<p>This age is based on the fact that the rising constilation at the time the Sphinx was created is Leo.  It is argued that the Sphinx as it is now
is modified by later dynasties to resemble man instead of a lion.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "QD6CAUx5tk",
:start_year_uncert => "",
:start_year => "-10500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sphinx created in Egypt ",
:end_year => "",
:body => "<p>This age is based on the fact that the rising constilation at the time the Sphinx was created is Leo.  It is argued that the Sphinx as it is now
is modified by later dynasties to resemble man instead of a lion.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "QD6CAUx5tk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Possible water damage to the sphinx with impact from Burkle Crater ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Possible water damage to the sphinx with impact from Burkle Crater ",
:end_year => "",
:body => "<p>The Water erosion hypothesis says that they is evidence of water erosion in the quary from which the Sphinx was created.  It gives no date for the water fall. 
I would content that Noah's flood was a major cause of the erosion.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "cykPPwWwrb",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Possible water damage to the sphinx with impact from Burkle Crater ",
:end_year => "",
:body => "<p>The Water erosion hypothesis says that they is evidence of water erosion in the quary from which the Sphinx was created.  It gives no date for the water fall. 
I would content that Noah's flood was a major cause of the erosion.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "cykPPwWwrb",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Ocean going boats ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "First Ocean going boats ",
:end_year => "",
:body => "<p>The first ocean going boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area.</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "S2W0AhmwSy",
:start_year_uncert => "",
:start_year => "-5000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Ocean going boats ",
:end_year => "",
:body => "<p>The first ocean going boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area.</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eurasia,
:image => "",
:slug => "S2W0AhmwSy",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Copper Mining at Rio Tinto, Spain ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Copper Mining at Rio Tinto, Spain ",
:end_year => "",
:body => "<p>
Rio Tinto is the oldest mine in use in the western hemisphere.  It's importance in history has been over looked.  Perhaps due to it's remoteness with Spain itself, its story is reduced.
</p><p>
Rio Tinto was mined by Neolithic man starting at least 3,000 BC.  A stone hoe was found at excavations at the site.</p>",
:tag_list => ["RioTinto"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "HpjUGE1GB4",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Copper Mining at Rio Tinto, Spain ",
:end_year => "",
:body => "<p>
Rio Tinto is the oldest mine in use in the western hemisphere.  It's importance in history has been over looked.  Perhaps due to it's remoteness with Spain itself, its story is reduced.
</p><p>
Rio Tinto was mined by Neolithic man starting at least 3,000 BC.  A stone hoe was found at excavations at the site.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "HpjUGE1GB4",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Start of Mayan Calendar ", :start_year => -3114)
if result.length == 0
result = HoloceneEvent.create({:name => "Start of Mayan Calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @centralamerica,
:image => "",
:url => "https://en.wikipedia.org/wiki/maya_calendar",
:user_id => @user.id,
:slug => "MFGmPQVb2M",
:start_year_uncert => "",
:start_year => "-3114"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Start of Mayan Calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @centralamerica,
:image => "",
:slug => "MFGmPQVb2M",
:url => "https://en.wikipedia.org/wiki/maya_calendar",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3114"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Tinto Smelting recorded in Ice Cores ", :start_year => -2475)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Tinto Smelting recorded in Ice Cores ",
:end_year => "-2275",
:body => "<p>Mining stopped with  the exhaustion of the forests.</p>",
:tag_list => ["RioTinto"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ZFqQ8ns5y5",
:start_year_uncert => "",
:start_year => "-2475"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Tinto Smelting recorded in Ice Cores ",
:end_year => "-2275",
:body => "<p>Mining stopped with  the exhaustion of the forests.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "ZFqQ8ns5y5",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2475"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "End of Rio Tinto Smelting - Deforestation ", :start_year => -2275)
if result.length == 0
result = HoloceneEvent.create({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "<p>The end of the smelting at 

Rio Tinto was due to the deforestation of the surrounding areas.</p>",
:tag_list => ["RioTinto"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BuLXA4tkd7",
:start_year_uncert => "",
:start_year => "-2275"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "<p>The end of the smelting at 

Rio Tinto was due to the deforestation of the surrounding areas.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "BuLXA4tkd7",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2275"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Abraham - The first Monotheist ", :start_year => -2166)
if result.length == 0
result = HoloceneEvent.create({:name => "Abraham - The first Monotheist ",
:end_year => "-1991",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "unMy1Qfxy2",
:start_year_uncert => "",
:start_year => "-2166"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Abraham - The first Monotheist ",
:end_year => "-1991",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "unMy1Qfxy2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2166"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Phoenicians arrive at Rio Tinto ", :start_year => -1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "<p>Phoenicians begin trading with the Tartessians at
Rio Tinto.</p>",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "4869fWSQA1",
:start_year_uncert => "",
:start_year => "-1100"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "<p>Phoenicians begin trading with the Tartessians at
Rio Tinto.</p>",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "4869fWSQA1",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Leather Bellows ", :start_year => -900)
if result.length == 0
result = HoloceneEvent.create({:name => "Leather Bellows ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ZmwCRPZ2tW",
:start_year_uncert => "",
:start_year => "-900"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leather Bellows ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:image => "",
:slug => "ZmwCRPZ2tW",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Tinto as King Solomon\'s mines ", :start_year => -971)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Tinto as King Solomon\'s mines ",
:end_year => "-931",
:body => "",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "c95XQt6AnG",
:start_year_uncert => "",
:start_year => "-971"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Tinto as King Solomon\'s mines ",
:end_year => "-931",
:body => "",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "c95XQt6AnG",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-971"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Solon ", :start_year => -638)
if result.length == 0
result = HoloceneEvent.create({:name => "Solon ",
:end_year => "-558",
:body => "",
:tag_list => ["Atlantis"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "G7Z5WfJsdj",
:start_year_uncert => "",
:start_year => "-638"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Solon ",
:end_year => "-558",
:body => "",
:tag_list => ["Atlantis"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "G7Z5WfJsdj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-638"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carthaginians Arrive at Rio Tinto ", :start_year => -535)
if result.length == 0
result = HoloceneEvent.create({:name => "Carthaginians Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "hRgFzc8NzZ",
:start_year_uncert => "",
:start_year => "-535"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carthaginians Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "hRgFzc8NzZ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-535"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grafting practice for grapevines ", :start_year => -500)
if result.length == 0
result = HoloceneEvent.create({:name => "Grafting practice for grapevines ",
:end_year => "",
:body => "<p>
The Mishna describes grafting as a commonplace technique used to grow grapevines.
</p>",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:image => "",
:url => "https://en.wikipedia.org/wiki/grafting",
:user_id => @user.id,
:slug => "mCMd3eQsqn",
:start_year_uncert => "",
:start_year => "-500"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grafting practice for grapevines ",
:end_year => "",
:body => "<p>
The Mishna describes grafting as a commonplace technique used to grow grapevines.
</p>",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @middleeast,
:image => "",
:slug => "mCMd3eQsqn",
:url => "https://en.wikipedia.org/wiki/grafting",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Athens ", :start_year => -430)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Athens ",
:end_year => "",
:body => "<p>
Typhus appears amoung the Athenians.</p>",
:tag_list => ["Disease", "Epidemic", "Typhus"],
:event_types => [  @epidemic ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "FhsgS9GRcz",
:start_year_uncert => "",
:start_year => "-430"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Athens ",
:end_year => "",
:body => "<p>
Typhus appears amoung the Athenians.</p>",
:tag_list => ["Disease", "Epidemic", "Typhus"],
:event_types => [ @epidemic ],
:region => @europe,
:image => "",
:slug => "FhsgS9GRcz",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-430"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Skara Brae inundated", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Skara Brae inundated",
:end_year => "",
:body => "<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  It is possible that it was buried by a tsumani as well.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "RUZSfxAaJx",
:start_year_uncert => "",
:start_year => "-2200"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Skara Brae inundated",
:end_year => "",
:body => "<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  It is possible that it was buried by a tsumani as well.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "RUZSfxAaJx",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Cyprian ", :start_year => 251)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Cyprian ",
:end_year => "270",
:body => "<p>Second appearance of Smallpox.
 This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.</p>",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [  @cultural,@epidemic ] ,
:region => @africa,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ty83eAaVKb",
:start_year_uncert => "",
:start_year => "251"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Cyprian ",
:end_year => "270",
:body => "<p>Second appearance of Smallpox.
 This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.</p>",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [ @cultural,@epidemic ],
:region => @africa,
:image => "",
:slug => "ty83eAaVKb",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "251"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Final collapse of the Roman Empire ", :start_year => 600)
if result.length == 0
result = HoloceneEvent.create({:name => "Final collapse of the Roman Empire ",
:end_year => "",
:body => "<p>
Lost of 'Noblest third' of population.
Loss of complexity.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "NPXWDfbQPj",
:start_year_uncert => "",
:start_year => "600"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Final collapse of the Roman Empire ",
:end_year => "",
:body => "<p>
Lost of 'Noblest third' of population.
Loss of complexity.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "NPXWDfbQPj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "End of Migration Period ", :start_year => 700)
if result.length == 0
result = HoloceneEvent.create({:name => "End of Migration Period ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BaWE6ErQeN",
:start_year_uncert => "",
:start_year => "700"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "End of Migration Period ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "BaWE6ErQeN",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Great Famine ", :start_year => 1315)
if result.length == 0
result = HoloceneEvent.create({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => ["Historical", "Famine"],
:event_types => [  @cultural ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ARtX5t9tUe",
:start_year_uncert => "",
:start_year => "1315"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => ["Historical", "Famine"],
:event_types => [ @cultural ],
:region => @europe,
:image => "",
:slug => "ARtX5t9tUe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1315"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Black Death - The third occurance of Plague in Europe", :start_year => 1347)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Death - The third occurance of Plague in Europe",
:end_year => "1351",
:body => "<p>Third Occurrence of Plague in Europe.  Estimated 50% reducation in the population.
</p>",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @cultural,@epidemic ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "rHqLSMbdQt",
:start_year_uncert => "",
:start_year => "1347"
})
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Death - The third occurance of Plague in Europe",
:end_year => "1351",
:body => "<p>Third Occurrence of Plague in Europe.  Estimated 50% reducation in the population.
</p>",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @cultural,@epidemic ],
:region => @europe,
:image => "",
:slug => "rHqLSMbdQt",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1347"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("cantor2001")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("ziegler1969")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = Chapter.create({:name => "Time line ",
:position =>chapter_index,
:slug => "c8XjJAkADt",
:book => @book,
:body => "<p>Earth related events such as volcanic eruptions, earthquakes, tsunamis, impact events, etc.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Electromagnetic storm from the Sun sets off magnetic mines off the coast of Vietnam. ", :start_year => 1972)
if result.length == 0
result = HoloceneEvent.create({:name => "Electromagnetic storm from the Sun sets off magnetic mines off the coast of Vietnam. ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [  @earth ] ,
:region => @southeastasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "VpFGdQAbGe",
:start_year_uncert => "",
:start_year => "1972"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Electromagnetic storm from the Sun sets off magnetic mines off the coast of Vietnam. ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [ @earth ],
:region => @southeastasia,
:image => "",
:slug => "VpFGdQAbGe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1972"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "<p>Kicked out of Eden the first time.
</p>",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "czdKSQx8nx",
:start_year_uncert => "",
:start_year => "-16000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "<p>Kicked out of Eden the first time.
</p>",
:tag_list => [],
:event_types => [ @earth ],
:region => @middleeast,
:image => "",
:slug => "czdKSQx8nx",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Zerelia West and Zerelia East ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Zerelia West and Zerelia East ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "rwPQkQJNDg",
:start_year_uncert => "",
:start_year => "-5000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zerelia West and Zerelia East ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "rwPQkQJNDg",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Boxhole ", :start_year => -3400)
if result.length == 0
result = HoloceneEvent.create({:name => "Boxhole ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BemUDBLGHH",
:start_year_uncert => "",
:start_year => "-3400"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Boxhole ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @australasia,
:image => "",
:slug => "BemUDBLGHH",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Morasko ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Morasko ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "xEM2CxyHYT",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Morasko ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "xEM2CxyHYT",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kachchh (Luna) ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Kachchh (Luna) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "fGvgUnyTZ6",
:start_year_uncert => "",
:start_year => "-2000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kachchh (Luna) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @eurasia,
:image => "",
:slug => "fGvgUnyTZ6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Svetloyar lake ", :start_year => -600)
if result.length == 0
result = HoloceneEvent.create({:name => "Svetloyar lake ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ksFX8uHsj6",
:start_year_uncert => "",
:start_year => "-600"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Svetloyar lake ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @eurasia,
:image => "",
:slug => "ksFX8uHsj6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Merewether ", :start_year => 1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Merewether ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @northamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "hN57xGMzu7",
:start_year_uncert => "",
:start_year => "1100"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Merewether ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @northamerica,
:image => "",
:slug => "hN57xGMzu7",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ak-Bura (Murgab) ", :start_year => 1700)
if result.length == 0
result = HoloceneEvent.create({:name => "Ak-Bura (Murgab) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "A2CPr8SLJP",
:start_year_uncert => "",
:start_year => "1700"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ak-Bura (Murgab) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @eurasia,
:image => "",
:slug => "A2CPr8SLJP",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lake Cheko ", :start_year => 1908)
if result.length == 0
result = HoloceneEvent.create({:name => "Lake Cheko ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @fareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Ep9K7xAtWM",
:start_year_uncert => "",
:start_year => "1908"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lake Cheko ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @fareast,
:image => "",
:slug => "Ep9K7xAtWM",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1908"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Curuçá astrobleme ", :start_year => 1930)
if result.length == 0
result = HoloceneEvent.create({:name => "Curuçá astrobleme ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @southamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "9YhHVjdY9T",
:start_year_uncert => "",
:start_year => "1930"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Curuçá astrobleme ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @southamerica,
:image => "",
:slug => "9YhHVjdY9T",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1930"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tsunami at Tartessos area ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => ["Tartessos", "Tsunami"],
:event_types => [  @earth ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "bhzP0AVrFe",
:start_year_uncert => "",
:start_year => "-1500"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => ["Tartessos", "Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:image => "",
:slug => "bhzP0AVrFe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sirente Italy ", :start_year => 320)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Italy ",
:end_year => "",
:body => "<p>This event may be the cause of Roman emperor Constantine's vision at Milvian Bridge.
</p><p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "A9cNxyUb69",
:start_year_uncert => "90",
:start_year => "320"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Italy ",
:end_year => "",
:body => "<p>This event may be the cause of Roman emperor Constantine's vision at Milvian Bridge.
</p><p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "A9cNxyUb69",
:url => "",
:user_id => @user.id,
:start_year_uncert => "90",
:start_year => "320"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 9 - Colvis Impact Event ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "qCh439Pydn",
:start_year_uncert => "",
:start_year => "-10900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "qCh439Pydn",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Clovis Comet ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @northamerica,
:image => "",
:url => "https://en.wikipedia.org/wiki/younger_dryas_impact_hypothesis",
:user_id => @user.id,
:slug => "R5Dy5Y00gc",
:start_year_uncert => "",
:start_year => "-10900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @northamerica,
:image => "",
:slug => "R5Dy5Y00gc",
:url => "https://en.wikipedia.org/wiki/younger_dryas_impact_hypothesis",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Burckle Crater ", :start_year => -2800)
if result.length == 0
result = HoloceneEvent.create({:name => "Burckle Crater ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "hKdTvDDMuP",
:start_year_uncert => "",
:start_year => "-2800"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burckle Crater ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @global,
:image => "",
:slug => "hKdTvDDMuP",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Campo del Cielo Crater ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @southamerica,
:image => "",
:url => "https://en.wikipedia.org/wiki/campo_del_cielo",
:user_id => @user.id,
:slug => "6GyCphkXwE",
:start_year_uncert => "",
:start_year => "-2000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @southamerica,
:image => "",
:slug => "6GyCphkXwE",
:url => "https://en.wikipedia.org/wiki/campo_del_cielo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carancas Impact Crater ", :start_year => 2007)
if result.length == 0
result = HoloceneEvent.create({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @southamerica,
:image => "",
:url => "https://en.wikipedia.org/wiki/2007_carancas_impact_event",
:user_id => @user.id,
:slug => "vAFYxnuks1",
:start_year_uncert => "",
:start_year => "2007"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @southamerica,
:image => "",
:slug => "vAFYxnuks1",
:url => "https://en.wikipedia.org/wiki/2007_carancas_impact_event",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2007"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chelyabinsk meteor ", :start_year => 2013)
if result.length == 0
result = HoloceneEvent.create({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @global,
:image => "",
:url => "https://en.wikipedia.org/wiki/chelyabinsk_meteor",
:user_id => @user.id,
:slug => "4Bv7UzFrNf",
:start_year_uncert => "",
:start_year => "2013"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @impact ],
:region => @global,
:image => "",
:slug => "4Bv7UzFrNf",
:url => "https://en.wikipedia.org/wiki/chelyabinsk_meteor",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2013"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grendel Crater ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ACpDmXTNa7",
:start_year_uncert => "",
:start_year => "536"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "ACpDmXTNa7",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Haviland Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @northamerica,
:image => "",
:url => "https://en.wikipedia.org/wiki/haviland_crater",
:user_id => @user.id,
:slug => "7C5PxVkEZz",
:start_year_uncert => "",
:start_year => "1000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @northamerica,
:image => "",
:slug => "7C5PxVkEZz",
:url => "https://en.wikipedia.org/wiki/haviland_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Henbury Meteorites Conservation Reserve ", :start_year => -2700)
if result.length == 0
result = HoloceneEvent.create({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @australasia,
:image => "",
:url => "https://en.wikipedia.org/wiki/henbury_meteorites_conservation_reserve",
:user_id => @user.id,
:slug => "cphgHmY0Pw",
:start_year_uncert => "",
:start_year => "-2700"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @australasia,
:image => "",
:slug => "cphgHmY0Pw",
:url => "https://en.wikipedia.org/wiki/henbury_meteorites_conservation_reserve",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilumetsa Crater ", :start_year => -4600)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "https://en.wikipedia.org/wiki/ilumetsa_crater",
:user_id => @user.id,
:slug => "ss83S35gYy",
:start_year_uncert => "",
:start_year => "-4600"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "ss83S35gYy",
:url => "https://en.wikipedia.org/wiki/ilumetsa_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Morasko Meterorite Nature Reseve ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @europe,
:image => "220px-morasko_krater_zima.jpg",
:url => "https://en.wikipedia.org/wiki/morasko_meteorite_nature_reserve",
:user_id => @user.id,
:slug => "eNyfFyQSKj",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @europe,
:image => "220px-morasko_krater_zima.jpg",
:slug => "eNyfFyQSKj",
:url => "https://en.wikipedia.org/wiki/morasko_meteorite_nature_reserve",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Caurto Craters ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @southamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "p3Y6neMgvC",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @southamerica,
:image => "",
:slug => "p3Y6neMgvC",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sirente Crater ", :start_year => 312)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "E0a24zqqpm",
:start_year_uncert => "",
:start_year => "312"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "E0a24zqqpm",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "312"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sobolev Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mL17Jb3ezV",
:start_year_uncert => "",
:start_year => "1000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @eurasia,
:image => "",
:slug => "mL17Jb3ezV",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tai Hu Lake ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @centralasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "StRHUa8xTZ",
:start_year_uncert => "",
:start_year => "-2500"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @centralasia,
:image => "",
:slug => "StRHUa8xTZ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wabar Craters ", :start_year => 1863)
if result.length == 0
result = HoloceneEvent.create({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @middleeast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "eax37UmBc3",
:start_year_uncert => "",
:start_year => "1863"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @middleeast,
:image => "",
:slug => "eax37UmBc3",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1863"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kamil Crater ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "D3BGWBPaYG",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @australasia,
:image => "",
:slug => "D3BGWBPaYG",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Whitecourt Crater ", :start_year => 1105)
if result.length == 0
result = HoloceneEvent.create({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @northamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "fXzX6rxwDj",
:start_year_uncert => "",
:start_year => "1105"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @northamerica,
:image => "",
:slug => "fXzX6rxwDj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1105"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dalgaranga crater ", :start_year => -1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "GQeNv9dCkY",
:start_year_uncert => "",
:start_year => "-1000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @australasia,
:image => "",
:slug => "GQeNv9dCkY",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Younger Dryas ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "<p>This event was a 1,300 year cold event as waters from the ice plateau covering North America flowed into the Atlantic basin shutting down the Gulf stream.
</p>",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "f1ZDPUeM3v",
:start_year_uncert => "70",
:start_year => "-10900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "<p>This event was a 1,300 year cold event as waters from the ice plateau covering North America flowed into the Atlantic basin shutting down the Gulf stream.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "f1ZDPUeM3v",
:url => "",
:user_id => @user.id,
:start_year_uncert => "70",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Older Peron ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Older Peron ",
:end_year => "-4100",
:body => "<p>High point in sea levels during the Holocene.
</p>",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "6sjtf2eedJ",
:start_year_uncert => "",
:start_year => "-5000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Older Peron ",
:end_year => "-4100",
:body => "<p>High point in sea levels during the Holocene.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "6sjtf2eedJ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Younger Peron Transgression ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "<p>Second highest point in sea levels during the Holocene.
</p>",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "f8qsMed38p",
:start_year_uncert => "",
:start_year => "-4000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "<p>Second highest point in sea levels during the Holocene.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "f8qsMed38p",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 8 - End of Younger Dryas ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "<p>The Gulf Stream resumes.</p>",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BTwxHRsE3t",
:start_year_uncert => "",
:start_year => "-9100"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "<p>The Gulf Stream resumes.</p>",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "BTwxHRsE3t",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+", :start_year => -7480)
if result.length == 0
result = HoloceneEvent.create({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "280px-lvinaya_past_20070718011232.jpg",
:url => "https://en.wikipedia.org/wiki/lvinaya_past",
:user_id => @user.id,
:slug => "jCbGGR3bCU",
:start_year_uncert => "50",
:start_year => "-7480"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "280px-lvinaya_past_20070718011232.jpg",
:slug => "jCbGGR3bCU",
:url => "https://en.wikipedia.org/wiki/lvinaya_past",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-7480"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bond 7 ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "e12WtZswbK",
:start_year_uncert => "",
:start_year => "-8300"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "e12WtZswbK",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 6 - Erdalen Glacial activity ", :start_year => -7400)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "cbB9GT0859",
:start_year_uncert => "",
:start_year => "-7400"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "cbB9GT0859",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sakura-Jima, Kyushu (Japan) VEI 6+", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-sakurajima55.jpg",
:url => "https://en.wikipedia.org/wiki/sakurajima",
:user_id => @user.id,
:slug => "xkfxfARWdT",
:start_year_uncert => "1000",
:start_year => "-6200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-sakurajima55.jpg",
:slug => "xkfxfARWdT",
:url => "https://en.wikipedia.org/wiki/sakurajima",
:user_id => @user.id,
:start_year_uncert => "1000",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Land Bridge from Siberia to North America sinks ", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Land Bridge from Siberia to North America sinks ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @fareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "KSQ1bhukph",
:start_year_uncert => "",
:start_year => "-12000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Land Bridge from Siberia to North America sinks ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @fareast,
:image => "",
:slug => "KSQ1bhukph",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6", :start_year => 1991)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>I have included this event as it is with in recorded history.  The global temperatures did dip though not as expected.  The discrepancy is due to the general overall warming due to human activity.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Lower north flank and summit</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:slug => "5V31DxhkSj",
:start_year_uncert => "",
:start_year => "1991"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>I have included this event as it is with in recorded history.  The global temperatures did dip though not as expected.  The discrepancy is due to the general overall warming due to human activity.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Lower north flank and summit</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:slug => "5V31DxhkSj",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1991"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Novarupta ", :start_year => 1912)
if result.length == 0
result = HoloceneEvent.create({:name => "Novarupta ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "novarupta.jpg",
:url => "https://en.wikipedia.org/wiki/novarupta",
:user_id => @user.id,
:slug => "Dekvk0kdyc",
:start_year_uncert => "",
:start_year => "1912"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Novarupta ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "novarupta.jpg",
:slug => "Dekvk0kdyc",
:url => "https://en.wikipedia.org/wiki/novarupta",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1912"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santa Maria ", :start_year => 1902)
if result.length == 0
result = HoloceneEvent.create({:name => "Santa Maria ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
SW flank</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @centralamerica,
:image => "280px-santiaguito_from_santamaria.jpg",
:url => "https://en.wikipedia.org/wiki/santa_mar%c3%ada_(volcano)",
:user_id => @user.id,
:slug => "Gz2AuhG6cd",
:start_year_uncert => "",
:start_year => "1902"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santa Maria ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
SW flank</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @centralamerica,
:image => "280px-santiaguito_from_santamaria.jpg",
:slug => "Gz2AuhG6cd",
:url => "https://en.wikipedia.org/wiki/santa_mar%c3%ada_(volcano)",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1902"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Krakatoa, Indonesia VEI 6", :start_year => 1883)
if result.length == 0
result = HoloceneEvent.create({:name => "Krakatoa, Indonesia VEI 6",
:end_year => "",
:body => "<p>While not as big as Tambora, Krakatoa was better observed by a good many people.  The documentation is very informative as to the magnitude of such explosions.  It was heard around the world.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-krakatoa_eruption_lithograph.jpg",
:url => "https://en.wikipedia.org/wiki/krakatoa",
:user_id => @user.id,
:slug => "ZXtWpNT9xA",
:start_year_uncert => "",
:start_year => "1883"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Krakatoa, Indonesia VEI 6",
:end_year => "",
:body => "<p>While not as big as Tambora, Krakatoa was better observed by a good many people.  The documentation is very informative as to the magnitude of such explosions.  It was heard around the world.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-krakatoa_eruption_lithograph.jpg",
:slug => "ZXtWpNT9xA",
:url => "https://en.wikipedia.org/wiki/krakatoa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1883"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815", :start_year => 1812)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815",
:end_year => "1815",
:body => "",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-mount_tambora_volcano%2c_sumbawa_island%2c_indonesia.jpg",
:url => "https://en.wikipedia.org/wiki/mount_tambora",
:user_id => @user.id,
:slug => "e3nV6aKDYn",
:start_year_uncert => "",
:start_year => "1812"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815",
:end_year => "1815",
:body => "",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-mount_tambora_volcano%2c_sumbawa_island%2c_indonesia.jpg",
:slug => "e3nV6aKDYn",
:url => "https://en.wikipedia.org/wiki/mount_tambora",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1812"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7", :start_year => 1815)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Historical Observations
</p><p>This was the first eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book[[G80py5tYvc]] provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
 of 1816.</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-mount_tambora_volcano%2c_sumbawa_island%2c_indonesia.jpg",
:url => "https://en.wikipedia.org/wiki/mount_tambora",
:user_id => @user.id,
:slug => "DbUGEU7NTg",
:start_year_uncert => "",
:start_year => "1815"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Historical Observations
</p><p>This was the first eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book[[G80py5tYvc]] provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
 of 1816.</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-mount_tambora_volcano%2c_sumbawa_island%2c_indonesia.jpg",
:slug => "DbUGEU7NTg",
:url => "https://en.wikipedia.org/wiki/mount_tambora",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1815"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "G80py5tYvc", :body => "Volcano Weather: the story of 1816, the year without a summer", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Unknown Source ", :start_year => 1808)
if result.length == 0
result = HoloceneEvent.create({:name => "Unknown Source ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @unknown,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "mLumkSnZC6",
:start_year_uncert => "",
:start_year => "1808"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Unknown Source ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @unknown,
:image => "",
:slug => "mLumkSnZC6",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1808"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6", :start_year => 1660)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "280px-long_island_nasa.jpg",
:url => "https://en.wikipedia.org/wiki/long_island_(papua_new_guinea)",
:user_id => @user.id,
:slug => "XktQcwkp3A",
:start_year_uncert => "20",
:start_year => "1660"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "280px-long_island_nasa.jpg",
:slug => "XktQcwkp3A",
:url => "https://en.wikipedia.org/wiki/long_island_(papua_new_guinea)",
:user_id => @user.id,
:start_year_uncert => "20",
:start_year => "1660"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Huaynaputina, Peru VEI 6", :start_year => 1601)
if result.length == 0
result = HoloceneEvent.create({:name => "Huaynaputina, Peru VEI 6",
:end_year => "1603",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
Summit and south flank</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southamerica,
:image => "220px-huaynaputina.jpg",
:url => "https://en.wikipedia.org/wiki/huaynaputina",
:user_id => @user.id,
:slug => "Bp2NJFbkVc",
:start_year_uncert => "",
:start_year => "1601"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Huaynaputina, Peru VEI 6",
:end_year => "1603",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
Summit and south flank</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southamerica,
:image => "220px-huaynaputina.jpg",
:slug => "Bp2NJFbkVc",
:url => "https://en.wikipedia.org/wiki/huaynaputina",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1601"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 6", :start_year => 1580)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "280px-mtbalbitorenasa.jpg",
:url => "https://en.wikipedia.org/wiki/billy_mitchell_(volcano)",
:user_id => @user.id,
:slug => "r14EzSMDn6",
:start_year_uncert => "20",
:start_year => "1580"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "280px-mtbalbitorenasa.jpg",
:slug => "r14EzSMDn6",
:url => "https://en.wikipedia.org/wiki/billy_mitchell_(volcano)",
:user_id => @user.id,
:start_year_uncert => "20",
:start_year => "1580"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bardarbunga, Northeastern Iceland VEI 6", :start_year => 1477)
if result.length == 0
result = HoloceneEvent.create({:name => "Bardarbunga, Northeastern Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
Veidivötn (Veidivatnahraun)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @icelandandarcticocean,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "6njer1qBJj",
:start_year_uncert => "",
:start_year => "1477"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bardarbunga, Northeastern Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
Veidivötn (Veidivatnahraun)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @icelandandarcticocean,
:image => "",
:slug => "6njer1qBJj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1477"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Quilotoa, Ecuador VEI 6", :start_year => 1280)
if result.length == 0
result = HoloceneEvent.create({:name => "Quilotoa, Ecuador VEI 6",
:end_year => "",
:body => "<p>One of the largest 

eruption of the Holocene period.</p><p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "9sh1Jk0QRe",
:start_year_uncert => "",
:start_year => "1280"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Quilotoa, Ecuador VEI 6",
:end_year => "",
:body => "<p>One of the largest 

eruption of the Holocene period.</p><p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southamerica,
:image => "",
:slug => "9sh1Jk0QRe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1280"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Rinjani VEI 7 ", :start_year => 1257)
if result.length == 0
result = HoloceneEvent.create({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Ice Core
Samalas</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ffnDcdXtf2",
:start_year_uncert => "",
:start_year => "1257"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Ice Core
Samalas</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "",
:slug => "ffnDcdXtf2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1257"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Changbaishan VEI 7 ", :start_year => 942)
if result.length == 0
result = HoloceneEvent.create({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "h6Gtwj4Gvf",
:start_year_uncert => "4",
:start_year => "942"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "",
:slug => "h6Gtwj4Gvf",
:url => "",
:user_id => @user.id,
:start_year_uncert => "4",
:start_year => "942"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ceboruco,Mexico VEI 6", :start_year => 930)
if result.length == 0
result = HoloceneEvent.create({:name => "Ceboruco,Mexico VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @centralamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "E8wMA960GG",
:start_year_uncert => "200",
:start_year => "930"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ceboruco,Mexico VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @centralamerica,
:image => "",
:slug => "E8wMA960GG",
:url => "",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "930"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Churchill ", :start_year => 847)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-mtchurchill-klutlanglacier.jpg",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:user_id => @user.id,
:slug => "6AJ0ADNJcG",
:start_year_uncert => "1",
:start_year => "847"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-mtchurchill-klutlanglacier.jpg",
:slug => "6AJ0ADNJcG",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:user_id => @user.id,
:start_year_uncert => "1",
:start_year => "847"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Witori ", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "gC1NCdtYvN",
:start_year_uncert => "75",
:start_year => "710"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "",
:slug => "gC1NCdtYvN",
:url => "",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "710"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rabaul ", :start_year => 683)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabaul ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "280px-rabaul.png",
:url => "https://en.wikipedia.org/wiki/rabaul_caldera",
:user_id => @user.id,
:slug => "N0z3gfRBzt",
:start_year_uncert => "2",
:start_year => "683"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabaul ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "280px-rabaul.png",
:slug => "N0z3gfRBzt",
:url => "https://en.wikipedia.org/wiki/rabaul_caldera",
:user_id => @user.id,
:start_year_uncert => "2",
:start_year => "683"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dakataua ", :start_year => 653)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "papua_new_guinea_location_map_topographic.png",
:url => "https://en.wikipedia.org/wiki/dakataua",
:user_id => @user.id,
:slug => "ZM6A5BTy8C",
:start_year_uncert => "18",
:start_year => "653"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "papua_new_guinea_location_map_topographic.png",
:slug => "ZM6A5BTy8C",
:url => "https://en.wikipedia.org/wiki/dakataua",
:user_id => @user.id,
:start_year_uncert => "18",
:start_year => "653"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilopango, El Salvador VEI 6+", :start_year => 450)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilopango, El Salvador VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (corrected)
Ilopango</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @centralamerica,
:image => "280px-ilopango_caldera.jpg",
:url => "https://en.wikipedia.org/wiki/lake_ilopango",
:user_id => @user.id,
:slug => "qEVEHcwVMf",
:start_year_uncert => "30",
:start_year => "450"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilopango, El Salvador VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (corrected)
Ilopango</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @centralamerica,
:image => "280px-ilopango_caldera.jpg",
:slug => "qEVEHcwVMf",
:url => "https://en.wikipedia.org/wiki/lake_ilopango",
:user_id => @user.id,
:start_year_uncert => "30",
:start_year => "450"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Ksudach ", :start_year => 240)
if result.length == 0
result = HoloceneEvent.create({:name => "Ksudach ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Ksudach V caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "BaWUytX6eA",
:start_year_uncert => "100",
:start_year => "240"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ksudach ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Ksudach V caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "",
:slug => "BaWUytX6eA",
:url => "",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "240"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo ", :start_year => 233)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs area</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "taupo.volcanic.zone.north.island.nz.jpg",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:user_id => @user.id,
:slug => "vbNRKzNvLy",
:start_year_uncert => "13",
:start_year => "233"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs area</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "taupo.volcanic.zone.north.island.nz.jpg",
:slug => "vbNRKzNvLy",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:user_id => @user.id,
:start_year_uncert => "13",
:start_year => "233"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Churchill ", :start_year => 60)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-mtchurchill-klutlanglacier.jpg",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:user_id => @user.id,
:slug => "PbM8apPeyL",
:start_year_uncert => "200",
:start_year => "60"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-mtchurchill-klutlanglacier.jpg",
:slug => "PbM8apPeyL",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "60"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ambrym, Vanuatu VEI 6+", :start_year => 50)
if result.length == 0
result = HoloceneEvent.create({:name => "Ambrym, Vanuatu VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "gJ5kCrPVfE",
:start_year_uncert => "100",
:start_year => "50"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ambrym, Vanuatu VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "",
:slug => "gJ5kCrPVfE",
:url => "",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "50"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Apoyeque, Nicaragua VEI 6", :start_year => -50)
if result.length == 0
result = HoloceneEvent.create({:name => "Apoyeque, Nicaragua VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
Apoyeque</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @centralamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ACefZ4WEWe",
:start_year_uncert => "100",
:start_year => "-50"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Apoyeque, Nicaragua VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
Apoyeque</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @centralamerica,
:image => "",
:slug => "ACefZ4WEWe",
:url => "",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-50"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Okmok, Aleutian Islands VEI 6", :start_year => -100)
if result.length == 0
result = HoloceneEvent.create({:name => "Okmok, Aleutian Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Okmok II caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "zQQZf8py8D",
:start_year_uncert => "50",
:start_year => "-100"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Okmok, Aleutian Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Okmok II caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "",
:slug => "zQQZf8py8D",
:url => "",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6", :start_year => -1050)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:slug => "0qT32mKeX0",
:start_year_uncert => "500",
:start_year => "-1050"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:slug => "0qT32mKeX0",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:start_year_uncert => "500",
:start_year => "-1050"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Witori ", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "eStZ5C3ymr",
:start_year_uncert => "160",
:start_year => "-1370"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "",
:slug => "eStZ5C3ymr",
:url => "",
:user_id => @user.id,
:start_year_uncert => "160",
:start_year => "-1370"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Aniakchak ", :start_year => -1645)
if result.length == 0
result = HoloceneEvent.create({:name => "Aniakchak ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Ice Core
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-aniakchak-caldera_alaska.jpg",
:url => "https://en.wikipedia.org/wiki/mount_aniakchak",
:user_id => @user.id,
:slug => "TgtCNSt4rp",
:start_year_uncert => "10",
:start_year => "-1645"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aniakchak ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Ice Core
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-aniakchak-caldera_alaska.jpg",
:slug => "TgtCNSt4rp",
:url => "https://en.wikipedia.org/wiki/mount_aniakchak",
:user_id => @user.id,
:start_year_uncert => "10",
:start_year => "-1645"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Veniaminof, Alaska Peninsula VEI 6", :start_year => -1750)
if result.length == 0
result = HoloceneEvent.create({:name => "Veniaminof, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-mountveniaminof.jpg",
:url => "https://en.wikipedia.org/wiki/mount_veniaminof",
:user_id => @user.id,
:slug => "WYqBd8sqe9",
:start_year_uncert => "",
:start_year => "-1750"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Veniaminof, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-mountveniaminof.jpg",
:slug => "WYqBd8sqe9",
:url => "https://en.wikipedia.org/wiki/mount_veniaminof",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1750"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "St. Helens, Washington, USA VEI 6", :start_year => -1860)
if result.length == 0
result = HoloceneEvent.create({:name => "St. Helens, Washington, USA VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-msh82_st_helens_plume_from_harrys_ridge_05-19-82.jpg",
:url => "https://en.wikipedia.org/wiki/mount_st._helens",
:user_id => @user.id,
:slug => "50XtQb1zUN",
:start_year_uncert => "",
:start_year => "-1860"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "St. Helens, Washington, USA VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-msh82_st_helens_plume_from_harrys_ridge_05-19-82.jpg",
:slug => "50XtQb1zUN",
:url => "https://en.wikipedia.org/wiki/mount_st._helens",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1860"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Hudson, Cerro Southern Chile VEI 6", :start_year => -1890)
if result.length == 0
result = HoloceneEvent.create({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southamerica,
:image => "280px-cerro_hudson.jpg",
:url => "https://en.wikipedia.org/wiki/mount_hudson",
:user_id => @user.id,
:slug => "H5PC7GsDfY",
:start_year_uncert => "",
:start_year => "-1890"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southamerica,
:image => "280px-cerro_hudson.jpg",
:slug => "H5PC7GsDfY",
:url => "https://en.wikipedia.org/wiki/mount_hudson",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1890"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Black Peak, Alaska VEI 6", :start_year => -1900)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Peak, Alaska VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-black_peak.jpg",
:url => "https://en.wikipedia.org/wiki/black_peak_(alaska)",
:user_id => @user.id,
:slug => "cC6k9z5CQb",
:start_year_uncert => "150",
:start_year => "-1900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Peak, Alaska VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-black_peak.jpg",
:slug => "cC6k9z5CQb",
:url => "https://en.wikipedia.org/wiki/black_peak_(alaska)",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-1900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6", :start_year => -2040)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "280px-long_island_nasa.jpg",
:url => "https://en.wikipedia.org/wiki/long_island_(papua_new_guinea)",
:user_id => @user.id,
:slug => "93p8KZmhAj",
:start_year_uncert => "100",
:start_year => "-2040"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "280px-long_island_nasa.jpg",
:slug => "93p8KZmhAj",
:url => "https://en.wikipedia.org/wiki/long_island_(papua_new_guinea)",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-2040"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Blanco, Cerro VEI 7 ", :start_year => -2300)
if result.length == 0
result = HoloceneEvent.create({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @southamerica,
:image => "280px-cerro_blanco_volcano_(ava_granule_l1b_20000916145757).jpg",
:url => "https://en.wikipedia.org/wiki/cerro_blanco_(volcano)",
:user_id => @user.id,
:slug => "CB2sKWrm1j",
:start_year_uncert => "160",
:start_year => "-2300"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @southamerica,
:image => "280px-cerro_blanco_volcano_(ava_granule_l1b_20000916145757).jpg",
:slug => "CB2sKWrm1j",
:url => "https://en.wikipedia.org/wiki/cerro_blanco_(volcano)",
:user_id => @user.id,
:start_year_uncert => "160",
:start_year => "-2300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6", :start_year => -3550)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:slug => "T8kU4RjFVv",
:start_year_uncert => "",
:start_year => "-3550"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:slug => "T8kU4RjFVv",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3550"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Taal, Philippines VEI 6", :start_year => -3580)
if result.length == 0
result = HoloceneEvent.create({:name => "Taal, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-taal_volcano_aerial_2013.jpg",
:url => "https://en.wikipedia.org/wiki/taal_volcano",
:user_id => @user.id,
:slug => "QeNb63GdhH",
:start_year_uncert => "200",
:start_year => "-3580"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taal, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-taal_volcano_aerial_2013.jpg",
:slug => "QeNb63GdhH",
:url => "https://en.wikipedia.org/wiki/taal_volcano",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-3580"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Witori Caldera ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori Caldera ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "280px-ulawun_steam_plume.jpg",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:slug => "uNtwBXDVnW",
:start_year_uncert => "210",
:start_year => "-4000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori Caldera ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "280px-ulawun_steam_plume.jpg",
:slug => "uNtwBXDVnW",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "210",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Masaya, Nicaragua ", :start_year => -4050)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
NW of caldera</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @centralamerica,
:image => "280px-volcan_masaya2.jpg",
:url => "https://en.wikipedia.org/wiki/masaya_volcano",
:user_id => @user.id,
:slug => "2BVQWKhfuc",
:start_year_uncert => "",
:start_year => "-4050"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
NW of caldera</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @centralamerica,
:image => "280px-volcan_masaya2.jpg",
:slug => "2BVQWKhfuc",
:url => "https://en.wikipedia.org/wiki/masaya_volcano",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4050"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7", :start_year => -4350)
if result.length == 0
result = HoloceneEvent.create({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (uncorrected)
Kikai caldera</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "kikai_caldera_relief_map,_srtm,_english.jpg",
:url => "https://en.wikipedia.org/wiki/kikai_caldera",
:user_id => @user.id,
:slug => "qqJqee73JB",
:start_year_uncert => "",
:start_year => "-4350"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (uncorrected)
Kikai caldera</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "kikai_caldera_relief_map,_srtm,_english.jpg",
:slug => "qqJqee73JB",
:url => "https://en.wikipedia.org/wiki/kikai_caldera",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4350"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Maculey Island, Kermadec Islands VEI 6", :start_year => -4360)
if result.length == 0
result = HoloceneEvent.create({:name => "Maculey Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "260px-macauley_island.png",
:url => "https://en.wikipedia.org/wiki/macauley_island",
:user_id => @user.id,
:slug => "8qUUc0yrAW",
:start_year_uncert => "200",
:start_year => "-4360"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Maculey Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "260px-macauley_island.png",
:slug => "8qUUc0yrAW",
:url => "https://en.wikipedia.org/wiki/macauley_island",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-4360"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Hudson, Cerro Southern Chile VEI 6", :start_year => -4750)
if result.length == 0
result = HoloceneEvent.create({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southamerica,
:image => "280px-cerro_hudson.jpg",
:url => "https://en.wikipedia.org/wiki/mount_hudson",
:user_id => @user.id,
:slug => "QgAKnwbWzf",
:start_year_uncert => "",
:start_year => "-4750"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southamerica,
:image => "280px-cerro_hudson.jpg",
:slug => "QgAKnwbWzf",
:url => "https://en.wikipedia.org/wiki/mount_hudson",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4750"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Aniakchak, Alaska Peninsula VEI 6", :start_year => -5250)
if result.length == 0
result = HoloceneEvent.create({:name => "Aniakchak, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "280px-aniakchak-caldera_alaska.jpg",
:url => "https://en.wikipedia.org/wiki/mount_aniakchak",
:user_id => @user.id,
:slug => "0L6hBVvzDK",
:start_year_uncert => "1000",
:start_year => "-5250"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aniakchak, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "280px-aniakchak-caldera_alaska.jpg",
:slug => "0L6hBVvzDK",
:url => "https://en.wikipedia.org/wiki/mount_aniakchak",
:user_id => @user.id,
:start_year_uncert => "1000",
:start_year => "-5250"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6", :start_year => -5550)
if result.length == 0
result = HoloceneEvent.create({:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Tao-Rusyr</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "onekotanislandnasa.jpg",
:url => "https://en.wikipedia.org/wiki/tao-rusyr_caldera",
:user_id => @user.id,
:slug => "z6QZtjmDpB",
:start_year_uncert => "75",
:start_year => "-5550"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Tao-Rusyr</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "onekotanislandnasa.jpg",
:slug => "z6QZtjmDpB",
:url => "https://en.wikipedia.org/wiki/tao-rusyr_caldera",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-5550"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Mashu, Hokkaido (Japan) VEI 6", :start_year => -5550)
if result.length == 0
result = HoloceneEvent.create({:name => "Mashu, Hokkaido (Japan) VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "250px-image-2008_lake_masshu.jpg",
:url => "https://en.wikipedia.org/wiki/lake_mash%c5%ab",
:user_id => @user.id,
:slug => "xeUyr4AEga",
:start_year_uncert => "100",
:start_year => "-5550"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mashu, Hokkaido (Japan) VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "250px-image-2008_lake_masshu.jpg",
:slug => "xeUyr4AEga",
:url => "https://en.wikipedia.org/wiki/lake_mash%c5%ab",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-5550"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Crater Lakes Caldera VEI 7", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lakes Caldera VEI 7",
:end_year => "",
:body => "<p>This event is noted in native American legions about a battle of the Gods where one threw down the other.</p><p>VEI 7
Confirmed Eruption
Ice Core
Mt. Mazama summit and flank vents</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "250px-crater_lake_winter_pano2.jpg",
:url => "https://en.wikipedia.org/wiki/crater_lake",
:user_id => @user.id,
:slug => "nhGhNTESnp",
:start_year_uncert => "150",
:start_year => "-5677"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Crater Lakes Caldera VEI 7",
:end_year => "",
:body => "<p>This event is noted in native American legions about a battle of the Gods where one threw down the other.</p><p>VEI 7
Confirmed Eruption
Ice Core
Mt. Mazama summit and flank vents</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "250px-crater_lake_winter_pano2.jpg",
:slug => "nhGhNTESnp",
:url => "https://en.wikipedia.org/wiki/crater_lake",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Khangar ", :start_year => -5700)
if result.length == 0
result = HoloceneEvent.create({:name => "Khangar ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "280px-khangar.jpg",
:url => "https://en.wikipedia.org/wiki/khangar",
:user_id => @user.id,
:slug => "yVpxMrqku3",
:start_year_uncert => "16",
:start_year => "-5700"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Khangar ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "280px-khangar.jpg",
:slug => "yVpxMrqku3",
:url => "https://en.wikipedia.org/wiki/khangar",
:user_id => @user.id,
:start_year_uncert => "16",
:start_year => "-5700"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Crater Lake ", :start_year => -5900)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lake ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
North flank (Llao Rock)</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "250px-crater_lake_winter_pano2.jpg",
:url => "https://en.wikipedia.org/wiki/crater_lake",
:user_id => @user.id,
:slug => "F7eKs3uhbH",
:start_year_uncert => "50",
:start_year => "-5900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Crater Lake ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
North flank (Llao Rock)</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "250px-crater_lake_winter_pano2.jpg",
:slug => "F7eKs3uhbH",
:url => "https://en.wikipedia.org/wiki/crater_lake",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-5900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Menenga, Eastern Africa VEI 6+", :start_year => -6050)
if result.length == 0
result = HoloceneEvent.create({:name => "Menenga, Eastern Africa VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @africa,
:image => "menengai_crater_view_from_the_edge.jpg",
:url => "https://en.wikipedia.org/wiki/menengai",
:user_id => @user.id,
:slug => "Md7UyUNehd",
:start_year_uncert => "",
:start_year => "-6050"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Menenga, Eastern Africa VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @africa,
:image => "menengai_crater_view_from_the_edge.jpg",
:slug => "Md7UyUNehd",
:url => "https://en.wikipedia.org/wiki/menengai",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6050"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Kurile Lake Caldera VEI 7", :start_year => -6440)
if result.length == 0
result = HoloceneEvent.create({:name => "Kurile Lake Caldera VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "onekotanislandnasa.jpg",
:url => "https://en.wikipedia.org/wiki/tao-rusyr_caldera",
:user_id => @user.id,
:slug => "gmer0aFHBR",
:start_year_uncert => "25",
:start_year => "-6440"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kurile Lake Caldera VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "onekotanislandnasa.jpg",
:slug => "gmer0aFHBR",
:url => "https://en.wikipedia.org/wiki/tao-rusyr_caldera",
:user_id => @user.id,
:start_year_uncert => "25",
:start_year => "-6440"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Karymsky ", :start_year => -6600)
if result.length == 0
result = HoloceneEvent.create({:name => "Karymsky ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Karymsky caldera</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "280px-akademia_nauk.jpg",
:url => "https://en.wikipedia.org/wiki/karymsky_(volcano)",
:user_id => @user.id,
:slug => "1UCD6MJtYC",
:start_year_uncert => "",
:start_year => "-6600"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Karymsky ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Karymsky caldera</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "280px-akademia_nauk.jpg",
:slug => "1UCD6MJtYC",
:url => "https://en.wikipedia.org/wiki/karymsky_(volcano)",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Fisher Caldera, Aleutian Islands  VEI 6", :start_year => -7420)
if result.length == 0
result = HoloceneEvent.create({:name => "Fisher Caldera, Aleutian Islands  VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
NE and SW parts of Fisher caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:image => "",
:url => "https://en.wikipedia.org/wiki/fisher_caldera",
:user_id => @user.id,
:slug => "ePsdZRs8qh",
:start_year_uncert => "200",
:start_year => "-7420"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Fisher Caldera, Aleutian Islands  VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
NE and SW parts of Fisher caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @northamerica,
:image => "",
:slug => "ePsdZRs8qh",
:url => "https://en.wikipedia.org/wiki/fisher_caldera",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-7420"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6", :start_year => -7460)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Tayawan caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:slug => "UZJcAQ7y9d",
:start_year_uncert => "150",
:start_year => "-7460"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Tayawan caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @southeastasia,
:image => "280px-pinatubo91eruption_clark_air_base.jpg",
:slug => "UZJcAQ7y9d",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-7460"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Aira Caldera ", :start_year => -8050)
if result.length == 0
result = HoloceneEvent.create({:name => "Aira Caldera ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Wakamiko Caldera</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "280px-sakura-jima_from_space.jpg",
:url => "https://en.wikipedia.org/wiki/aira_caldera",
:user_id => @user.id,
:slug => "sFDuSczTWe",
:start_year_uncert => "1000",
:start_year => "-8050"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aira Caldera ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Wakamiko Caldera</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "280px-sakura-jima_from_space.jpg",
:slug => "sFDuSczTWe",
:url => "https://en.wikipedia.org/wiki/aira_caldera",
:user_id => @user.id,
:start_year_uncert => "1000",
:start_year => "-8050"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grimsvotn, Iceland VEI 6", :start_year => -8230)
if result.length == 0
result = HoloceneEvent.create({:name => "Grimsvotn, Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @icelandandarcticocean,
:image => "280px-iceland_grimsvoetn_1972-b.jpg",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:user_id => @user.id,
:slug => "wJ4HvsW840",
:start_year_uncert => "50",
:start_year => "-8230"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grimsvotn, Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @icelandandarcticocean,
:image => "280px-iceland_grimsvoetn_1972-b.jpg",
:slug => "wJ4HvsW840",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-8230"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Minchinmavida ", :start_year => -8400)
if result.length == 0
result = HoloceneEvent.create({:name => "Minchinmavida ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @southamerica,
:image => "280px-the-glaciated-michinmavida-volcano-lies-directly-behind-chaiten-in-eruption.jpg",
:url => "https://en.wikipedia.org/wiki/michinmahuida",
:user_id => @user.id,
:slug => "LvcFYcmrvS",
:start_year_uncert => "150",
:start_year => "-8400"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Minchinmavida ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @southamerica,
:image => "280px-the-glaciated-michinmavida-volcano-lies-directly-behind-chaiten-in-eruption.jpg",
:slug => "LvcFYcmrvS",
:url => "https://en.wikipedia.org/wiki/michinmahuida",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-8400"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ulreung, Korea VEI 6", :start_year => -8750)
if result.length == 0
result = HoloceneEvent.create({:name => "Ulreung, Korea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @eastasia,
:image => "260px-ulleung_island_from_above.jpg",
:url => "https://en.wikipedia.org/wiki/ulleungdo",
:user_id => @user.id,
:slug => "XQNwYeZpDe",
:start_year_uncert => "",
:start_year => "-8750"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ulreung, Korea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @eastasia,
:image => "260px-ulleung_island_from_above.jpg",
:slug => "XQNwYeZpDe",
:url => "https://en.wikipedia.org/wiki/ulleungdo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8750"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "English Channel formed ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "English Channel formed ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "HdHNZpSMM8",
:start_year_uncert => "",
:start_year => "-8500"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "English Channel formed ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @europe,
:image => "",
:slug => "HdHNZpSMM8",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Climate or Thermal Maximum ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Climate or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "MK6JKeTtaw",
:start_year_uncert => "",
:start_year => "-8000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Climate or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "MK6JKeTtaw",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 5 - 8.2K Event ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "<p>The only Bond event to show a signature in the ice cores.
</p>",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "QEM5B2NEeW",
:start_year_uncert => "",
:start_year => "-6200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "<p>The only Bond event to show a signature in the ice cores.
</p>",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "QEM5B2NEeW",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cotopaxi, Ecuador VEI 5+", :start_year => -5820)
if result.length == 0
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-cotopaxi_volcano_2008-06-27t1322.jpg",
:url => "https://en.wikipedia.org/wiki/cotopaxi",
:user_id => @user.id,
:slug => "xy9Jf6REU8",
:start_year_uncert => "75",
:start_year => "-5820"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-cotopaxi_volcano_2008-06-27t1322.jpg",
:slug => "xy9Jf6REU8",
:url => "https://en.wikipedia.org/wiki/cotopaxi",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-5820"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Flooding of the Black Sea ", :start_year => -5600)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["Earth", "Flood"],
:event_types => [  @earth ] ,
:region => @neareast,
:image => "",
:url => "https://en.wikipedia.org/wiki/black_sea_deluge_hypothesis",
:user_id => @user.id,
:slug => "cP62nh9p7z",
:start_year_uncert => "",
:start_year => "-5600"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["Earth", "Flood"],
:event_types => [ @earth ],
:region => @neareast,
:image => "",
:slug => "cP62nh9p7z",
:url => "https://en.wikipedia.org/wiki/black_sea_deluge_hypothesis",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5600"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak  ", :start_year => -5060)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "dchJCTfBbX",
:start_year_uncert => "",
:start_year => "-5060"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "dchJCTfBbX",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5060"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Low growth Irish Oak  ", :start_year => -4375)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "7LKTTkrstz",
:start_year_uncert => "",
:start_year => "-4375"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "7LKTTkrstz",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4375"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:slug => "YLFa4f46XW",
:start_year_uncert => "200",
:start_year => "-4000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:slug => "YLFa4f46XW",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bond 4 - 5.9K Event - intense aridification ", :start_year => -4200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "<p>5.9K Event was one of the most intense aridification events during the Holocene.</p>",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "CG0f0f7vsf",
:start_year_uncert => "",
:start_year => "-4200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "<p>5.9K Event was one of the most intense aridification events during the Holocene.</p>",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "CG0f0f7vsf",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cotopaxi, Ecuador VEI 5+", :start_year => -3880)
if result.length == 0
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-cotopaxi_volcano_2008-06-27t1322.jpg",
:url => "https://en.wikipedia.org/wiki/cotopaxi",
:user_id => @user.id,
:slug => "We0rPafj49",
:start_year_uncert => "75",
:start_year => "-3880"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-cotopaxi_volcano_2008-06-27t1322.jpg",
:slug => "We0rPafj49",
:url => "https://en.wikipedia.org/wiki/cotopaxi",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-3880"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Piora Oscillation ", :start_year => -3250)
if result.length == 0
result = HoloceneEvent.create({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "<p>An abrupt cold and wet period in climate history of the Holocene.  Global in nature.</p>",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "H79ZHYSTv9",
:start_year_uncert => "",
:start_year => "-3250"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "<p>An abrupt cold and wet period in climate history of the Holocene.  Global in nature.</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "H79ZHYSTv9",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Burkle Crater: Noah's Flood ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Burkle Crater: Noah's Flood ",
:end_year => "-2800",
:body => "",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_types => [  @impact,@cultural ] ,
:region => @indianocean,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "eSJLE4VTfD",
:start_year_uncert => "",
:start_year => "-3000"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burkle Crater: Noah's Flood ",
:end_year => "-2800",
:body => "",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_types => [ @impact,@cultural ],
:region => @indianocean,
:image => "",
:slug => "eSJLE4VTfD",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak  ", :start_year => -3195)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "anbQx7tUZs",
:start_year_uncert => "",
:start_year => "-3195"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "anbQx7tUZs",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3195"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "End of Piora Oscillation ", :start_year => -2900)
if result.length == 0
result = HoloceneEvent.create({:name => "End of Piora Oscillation ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ahyTFJWFhX",
:start_year_uncert => "",
:start_year => "-2900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "End of Piora Oscillation ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "ahyTFJWFhX",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Umm al Bini ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini ",
:end_year => "",
:body => "<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   
Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather.
</p><p>
The Egyptian Drought</p><p>Unconfirmed</p>",
:tag_list => ["ImpactEvent", "Earth", "Flood"],
:event_types => [  @impact ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "zzZDTPy0Vf",
:start_year_uncert => "",
:start_year => "-2354"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini ",
:end_year => "",
:body => "<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   
Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather.
</p><p>
The Egyptian Drought</p><p>Unconfirmed</p>",
:tag_list => ["ImpactEvent", "Earth", "Flood"],
:event_types => [ @impact ],
:region => @neareast,
:image => "",
:slug => "zzZDTPy0Vf",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "-2345",
:body => "<p>Lasted 9 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "XeHzcJZKTd",
:start_year_uncert => "",
:start_year => "-2354"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "-2345",
:body => "<p>Lasted 9 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "XeHzcJZKTd",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "https://en.wikipedia.org/wiki/4.2_kiloyear_event",
:user_id => @user.id,
:slug => "E5Ev6rSEcN",
:start_year_uncert => "",
:start_year => "-2200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "E5Ev6rSEcN",
:url => "https://en.wikipedia.org/wiki/4.2_kiloyear_event",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Radiocarbon (corrected)
</p><p>The Thera explosion is an interesting event to consider.  First, the Minoan people appear to have packed and left before the creation of the caldera.  Second, the unique color of the ejaculate seems to be the link to the 10 Plagues of Egypt as noted in the Bible.   And third, the dating of this event shifts the birth and time of Moses as well as other dates in the Bible.
</p><p>
It is one of two calderas that have been remembered in folk lore.  The other caldera is the Crater Lakes caldera in Oregon, USA.  Native American Legions speak of a battle of the Gods with one throwing down the other.
</p>",
:tag_list => ["Eruption", "VEI7", "Tsunami", "Earthquake"],
:event_types => [  @volcanic ] ,
:region => @europe,
:image => "280px-santorini_caldera_landsat.jpg",
:url => "https://en.wikipedia.org/wiki/santorini_caldera",
:user_id => @user.id,
:slug => "bBUpkrNQvR",
:start_year_uncert => "14",
:start_year => "-1628"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Radiocarbon (corrected)
</p><p>The Thera explosion is an interesting event to consider.  First, the Minoan people appear to have packed and left before the creation of the caldera.  Second, the unique color of the ejaculate seems to be the link to the 10 Plagues of Egypt as noted in the Bible.   And third, the dating of this event shifts the birth and time of Moses as well as other dates in the Bible.
</p><p>
It is one of two calderas that have been remembered in folk lore.  The other caldera is the Crater Lakes caldera in Oregon, USA.  Native American Legions speak of a battle of the Gods with one throwing down the other.
</p>",
:tag_list => ["Eruption", "VEI7", "Tsunami", "Earthquake"],
:event_types => [ @volcanic ],
:region => @europe,
:image => "280px-santorini_caldera_landsat.jpg",
:slug => "bBUpkrNQvR",
:url => "https://en.wikipedia.org/wiki/santorini_caldera",
:user_id => @user.id,
:start_year_uncert => "14",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "-1622",
:body => "<p>Lasted 6 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "EKDHCXeJ4U",
:start_year_uncert => "",
:start_year => "-1628"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "-1622",
:body => "<p>Lasted 6 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "EKDHCXeJ4U",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Kaali Meteor Impact ", :start_year => -1530)
if result.length == 0
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "-1450",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @europe,
:image => "220px-kaali-crater-saaremaa-estonia-aug-2007.jpg",
:url => "https://en.wikipedia.org/wiki/kaali_crater",
:user_id => @user.id,
:slug => "rDUCE5z384",
:start_year_uncert => "",
:start_year => "-1530"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kaali Meteor Impact ",
:end_year => "-1450",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @europe,
:image => "220px-kaali-crater-saaremaa-estonia-aug-2007.jpg",
:slug => "rDUCE5z384",
:url => "https://en.wikipedia.org/wiki/kaali_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1530"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Macha Crater ", :start_year => -5300)
if result.length == 0
result = HoloceneEvent.create({:name => "Macha Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @eurasia,
:image => "macha_craters_overview_map.jpg",
:url => "https://en.wikipedia.org/wiki/macha_crater",
:user_id => @user.id,
:slug => "qQsXVVTzM7",
:start_year_uncert => "",
:start_year => "-5300"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Macha Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @impact ],
:region => @eurasia,
:image => "macha_craters_overview_map.jpg",
:slug => "qQsXVVTzM7",
:url => "https://en.wikipedia.org/wiki/macha_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5300"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 6", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs?</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "taupo.volcanic.zone.north.island.nz.jpg",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:user_id => @user.id,
:slug => "eQ9QH1jgEH",
:start_year_uncert => "40",
:start_year => "-1460"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs?</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "taupo.volcanic.zone.north.island.nz.jpg",
:slug => "eQ9QH1jgEH",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:user_id => @user.id,
:start_year_uncert => "40",
:start_year => "-1460"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:slug => "mk4n9z5FC5",
:start_year_uncert => "100",
:start_year => "-1370"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:slug => "mk4n9z5FC5",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-1370"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Mycenea  - Earthquake ", :start_year => -1240)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea  - Earthquake ",
:end_year => "",
:body => "<p>
This earthquake was perhaps the earthquake described to Solon in Plato's Atlanis story.
</p>",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "CS94apYVVB",
:start_year_uncert => "",
:start_year => "-1240"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea  - Earthquake ",
:end_year => "",
:body => "<p>
This earthquake was perhaps the earthquake described to Solon in Plato's Atlanis story.
</p>",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @global,
:image => "",
:slug => "CS94apYVVB",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1240"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mycenea  - Earthquake ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea  - Earthquake ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "URyWEuDEKp",
:start_year_uncert => "",
:start_year => "-1200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea  - Earthquake ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @global,
:image => "",
:slug => "URyWEuDEKp",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Helka 3, Iceland VEI 6", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Helka 3, Iceland VEI 6",
:end_year => "",
:body => "<p>LHE date 1100 BC ±50 years
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-2006-05-21-153901_iceland_st%c3%b3rin%c3%bapur.jpg",
:url => "https://en.wikipedia.org/wiki/hekla",
:user_id => @user.id,
:slug => "RGHx8nCXmw",
:start_year_uncert => "50",
:start_year => "-1159"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helka 3, Iceland VEI 6",
:end_year => "",
:body => "<p>LHE date 1100 BC ±50 years
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-2006-05-21-153901_iceland_st%c3%b3rin%c3%bapur.jpg",
:slug => "RGHx8nCXmw",
:url => "https://en.wikipedia.org/wiki/hekla",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Downturn of environment: Tree Ring Event ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event ",
:end_year => "-1141",
:body => "<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "GcB5uJ7xRd",
:start_year_uncert => "",
:start_year => "-1159"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Downturn of environment: Tree Ring Event ",
:end_year => "-1141",
:body => "<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "GcB5uJ7xRd",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Iron Age Climate Pessimism ", :start_year => -900)
if result.length == 0
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism ",
:end_year => "-300",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "4gKvMTYyAd",
:start_year_uncert => "",
:start_year => "-900"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Iron Age Climate Pessimism ",
:end_year => "-300",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "4gKvMTYyAd",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-900"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Iron Age Climate Pessimism - Coldest Point ", :start_year => -450)
if result.length == 0
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "56zFu0zxRf",
:start_year_uncert => "",
:start_year => "-450"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "56zFu0zxRf",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-450"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 2 ", :start_year => -800)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "9ddsYetprj",
:start_year_uncert => "",
:start_year => "-800"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "9ddsYetprj",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Late Bronze Age Collapse ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @eurasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "ux4AfdrWF8",
:start_year_uncert => "",
:start_year => "-1200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @eurasia,
:image => "",
:slug => "ux4AfdrWF8",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Poseidon's Horses: Earthquake Swarm ", :start_year => -1225)
if result.length == 0
result = HoloceneEvent.create({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @neareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "WEwNG6BAkq",
:start_year_uncert => "",
:start_year => "-1225"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @neareast,
:image => "",
:slug => "WEwNG6BAkq",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1225"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Storegga Slide ", :start_year => -8100)
if result.length == 0
result = HoloceneEvent.create({:name => "Storegga Slide ",
:end_year => "",
:body => "<p>A megatsunami Norwegian Sea caused by the collapse of a Feord face.
</p>",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "D2R6WA5QgX",
:start_year_uncert => "",
:start_year => "-8100"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Storegga Slide ",
:end_year => "",
:body => "<p>A megatsunami Norwegian Sea caused by the collapse of a Feord face.
</p>",
:tag_list => [],
:event_types => [ @earth ],
:region => @europe,
:image => "",
:slug => "D2R6WA5QgX",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8100"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Coldest point of Iron Age  Pessimism ", :start_year => -450)
if result.length == 0
result = HoloceneEvent.create({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "tXFkefxLm9",
:start_year_uncert => "",
:start_year => "-450"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "tXFkefxLm9",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-450"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Destruction of Tartessos ", :start_year => -440)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Tartessos ",
:end_year => "",
:body => "<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar.</p>",
:tag_list => ["Tartessos"],
:event_types => [  @earth ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "xss2pwK85f",
:start_year_uncert => "",
:start_year => "-440"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Tartessos ",
:end_year => "",
:body => "<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar.</p>",
:tag_list => ["Tartessos"],
:event_types => [ @earth ],
:region => @europe,
:image => "",
:slug => "xss2pwK85f",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-440"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Helike, Greece disappears into the sea ", :start_year => -373)
if result.length == 0
result = HoloceneEvent.create({:name => "Helike, Greece disappears into the sea ",
:end_year => "",
:body => "<p>The city was submerged by a tsunami in the winter of 373 BC.
</p>",
:tag_list => ["Tsunami"],
:event_types => [  @earth ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "DSpN5WaXhY",
:start_year_uncert => "",
:start_year => "-373"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helike, Greece disappears into the sea ",
:end_year => "",
:body => "<p>The city was submerged by a tsunami in the winter of 373 BC.
</p>",
:tag_list => ["Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:image => "",
:slug => "DSpN5WaXhY",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-373"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Raoul Island, Kermadec Islands VEI 6", :start_year => -208)
if result.length == 0
result = HoloceneEvent.create({:name => "Raoul Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Denham caldera</p><p>LHE lists the date as 250 BC.</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "260px-sts008-36-1403_cropped_rotated.jpg",
:url => "https://en.wikipedia.org/wiki/raoul_island",
:user_id => @user.id,
:slug => "WrSGFEjZUJ",
:start_year_uncert => "75",
:start_year => "-208"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Raoul Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Denham caldera</p><p>LHE lists the date as 250 BC.</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "260px-sts008-36-1403_cropped_rotated.jpg",
:slug => "WrSGFEjZUJ",
:url => "https://en.wikipedia.org/wiki/raoul_island",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-208"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => -208)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "-204",
:body => "<p>Winter which lasted 4 years,.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "DxhtMbtWBB",
:start_year_uncert => "",
:start_year => "-208"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "-204",
:body => "<p>Winter which lasted 4 years,.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "DxhtMbtWBB",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-208"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Roman Age Optimum ", :start_year => -200)
if result.length == 0
result = HoloceneEvent.create({:name => "Roman Age Optimum ",
:end_year => "300",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "vhChn5f7s2",
:start_year_uncert => "",
:start_year => "-200"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Roman Age Optimum ",
:end_year => "300",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "vhChn5f7s2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-200"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Masaya, Nicaragua VEI 5+", :start_year => 150)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-volcan_masaya2.jpg",
:url => "https://en.wikipedia.org/wiki/masaya_volcano",
:user_id => @user.id,
:slug => "EgbeSSZKA0",
:start_year_uncert => "",
:start_year => "150"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-volcan_masaya2.jpg",
:slug => "EgbeSSZKA0",
:url => "https://en.wikipedia.org/wiki/masaya_volcano",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "150"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 7 ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "<p>
This is called the Hatepe eruption.  
While this volcano is in the southern hemisphere, it was noted in both China and Rome as ash and red skis. 
</p><p>
It was a VEI-7 event.
</p><p>
This volcano is outside the normal range of Global Winter events being south of the 30Th parallel.  
The fact that there were red skis recorded in Rome and China signifies that the sulfur dioxide crossed the equator.  
The magnitude of the explosion was the determining factor for its effect on the globe.
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @australasia,
:image => "taupo.volcanic.zone.north.island.nz.jpg",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:user_id => @user.id,
:slug => "H4Uz5rxa0t",
:start_year_uncert => "",
:start_year => "180"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "<p>
This is called the Hatepe eruption.  
While this volcano is in the southern hemisphere, it was noted in both China and Rome as ash and red skis. 
</p><p>
It was a VEI-7 event.
</p><p>
This volcano is outside the normal range of Global Winter events being south of the 30Th parallel.  
The fact that there were red skis recorded in Rome and China signifies that the sulfur dioxide crossed the equator.  
The magnitude of the explosion was the determining factor for its effect on the globe.
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @australasia,
:image => "taupo.volcanic.zone.north.island.nz.jpg",
:slug => "H4Uz5rxa0t",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rabul, New Britain VEI 6", :start_year => 512)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabul, New Britain VEI 6",
:end_year => "",
:body => "<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  The LHE list says 540 AD ±100 years.</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "260px-sts008-36-1403_cropped_rotated.jpg",
:url => "https://en.wikipedia.org/wiki/raoul_island",
:user_id => @user.id,
:slug => "sKBWJaYwrW",
:start_year_uncert => "4",
:start_year => "512"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabul, New Britain VEI 6",
:end_year => "",
:body => "<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  The LHE list says 540 AD ±100 years.</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "260px-sts008-36-1403_cropped_rotated.jpg",
:slug => "sKBWJaYwrW",
:url => "https://en.wikipedia.org/wiki/raoul_island",
:user_id => @user.id,
:start_year_uncert => "4",
:start_year => "512"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bond 1 Tree Ring Event ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event ",
:end_year => "545",
:body => "<p>
The cold period lasted 9 years in the tree ring records.   This impact left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.   It's ocular density was 2 and a half times the explosion of Tambora (1815).  
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "uW1JbXQhB7",
:start_year_uncert => "",
:start_year => "536"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 1 Tree Ring Event ",
:end_year => "545",
:body => "<p>
The cold period lasted 9 years in the tree ring records.   This impact left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.   It's ocular density was 2 and a half times the explosion of Tambora (1815).  
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "uW1JbXQhB7",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "rsUJJpdW57",
:start_year_uncert => "",
:start_year => "540"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "rsUJJpdW57",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Olympia destroyed by tsunami ", :start_year => 551)
if result.length == 0
result = HoloceneEvent.create({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "<p>Earthquake at Olympia destroys the site at Peloponnese.</p>",
:tag_list => ["Tsunami", "Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "YD3fyfFGxJ",
:start_year_uncert => "",
:start_year => "551"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "<p>Earthquake at Olympia destroys the site at Peloponnese.</p>",
:tag_list => ["Tsunami", "Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:image => "",
:slug => "YD3fyfFGxJ",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "551"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("olympiaearthquake")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:slug => "6cuQjhkqGv",
:start_year_uncert => "75",
:start_year => "710"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:slug => "6cuQjhkqGv",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "710"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Churchill, Eastern Alaska VEI 6", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill, Eastern Alaska VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-mtchurchill-klutlanglacier.jpg",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:user_id => @user.id,
:slug => "gf2xJDakGW",
:start_year_uncert => "100",
:start_year => "800"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill, Eastern Alaska VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-mtchurchill-klutlanglacier.jpg",
:slug => "gf2xJDakGW",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Dakataua, New Britain VEI 6", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:url => "https://en.wikipedia.org/wiki/dakataua",
:user_id => @user.id,
:slug => "ZVE1wRKuQC",
:start_year_uncert => "50",
:start_year => "800"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-ulawun_steam_plume.jpg",
:slug => "ZVE1wRKuQC",
:url => "https://en.wikipedia.org/wiki/dakataua",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "800"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 5+", :start_year => 1030)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "mtbalbitorenasa.jpg",
:url => "https://en.wikipedia.org/wiki/billy_mitchell_(volcano)",
:user_id => @user.id,
:slug => "Vs7BvYrK1Q",
:start_year_uncert => "25",
:start_year => "1030"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_types => [ @volcanic ],
:region => @global,
:image => "mtbalbitorenasa.jpg",
:slug => "Vs7BvYrK1Q",
:url => "https://en.wikipedia.org/wiki/billy_mitchell_(volcano)",
:user_id => @user.id,
:start_year_uncert => "25",
:start_year => "1030"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "'Lighting and Meteors destroyed the corn' in Ireland", :start_year => 1294)
if result.length == 0
result = HoloceneEvent.create({:name => "'Lighting and Meteors destroyed the corn' in Ireland",
:end_year => "1297",
:body => "<p>
'Lighting and Meteors destroyed the corn' in Ireland 1294, 'ten fireballs the size of houses' fell in China 1295, extraterrestrial inpact in Russia 1296 and fire-induced growth in giant sequoia dendrochronology, 1297.
</p>",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @europe,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "vRDnQMZCA9",
:start_year_uncert => "4",
:start_year => "1294"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "'Lighting and Meteors destroyed the corn' in Ireland",
:end_year => "1297",
:body => "<p>
'Lighting and Meteors destroyed the corn' in Ireland 1294, 'ten fireballs the size of houses' fell in China 1295, extraterrestrial inpact in Russia 1296 and fire-induced growth in giant sequoia dendrochronology, 1297.
</p>",
:tag_list => [],
:event_types => [ @impact ],
:region => @europe,
:image => "",
:slug => "vRDnQMZCA9",
:url => "",
:user_id => @user.id,
:start_year_uncert => "4",
:start_year => "1294"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Mahuika Crater ", :start_year => 1440)
if result.length == 0
result = HoloceneEvent.create({:name => "Mahuika Crater ",
:end_year => "",
:body => "<p>The dating of this 1440 AD impact is in dispute due to several factors.</p><p>Unconfirmed</p>",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @australasia,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "HSxyumyLMx",
:start_year_uncert => "15",
:start_year => "1440"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mahuika Crater ",
:end_year => "",
:body => "<p>The dating of this 1440 AD impact is in dispute due to several factors.</p><p>Unconfirmed</p>",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @australasia,
:image => "",
:slug => "HSxyumyLMx",
:url => "",
:user_id => @user.id,
:start_year_uncert => "15",
:start_year => "1440"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kuwae, Vanuatu VEI 7 ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "<p>
Three year cooling event.
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "280px-shepherdislandsmap.png",
:url => "https://en.wikipedia.org/wiki/kuwae",
:user_id => @user.id,
:slug => "Ut9LaXWS3A",
:start_year_uncert => "",
:start_year => "1453"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "<p>
Three year cooling event.
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic ],
:region => @global,
:image => "280px-shepherdislandsmap.png",
:slug => "Ut9LaXWS3A",
:url => "https://en.wikipedia.org/wiki/kuwae",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Three year cold event ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Three year cold event ",
:end_year => "1456",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "k4HQWkCpTb",
:start_year_uncert => "",
:start_year => "1453"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Three year cold event ",
:end_year => "1456",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "k4HQWkCpTb",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginning of Little Ice Age ", :start_year => 1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "beQMyPdptM",
:start_year_uncert => "",
:start_year => "1550"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "beQMyPdptM",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1550"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Cold Point of Little Ice Age ", :start_year => 1650)
if result.length == 0
result = HoloceneEvent.create({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "vcXvXhNDFk",
:start_year_uncert => "",
:start_year => "1650"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "vcXvXhNDFk",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1650"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Second Cold Point of Little Ice Age ", :start_year => 1770)
if result.length == 0
result = HoloceneEvent.create({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "Cw1j6ca4ZL",
:start_year_uncert => "",
:start_year => "1770"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "Cw1j6ca4ZL",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1770"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ", :start_year => 1783)
if result.length == 0
result = HoloceneEvent.create({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "<p>The famous volcanic event which started the great Benjamin Franklin asking the question of weither the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption.</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "iceland_grimsvoetn_1972-b.jpg",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:user_id => @user.id,
:slug => "kSZHXKCsHR",
:start_year_uncert => "",
:start_year => "1783"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "<p>The famous volcanic event which started the great Benjamin Franklin asking the question of weither the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption.</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [ @volcanic ],
:region => @global,
:image => "iceland_grimsvoetn_1972-b.jpg",
:slug => "kSZHXKCsHR",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1783"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Third Cold Point of the Little Ice Age ", :start_year => 1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "jghenJ0vTt",
:start_year_uncert => "",
:start_year => "1850"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:image => "",
:slug => "jghenJ0vTt",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1850"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Carrington Event: Solar Storm of 1859 ", :start_year => 1859)
if result.length == 0
result = HoloceneEvent.create({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [  @climate,@cultural ] ,
:region => @global,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "2E21NtHSd2",
:start_year_uncert => "",
:start_year => "1859"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [ @climate,@cultural ],
:region => @global,
:image => "",
:slug => "2E21NtHSd2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1859"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tunguska Event ", :start_year => 1908)
if result.length == 0
result = HoloceneEvent.create({:name => "Tunguska Event ",
:end_year => "",
:body => "<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [  @impact,@cultural ] ,
:region => @fareast,
:image => "",
:url => "",
:user_id => @user.id,
:slug => "PY0LKYZDCp",
:start_year_uncert => "",
:start_year => "1908"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tunguska Event ",
:end_year => "",
:body => "<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [ @impact,@cultural ],
:region => @fareast,
:image => "",
:slug => "PY0LKYZDCp",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1908"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grimsvotn Volanco, Iceland VEI 4 ", :start_year => 2010)
if result.length == 0
result = HoloceneEvent.create({:name => "Grimsvotn Volanco, Iceland VEI 4 ",
:end_year => "",
:body => "<p>This eruption caused desruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  @volcanic ] ,
:region => @global,
:image => "iceland_grimsvoetn_1972-b.jpg",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:user_id => @user.id,
:slug => "tSHM8HKzv2",
:start_year_uncert => "",
:start_year => "2010"
})
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grimsvotn Volanco, Iceland VEI 4 ",
:end_year => "",
:body => "<p>This eruption caused desruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [ @volcanic ],
:region => @global,
:image => "iceland_grimsvoetn_1972-b.jpg",
:slug => "tSHM8HKzv2",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2010"
})
debugger if res.nil?
result = result[0]
end
end
@object.holocene_events << result
