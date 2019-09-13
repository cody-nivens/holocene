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
@biblical = EventType.find_by_name("Biblical")
@climate = EventType.find_by_name("Climate")
@earth = EventType.find_by_name("Earth")
@epidemic = EventType.find_by_name("Epidemic")
@place = EventType.find_by_name("Place")
@person = EventType.find_by_name("Person")
@husbandry = EventType.find_by_name("Husbandry")

@timeline = Timeline.create({:name => "Main",:description => "Main - contains all events", :user_id => @user.id})
@arthur_timeline = Timeline.create({:name => "Arthur & Second Plague",:description => "Events from 500 to 601 AD.", :user_id => @user.id})
@biblical_timeline = Timeline.create({:name => "Bible Events",:description => "Biblical Events.", :user_id => @user.id})
@crisis_3rd_century_timeline = Timeline.create({:name => "Crisis of the 3rd century",:description => "Events in the 3rd century relating to Rome.", :user_id => @user.id})
@cultural_timeline = Timeline.create({:name => "Cultural",:description => "Cultural Events.", :user_id => @user.id})
@climate_timeline = Timeline.create({:name => "Climate",:description => "Climate Events.", :user_id => @user.id})
@first_plague_timeline = Timeline.create({:name => "First Plague",:description => "Events surrounding the first appearence of the Bubonic Plague.", :user_id => @user.id})
@little_ice_age_timeline = Timeline.create({:name => "Little Ice Age",:description => "Little Ice Age related events.", :user_id => @user.id})
@timeline_timeline = Timeline.create({:name => "Earth Events Timeline",:description => "Earth related events.", :user_id => @user.id})
@babylon_flood_timeline = Timeline.create({:name => "Babylon flood",:description => "Events related to floods.", :user_id => @user.id})
@global_winter_timeline = Timeline.create({:name => "Global Winter",:description => "Global winter events.", :user_id => @user.id})
@climate_factors_timeline = Timeline.create({:name => "Climate Factors",:description => "Factors affecting climate.", :user_id => @user.id})
@bronze_age_timeline = Timeline.create({:name => "Broze Age Collapse",:description => "Factors affecting the collapse of the late Bronze age.", :user_id => @user.id})
@santorini_timeline = Timeline.create({:name => "Santorini Eruption 1,628 BC",:description => "Factors affecting the collapse of the late Bronze age.", :user_id => @user.id})
@greece_timeline = Timeline.create({:name => "Greece",:description => "Factors affecting the appearance of 'Greek-like' peoples.", :user_id => @user.id})

@book = Book.create(:name => "Climate and History", :user_id => @user.id)
@author = Author.create(first_name: "Cody", last_name: "Nivens", user_id: @user.id)
@book.authors << @author

chapter_index = 0
result = Biblioentry.create({:name => "Multiradionuclide evidence for an extreme solar proton event around 2,610 B.P. (∼660 BC).",
  :xreflabel => "o_hare2019",
  :copyright_year => "Published online March 11, 2019",
  :copyright_holder => "doi: 10.1073/pnas.1815725116",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "PNAS"
})
debugger if result.errors.count > 0
[{:firstname=>"Paschal", :surname=>"O’Hare"}].each do |name_info|
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
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Rebus Principle","Rebus Principle").find_or_create_by({name: "Rebus Principle",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "The use of illustrated pictures with individual letters to depict words and/or phrases.   ",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Dendrochronology","Dendrochronology").find_or_create_by({name: "Dendrochronology",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "The use of tree rings to reconstruct the date during which a piece of timber was cut.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = GlossaryTerm.where("name = ? or term = ?","LHE","LHE").find_or_create_by({term: "LHE",
  :name => "LHE",
  :book => @book,
  :user => @user
})
term = GlossaryTerm.where("name = ? or term = ?","Large Holocene Eruptions","Large Holocene Eruptions").find_or_create_by({name: "Large Holocene Eruptions",
  :book => @book,
  :user => @user,
  :term => "lhe",
  :body => "Eruptions of size 6 or greater.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = GlossaryTerm.where("name = ? or term = ?","lhe","lhe").find_or_create_by({term: "lhe",
  :name => "lhe",
  :book => @book,
  :user => @user
})
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","LHE","LHE").find_or_create_by({name: "LHE",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = GlossaryTerm.where("name = ? or term = ?","vei","vei").find_or_create_by({term: "vei",
  :name => "vei",
  :book => @book,
  :user => @user
})
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","VEI","VEI").find_or_create_by({name: "VEI",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Archaeoastronomy","Archaeoastronomy").find_or_create_by({name: "Archaeoastronomy",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "The study of archeological sites and their relation to the sky.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = GlossaryTerm.where("name = ? or term = ?","VEI","VEI").find_or_create_by({term: "VEI",
  :name => "VEI",
  :book => @book,
  :user => @user
})
term = GlossaryTerm.where("name = ? or term = ?","Volcanic Explosion Index","Volcanic Explosion Index").find_or_create_by({name: "Volcanic Explosion Index",
  :book => @book,
  :user => @user,
  :term => "vei",
  :body => "A numeric value denoting how large a volcanic explosion is compaired to other explosions.  Indexes greater than 5 affect the global climate.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Typhus","Typhus").find_or_create_by({name: "Typhus",
  :book => @book,
  :user => @user,
  :term => "typhus",
  :body => "Spread by lice.  Rodents have lice which carry typhus. When the rodent is in close quarters with people, the disease is spread via the rodent lice turning to humans when the rodents die from the disease.  The rodent lice infect the human lice and the person sickens as a result.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Bubonic Plague","Bubonic Plague").find_or_create_by({name: "Bubonic Plague",
  :book => @book,
  :user => @user,
  :term => "bubonic plague",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Smallpox","Smallpox").find_or_create_by({name: "Smallpox",
  :book => @book,
  :user => @user,
  :term => "smallpox",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Rio Tinto","Rio Tinto").find_or_create_by({name: "Rio Tinto",
  :book => @book,
  :user => @user,
  :term => "rio tinto",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Tree Ring Event","Tree Ring Event").find_or_create_by({name: "Tree Ring Event",
  :book => @book,
  :user => @user,
  :term => "tree ring event",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Bond Event","Bond Event").find_or_create_by({name: "Bond Event",
  :book => @book,
  :user => @user,
  :term => "bond event",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Global Winter","Global Winter").find_or_create_by({name: "Global Winter",
  :book => @book,
  :user => @user,
  :term => "global winter",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Black Death","Black Death").find_or_create_by({name: "Black Death",
  :book => @book,
  :user => @user,
  :term => "black death",
  :body => "",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
result = Chapter.create({:name => "Preface ",
:position =>chapter_index,
:slug => "MaS1GS2dwK",
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
:slug => "cr0yVC97Zh",
:book => @book,
:body => "<p>My first and primary occupation in life has been Computer Science.  From beginning with Basic on a Woods[[qBWkncpfYp]] computer and the December 1973 Popular Science magazine's article on the Intel 8080 microprocessor chip to today's cloud environment, Computer Science and its practice has allowed me to sharpen my skills at pattern recognition.  
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
In the Amazon, there are archaeological digs going on documenting the settlements abandoned 500 years ago[[umcsebs4DY]].   
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
[[rJxApv61RU]]</p><p>
This pattern of epidemics on a native[[MEaCMtGD7T]] population can possibly be used to explain the mystery of the Minion's disappearance from history as well as the interesting fact that an epidemic of 1,500BC left its mark on the gene pool of Europe[[7wxE75guvC]].
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
Footnote.create(:slug => "qBWkncpfYp", :body => "Pencil and paper", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "umcsebs4DY", :body => "Amazon archaeology of 1500 settlements", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "rJxApv61RU", :body => "I remember that during the Swine flu the early 1970's, my father was struck with flu and pneumonia.", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "MEaCMtGD7T", :body => "Exposure of 'lost' tribes to diseases", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "7wxE75guvC", :body => "Gene study which lead to discovery of European plague in 1500BC", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Chapter.create({:name => "Climatology ",
:position =>chapter_index,
:slug => "BkwNf4ctJp",
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
:slug => "2SATrbrbUp",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Climate Reconstruction ",
:body => "<p>Climate reconstruction has become an important part of explaining changes in societies.  The reconstructions from ice cores and tree rings as well as accumulations on stalactites and rat nests.
</p><p>
The greater the range of types of reconstructions as well as the breadth of geological coverage of climate information expands our understanding of past climate history.
</p><p>
Ice cores, tree rings and stalactite slices are allow called proxies as they are  representative of the temperature at the time the at 'layer' was deposited.  Ice cores provide a additional benefit from the accumulation of dust and its contents.  One of the few ways to distinguish a volcanic winter event from a meteorite event is that a meteorite event usually has micro spears of glass and metal.  The micro-spears are thrown up when the body impacts the planet.  With a comet impact such spears do not seem to be present[[C0rTunSsZb]].
</p><p>
In reconstructing the climate of the planet,  tree rings provide a picture of the local climate and changes in it.  While ice cores paint a picture of the planet as a whole providing a Forest view for the trees view of the trees (You really don't think I would miss that would you?)</p>",
:slug => "ezdu17bfrK",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "C0rTunSsZb", :body => "Arizona University website", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Ice Core ",
:body => "<p>The drilling of ice cores in the move 'The day after tomorrow' provide a wonderful window into climate in the hemisphere and together from both the Arctic and Antarctic provide a picture of global weather on a yearly basis.  Ice traps dust as well as gases as show deposits.  The ice provide isotopes which together with gases and such things as sulfuric acid give information as to the temperature, CO2 content of the air, even the sun's influence via solar flares.</p>",
:slug => "AzpJFmyLhU",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Sulfuric Acid ",
:body => "<p>Sulfuric Acid in the ice is indicative of Volcanic activity.
</p>",
:slug => "DgxkqaT6yK",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Nitrate ",
:body => "<p>Nitrates relate to biomass burning measured with Ammonia and solar activity by itself.
</p>",
:slug => "F6zKHLwSt9",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Ammonia ",
:body => "<p>Ammonia with nitrates measure burning biomass.  Ammonia is also an indicator of cometary impacts.
</p>",
:slug => "G0Pbc436h3",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Dust Particles ",
:body => "<p>Dust particles relate to volcanic activity as well as impact events. 
</p>",
:slug => "bVDBu8xjQH",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Metallic Spheres ",
:body => "<p>Small silicon and metallic spears relate to impact events as ejected mass for micro spears in the atmosphere.
</p>",
:slug => "1KGvxPXqwN",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Climate Reconstruction:  The Holocene",
:body => "",
:slug => "h20jaqbDBu",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Bond 9 - Colvis Impact Event ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "wE1BAsSQTt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "wE1BAsSQTt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Younger Dryas ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "AaNxc07dNd",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "AaNxc07dNd",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Seven massive volcanic eruptions shown in ice cores ", :start_year => -7901)
if result.length == 0
result = HoloceneEvent.create({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "h8VGdUKDGb",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7901"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "h8VGdUKDGb",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7901"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Older Peron ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Older Peron ",
:end_year => "-4100",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UJs94PqD4V",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Older Peron ",
:end_year => "-4100",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "UJs94PqD4V",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Younger Peron Transgression ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "4AczMLhRYa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "4AczMLhRYa",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 8 - End of Younger Dryas ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UezjRke1ge",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "UezjRke1ge",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 7 ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "s8cynPvbkJ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "s8cynPvbkJ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 6 - Erdalen Glacial activity ", :start_year => -7400)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "YxWtqaPEee",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "YxWtqaPEee",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 5 - 8.2K Event ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "r9ftZ4JMMK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "r9ftZ4JMMK",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Climate or Thermal Maximum ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Climate or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "BPcJRdSGph",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Climate or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "BPcJRdSGph",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -5060)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "h0WQ68arDZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5060"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "h0WQ68arDZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5060"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event(6 years) ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(6 years) ",
:end_year => "-1622",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "bZtkxk2a4B",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(6 years) ",
:end_year => "-1622",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "bZtkxk2a4B",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Downturn of environment: Tree Ring Event(18 years) ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "gkAckVLAHS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "gkAckVLAHS",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Coldest point of Iron Age  Pessimism ", :start_year => -450)
if result.length == 0
result = HoloceneEvent.create({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "r0cMx0VqEH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-450"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "r0cMx0VqEH",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-450"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Roman Age Optimum ", :start_year => -200)
if result.length == 0
result = HoloceneEvent.create({:name => "Roman Age Optimum ",
:end_year => "300",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UB9ynxySH9",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Roman Age Optimum ",
:end_year => "300",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "UB9ynxySH9",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 1 Tree Ring Event(9 years) ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event(9 years) ",
:end_year => "545",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UuTX9FN5gQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "536"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 1 Tree Ring Event(9 years) ",
:end_year => "545",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "UuTX9FN5gQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "AeYevDNbBv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "540"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "AeYevDNbBv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Three year cold event ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Three year cold event ",
:end_year => "1456",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xB8mMDuxK6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1453"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Three year cold event ",
:end_year => "1456",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xB8mMDuxK6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Little Ice Age ", :start_year => 1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Little Ice Age ",
:end_year => "1850",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "LeXFcmzrpk",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Little Ice Age ",
:end_year => "1850",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "LeXFcmzrpk",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Cold Point of Little Ice Age ", :start_year => 1650)
if result.length == 0
result = HoloceneEvent.create({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZGxcT75vKR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ZGxcT75vKR",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1650"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Second Cold Point of Little Ice Age ", :start_year => 1770)
if result.length == 0
result = HoloceneEvent.create({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "HB7M1dmjyY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1770"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "HB7M1dmjyY",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1770"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Third Cold Point of the Little Ice Age ", :start_year => 1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dtJuQpB391",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1850"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "dtJuQpB391",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1850"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -4375)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "4CkE4srgBQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4375"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "4CkE4srgBQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4375"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Piora Oscillation ", :start_year => -3250)
if result.length == 0
result = HoloceneEvent.create({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5VRpMVkWVH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5VRpMVkWVH",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -3195)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dk7ea8mEZN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3195"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "dk7ea8mEZN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3195"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event(9 years) ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(9 years) ",
:end_year => "-2345",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "NcN85Z3UDn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2354"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(9 years) ",
:end_year => "-2345",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "NcN85Z3UDn",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 4 - 5.9K Event - intense aridification ", :start_year => -4200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "NgNmQ6t9Eg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "NgNmQ6t9Eg",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "MeZCt7nWhA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "MeZCt7nWhA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 2 ", :start_year => -800)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "T2THJfTz3r",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "T2THJfTz3r",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Iron Age Climate Pessimism ", :start_year => -900)
if result.length == 0
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism ",
:end_year => "-300",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "YzBBhfMVvW",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Iron Age Climate Pessimism ",
:end_year => "-300",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "YzBBhfMVvW",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Iron Age Climate Pessimism - Coldest Point ", :start_year => -450)
if result.length == 0
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8X31zZyhae",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-450"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "8X31zZyhae",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-450"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_timeline.holocene_events << result unless @climate_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Factors affecting the climate ",
:position =>chapter_index,
:slug => "x2H3kZDft3",
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
:slug => "UcptjYnQRt",
:position => section_index,
:display_name => true,
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
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "tbHk27HQsG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1815"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "tbHk27HQsG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1815"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Rinjani VEI 7 ", :start_year => 1257)
if result.length == 0
result = HoloceneEvent.create({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "wLgpVKtyz7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1257"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "wLgpVKtyz7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1257"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Changbaishan VEI 7 ", :start_year => 942)
if result.length == 0
result = HoloceneEvent.create({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Avv8spja0N",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "942"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Avv8spja0N",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "942"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Blanco, Cerro VEI 7 ", :start_year => -2300)
if result.length == 0
result = HoloceneEvent.create({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "EPHH5wBjrw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "EPHH5wBjrw",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ", :start_year => -4350)
if result.length == 0
result = HoloceneEvent.create({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "yuwzUPrtaP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "yuwzUPrtaP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4350"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Crater Lake Caldera VEI 7 ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "L0CcP6VHjz",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5677"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Crater Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "L0CcP6VHjz",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kurile Lake Caldera VEI 7 ", :start_year => -6440)
if result.length == 0
result = HoloceneEvent.create({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "6Mkhc2AfXG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6440"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "6Mkhc2AfXG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6440"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5HzHKrJKKZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5HzHKrJKKZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 7 ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QDGnYFKa1h",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "180"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "QDGnYFKa1h",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kuwae, Vanuatu VEI 7 ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pDvgDdx04b",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1453"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "pDvgDdx04b",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => 1991)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5q1b7SJEAY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1991"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5q1b7SJEAY",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1991"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santa Maria VEI 6 ", :start_year => 1902)
if result.length == 0
result = HoloceneEvent.create({:name => "Santa Maria VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "H2qyaJyRFA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1902"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santa Maria VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "H2qyaJyRFA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1902"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Krakatau, Indonesia VEI 6 ", :start_year => 1883)
if result.length == 0
result = HoloceneEvent.create({:name => "Krakatau, Indonesia VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UQYLABDCA6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1883"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Krakatau, Indonesia VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "UQYLABDCA6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1883"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815 ", :start_year => 1812)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815 ",
:end_year => "1815",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "r8fWN3nB0N",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1812"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815 ",
:end_year => "1815",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "r8fWN3nB0N",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1812"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6 ", :start_year => 1660)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "fK1k9cCtRT",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1660"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "fK1k9cCtRT",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1660"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Huaynaputina, Peru VEI 6 ", :start_year => 1601)
if result.length == 0
result = HoloceneEvent.create({:name => "Huaynaputina, Peru VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8vWHyXvT9d",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1601"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Huaynaputina, Peru VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "8vWHyXvT9d",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1601"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 6 ", :start_year => 1580)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1ZJdcGQye1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1580"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "1ZJdcGQye1",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1580"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Quilotoa, Ecuador VEI 6 ", :start_year => 1280)
if result.length == 0
result = HoloceneEvent.create({:name => "Quilotoa, Ecuador VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "sUrj9PJKvL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1280"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Quilotoa, Ecuador VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "sUrj9PJKvL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1280"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ceboruco, Mexico VEI 6 ", :start_year => 930)
if result.length == 0
result = HoloceneEvent.create({:name => "Ceboruco, Mexico VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "kYJzGMm4ka",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ceboruco, Mexico VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "kYJzGMm4ka",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "930"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Witori VEI 6 ", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZJs9CQMQAV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ZJs9CQMQAV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "710"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rabaul VEI 6 ", :start_year => 683)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabaul VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "t1PQ9QeApU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "683"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabaul VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "t1PQ9QeApU",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "683"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dakataua VEI 6 ", :start_year => 653)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "EWMqVgGDTe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "653"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "EWMqVgGDTe",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "653"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilopango, El Salvador VEI 7 ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "EWJer2Bxjs",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "EWJer2Bxjs",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ambrym, Vanuatu VEI 6+ ", :start_year => 50)
if result.length == 0
result = HoloceneEvent.create({:name => "Ambrym, Vanuatu VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZaL9u2757G",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "50"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ambrym, Vanuatu VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ZaL9u2757G",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "50"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Apoyeque, Nicaragua VEI 6 ", :start_year => -50)
if result.length == 0
result = HoloceneEvent.create({:name => "Apoyeque, Nicaragua VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "51VD6GPcC0",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-50"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Apoyeque, Nicaragua VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "51VD6GPcC0",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-50"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -1050)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "XWsCrmt2X6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "XWsCrmt2X6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1050"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Witori VEI 6 ", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1AHnfuCGFR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1370"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "1AHnfuCGFR",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1370"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6 ", :start_year => -2040)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "RzjfuEm3nP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2040"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "RzjfuEm3nP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2040"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -3550)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "nzWMKQpjet",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "nzWMKQpjet",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taal, Philippines VEI 6 ", :start_year => -3580)
if result.length == 0
result = HoloceneEvent.create({:name => "Taal, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xBeC1zqq4v",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3580"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taal, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xBeC1zqq4v",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3580"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Witori Caldera VEI 6 ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori Caldera VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "10En5QXz6v",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori Caldera VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "10En5QXz6v",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Masaya, Nicaragua VEI 6 ", :start_year => -4050)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8t3PhVj4rS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "8t3PhVj4rS",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4050"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Menenga, Eastern Africa VEI 6+ ", :start_year => -6050)
if result.length == 0
result = HoloceneEvent.create({:name => "Menenga, Eastern Africa VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "W2dBh6X79J",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Menenga, Eastern Africa VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "W2dBh6X79J",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6050"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -7460)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xD3C4HuPxA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xD3C4HuPxA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6 ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "7VFruJy1m2",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "7VFruJy1m2",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6 ", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "wjGhjm00QJ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1370"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "wjGhjm00QJ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1370"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6 ", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "jevvWpP6rs",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "jevvWpP6rs",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "710"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dakataua, New Britain VEI 6 ", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "CzkBRbJvrE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua, New Britain VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "CzkBRbJvrE",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 5+ ", :start_year => 1030)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 5+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "uv1zsJv8wA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1030"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 5+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "uv1zsJv8wA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1030"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Impact Events ",
:body => "<p>The frequency of impact events is inconclusive as to how often a history changer occurs.  The climate effects comes from the impact ejaculate being blown into the atmosphere as if it were a volcanic event.
</p><p>
A potential measure would be the check the ammonia levels in the ice core caps to determine if there is a relationship to impact events and high levels.  The level of the 535 impact event was the second highest of the last 2,000 year in the Greenland ice cores.  The highest in that time frame was at 1014 AD.</p><p>A partial list of impact events for the Holocene:
</p>",
:slug => "06EYDd3Up1",
:position => section_index,
:display_name => true,
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
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JMb6y7kefR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "JMb6y7kefR",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Campo del Cielo Crater ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ay1U1zFJAg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ay1U1zFJAg",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carancas Impact Crater ", :start_year => 2007)
if result.length == 0
result = HoloceneEvent.create({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "01VMzxKE1w",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "2007"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "01VMzxKE1w",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2007"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chelyabinsk meteor ", :start_year => 2013)
if result.length == 0
result = HoloceneEvent.create({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "LpT4EG1uQm",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "2013"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "LpT4EG1uQm",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2013"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grendel Crater ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "fp8GFp3v8Z",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "536"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "fp8GFp3v8Z",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Haviland Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3SVyauTn2X",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "3SVyauTn2X",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Henbury Meteorites Conservation Reserve ", :start_year => -2700)
if result.length == 0
result = HoloceneEvent.create({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2sHVbSKtT8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "2sHVbSKtT8",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilumetsa Crater ", :start_year => -4600)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pEKVsSgYWC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "pEKVsSgYWC",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Morasko Meterorite Nature Reseve ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "yrjyEQEYxJ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "yrjyEQEYxJ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Caurto Craters ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "TehkryVg1B",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "TehkryVg1B",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sirente Crater ", :start_year => 312)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "D9MuCN7qTE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "312"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "D9MuCN7qTE",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "312"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sobolev Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dxGvwaaqJF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "dxGvwaaqJF",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tai Hu Lake ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QjHLamWstu",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "QjHLamWstu",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wabar Craters ", :start_year => 1863)
if result.length == 0
result = HoloceneEvent.create({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "KNvkUz84FX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1863"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "KNvkUz84FX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1863"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kamil Crater ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dgw5gWFtUQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "dgw5gWFtUQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Whitecourt Crater ", :start_year => 1105)
if result.length == 0
result = HoloceneEvent.create({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "bFyMfwZrqN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1105"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "bFyMfwZrqN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1105"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dalgaranga crater ", :start_year => -1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "kDDw158uzV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "kDDw158uzV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Bond Events ",
:body => "<p>Bond events

 are events which have occurred in the climate of the earth on a regularly reoccurring basis of about 1470 years.  They are observed in sediments that come from changes in the ice flows in the Arctic.[[9Ukw1uNxBh]]</p>",
:slug => "hQd01rSY4b",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "9Ukw1uNxBh", :body => "http://rivernet.ncsu.edu/courselocker/PaleoClimate/Bond et al., 1997 Millenial Scale Holocene Change.pdf", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Bond 9 - Colvis Impact Event ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JbW2D4tAHD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "JbW2D4tAHD",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 8 - End of Younger Dryas ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QSQzSjN6eb",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "QSQzSjN6eb",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 7 ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "r23tSTxBwZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "r23tSTxBwZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 6 - Erdalen Glacial activity ", :start_year => -7400)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5kNhRNrwSh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5kNhRNrwSh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 5 - 8.2K Event ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QaMJcfYCqY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "QaMJcfYCqY",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 4 - 5.9K Event - intense aridification ", :start_year => -4200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "y43VS3m3va",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "y43VS3m3va",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "arfTkhvhre",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "arfTkhvhre",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 2 ", :start_year => -800)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZbGrDdjcYH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ZbGrDdjcYH",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 1 Tree Ring Event(9 years) ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event(9 years) ",
:end_year => "545",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "C4jPuZ50SK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "536"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 1 Tree Ring Event(9 years) ",
:end_year => "545",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "C4jPuZ50SK",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@climate_factors_timeline.holocene_events << result unless @climate_factors_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Global Winter",
:position =>chapter_index,
:slug => "rR3K7qJr4p",
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
In 1815, the Tambora volcano exploded resulting in a global winter within 'recorded' history.[[smsAXjRSXT]]
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
Footnote.create(:slug => "smsAXjRSXT", :body => "Volcano Weather: the story of 1816, the year without a summer", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Definition",
:body => "<p>A Global winter is a climate event which encompasses the whole planet[[04Ns5UD6sj]].
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
:slug => "AxwMZ7QGKc",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = Biblioentry.find_by_xreflabel("stothers1999")
Footnote.create(:slug => "04Ns5UD6sj", :body => "Volcanic Dry Fogs, Climate Cooling, and Plague Pandemics in Europe and the Middle East", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Famine",
:body => "<p>Famine was very common event with an extreme change of weather.
The Year without a Summer in 1816 was the last great Crisis of subsistence in the Western Hemisphere.
After that year, modern transportation has eased the burdens of feeding the population.
</p><p>
In ancient time, an extreme weather event would result in famine with in a year.
If the event occur ed early in the year and no real crops where harvested, famine would occur.
With a truncated harvest, famine would start early the next year.
From a simple event, there could be 1 to 2 years of no or substandard harvests followed by 2 years of barely sufficient harvests followed by another 2 to 3 years of substandard harvests.</p>",
:slug => "p4pfCD1ZaP",
:position => section_index,
:display_name => true,
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
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "jv5H5sfrUt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1315"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "jv5H5sfrUt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1315"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Year of Darkness - global winter ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "7Nc1uesu6D",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "7Nc1uesu6D",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "00UgaA1Vta",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "00UgaA1Vta",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 539)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5DGXxdUg6U",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "539"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5DGXxdUg6U",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "539"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "t0jchpxMhU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "540"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "t0jchpxMhU",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "6AtrdhPRhe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "304"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Famines and Epidemics",
:end_year => "306",
:body => "<p>Empire wide Stathakopoulos states that the statement that the living were outnumbered by the dead is topoi as far as records go, but many have a basis in fact.
Consider that the Plague of Cyprian was smallpox and when introduced to new areas would have a potential decimating effect.</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @global,
:slug => "6AtrdhPRhe",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "304"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Plagues: A history of plagues, a plague of histories ",
:body => "<p>A common pattern to extreme weather events is plague.
Plague is different from an epidemic in that diseases like smallpox, measles and mumps were introduced and stayed in the populations of Europe and the Middle east eventually becoming childhood diseases in the cases of mumps and measles.
</p><p>
The plagues of Antonine[[aAjReL1JAD]]  and Cyprian[[nVmC9qLmjR]] were the result of the introduction of Smallpox into the Roman army on the borders of the empire resulting in the spread of the disease into the heart land of Rome.
It is believed that both of these epidemic were Smallpox because tests on the measles virus lead some to believe that it did not evolve into it present form until around 1,000 AD[[f5g1S6u2RA]].
</p><p>
Global Winter events always have some sort of epidemic factors involved be it typhoid fever via local rodent population explosion/collapse or the plague from the same explosion/collapse on the plague caring rodents in Africa.
If the 'Winter' is severe enough, plague rears out of Africa traveling along the eastern coast to the Red sea and it connection to the Mediterranean[[srdzpjgKVw]].
</p><p>
During the Little Ice Age (1300-1850), the Black  Death was not the only plague to hit Europe[[bawGSyza0Z]].
</p><p>
Typhus made an appearance as the Plague of Athens becoming the second appearance in recorded Greek history.
The fist is argued as the appearance of disease in the openings of the Iliad which ravages for 9 days destroying horses, mules, dogs and finally humans.
Sent by Apollo via his 'army' of mice[[x6ZVXSgXwX]].
</p><p>
Bubonic plague's effects on animals other than rats and man is complex.
Cats are very susceptible to the plague and as hunters of rats would be the first animals affects when a rat die off occurs.
Dogs are not affected by the plague, but can carry the plague fleas until they die of malnutrition and dehydration.
Black footed ferrets can also carry the plague fleas without harm[[hcd5nUfPLn]].
</p>",
:slug => "JuXBgB1ege",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "aAjReL1JAD", :body => "165 - 189 AD", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "nVmC9qLmjR", :body => "251 - 270 AD", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = nil
Footnote.create(:slug => "f5g1S6u2RA", :body => "Wiki reference", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("rosen2007")
Footnote.create(:slug => "srdzpjgKVw", :body => "Justinian's Flea", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("zinsser1935")
Footnote.create(:slug => "bawGSyza0Z", :body => "Rats, Lice and History", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("homer800BC")
Footnote.create(:slug => "x6ZVXSgXwX", :body => "Illiad", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("wills1996")
Footnote.create(:slug => "hcd5nUfPLn", :body => "Yellow fever, black goddess", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:url => "",
:user_id => @user.id,
:slug => "Su878ZdFTn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1150"
})
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
:slug => "Su878ZdFTn",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1150"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Athens ", :start_year => -430)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Athens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "jyczTrUzEW",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-430"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Athens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "jyczTrUzEW",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-430"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Antonine Plague - First appearance of Smallpox ", :start_year => 165)
if result.length == 0
result = HoloceneEvent.create({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "WbDwu2N2Qt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "165"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "WbDwu2N2Qt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "165"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Cyprian - Second appearance of Smallpox ", :start_year => 251)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Cyprian - Second appearance of Smallpox ",
:end_year => "270",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "S9vpPss9R3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "251"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Cyprian - Second appearance of Smallpox ",
:end_year => "270",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "S9vpPss9R3",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "251"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
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
:slug => "nwgCjJjCgK",
:position => section_index,
:display_name => true,
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
:url => "",
:user_id => @user.id,
:slug => "tuGrMU1UrK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @global,
:slug => "tuGrMU1UrK",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Justian Plague - Second Occurrence of Plague in Europe ", :start_year => 541)
if result.length == 0
result = HoloceneEvent.create({:name => "Justian Plague - Second Occurrence of Plague in Europe ",
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
:event_types => [  @epidemic ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "bga5Wqj5EY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "541"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Justian Plague - Second Occurrence of Plague in Europe ",
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
:event_types => [ @epidemic ],
:region => @global,
:slug => "bga5Wqj5EY",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "541"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Black Death - The third occurance of Plague in Europe ", :start_year => 1347)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Death - The third occurance of Plague in Europe ",
:end_year => "1351",
:body => "",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "yJd6KKaxex",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1347"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Death - The third occurance of Plague in Europe ",
:end_year => "1351",
:body => "",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @global,
:slug => "yJd6KKaxex",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1347"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Great Plague ", :start_year => 1665)
if result.length == 0
result = HoloceneEvent.create({:name => "The Great Plague ",
:end_year => "",
:body => "<p>Plague stricks London.  30% reduction in the population.
</p>",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "MV1zFpY6ha",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1665"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Plague ",
:end_year => "",
:body => "<p>Plague stricks London.  30% reduction in the population.
</p>",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [  ],
:region => @global,
:slug => "MV1zFpY6ha",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1665"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@global_winter_timeline.holocene_events << result unless @global_winter_timeline.holocene_events.include?(result)
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
:slug => "Su1skmVRRv",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Chapter.create({:name => "The Confusion of Civilizations:  Too many floods ",
:position =>chapter_index,
:slug => "CkfZyTMySD",
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
result = HoloceneEvent.where(:name => "Umm al Bini ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "eeGjv9F503",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2354"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "eeGjv9F503",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gilgamesh: The Babylonian Flood ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Gilgamesh: The Babylonian Flood ",
:end_year => "-2345",
:body => "<p>The Gilgamesh story records a great flood in the general region of the middle east.  It states that certain area were flooded.  During the Biblical Event flood, cities were lost from history.</p>",
:tag_list => ["Gilgamesh", "Earth", "Flood"],
:event_types => [  @cultural ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5X2Ted9Tt6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2354"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gilgamesh: The Babylonian Flood ",
:end_year => "-2345",
:body => "<p>The Gilgamesh story records a great flood in the general region of the middle east.  It states that certain area were flooded.  During the Biblical Event flood, cities were lost from history.</p>",
:tag_list => ["Gilgamesh", "Earth", "Flood"],
:event_types => [ @cultural ],
:region => @global,
:slug => "5X2Ted9Tt6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "XpSRLwCp5v",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2354"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "XpSRLwCp5v",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Blanco, Cerro VEI 7 ", :start_year => -2300)
if result.length == 0
result = HoloceneEvent.create({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "F4dLa3hhQK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "F4dLa3hhQK",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Floods - too many floods ",
:body => "",
:slug => "Cp1TFXYAwc",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "7JRbCRbFD4",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-16000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "",
:tag_list => [],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "7JRbCRbFD4",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Ogyges ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Ogyges ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "tMhRCjGPUP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Ogyges ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @earth ],
:region => @europe,
:slug => "tMhRCjGPUP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Dardanus ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Dardanus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "mxVuxb3Rrw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Dardanus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @earth ],
:region => @europe,
:slug => "mxVuxb3Rrw",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Noah's Flood ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Mw7KEBjTtJ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Mw7KEBjTtJ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Deucalion Deluge ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "G9d7tM6n1b",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "G9d7tM6n1b",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Eden - Two seperate events ",
:body => "<p>The first exile from Eden occured with the flooding of the Pursian Gulf.  This event seemed to occured around 16,000 BC.
</p><p>
The second exile from Eden was the flooding of the Black sea in 5500 BC.
With this event is a hint of what what was being achieved in terms of plant management.
</p>",
:slug => "K89fAgkCRs",
:position => section_index,
:display_name => true,
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
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "N8MtXcgddJ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "",
:body => "<p>The furtile vally formed by the combination of the rivers floods from the Ocean to three quarters of its present length.
</p>",
:tag_list => [],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "N8MtXcgddJ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "EWwmWj0Ehs",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-16000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "EWwmWj0Ehs",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cast out of Eden - Flooding of the Black Sea ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "nCDw9xux8P",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "nCDw9xux8P",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Exodus - Two seperate events ",
:body => "<p>The first Exodus occured sometime between the explosing of Santorini in 1628 BC and the distruction of Jerico.
</p><p>The second Exodus occured during the time of Ramsis due to the expusion of the Hyxos from Egypt.
</p>",
:slug => "17JDqQhGBh",
:position => section_index,
:display_name => true,
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
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "x0qGu6WPTx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "x0qGu6WPTx",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
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
:slug => "DUzgf7YZ0K",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1530",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "cU8ZHcZ7T3",
:lat => "31.871",
:lng => "35.444",
:start_year_uncert => "",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1530",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "cU8ZHcZ7T3",
:lat => "31.871",
:lng => "35.444",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua ", :start_year => -1565)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua ",
:end_year => "-1455",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "KsSbvhv4nh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1565"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua ",
:end_year => "-1455",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "KsSbvhv4nh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1565"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@babylon_flood_timeline.holocene_events << result unless @babylon_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "The Little Ice Age ",
:position =>chapter_index,
:slug => "FSMN1qVHPG",
:book => @book,
:body => "<p>
Recent research has provided a model under which an explanation of the Little Ice Age can be explained.  
The model shows that with a volcanic explosion in 1253 started a chain of events including three other volcanic explosions over the next two hundred years.  
</p><p>
The accumulation of volcanic ash and sulfur dioxide resulted in the cold events of the 1400s to the 1900s.  
Such climate events influenced the development of European exploration and civilization during the Middle Ages into the Age of Reason.
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
result = HoloceneEvent.where(:name => "Little Ice Age starts with a series of volanic eruptions. ", :start_year => 1253)
if result.length == 0
result = HoloceneEvent.create({:name => "Little Ice Age starts with a series of volanic eruptions. ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "XyrT7vFwrB",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1253"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Little Ice Age starts with a series of volanic eruptions. ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "XyrT7vFwrB",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1253"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rinjani VEI 7 ", :start_year => 1257)
if result.length == 0
result = HoloceneEvent.create({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "K8310y8ru1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1257"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "K8310y8ru1",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1257"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kuwae, Vanuatu VEI 7 ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "BRW7YKVQMg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1453"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "BRW7YKVQMg",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginning of Little Ice Age ", :start_year => 1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "hM8wQfDYBF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "hM8wQfDYBF",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Cold Point of Little Ice Age ", :start_year => 1650)
if result.length == 0
result = HoloceneEvent.create({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "LBtVAVHdfG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "LBtVAVHdfG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1650"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Second Cold Point of Little Ice Age ", :start_year => 1770)
if result.length == 0
result = HoloceneEvent.create({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3GddVBxjJr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1770"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "3GddVBxjJr",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1770"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ", :start_year => 1783)
if result.length == 0
result = HoloceneEvent.create({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5eWXBfr6NQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1783"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5eWXBfr6NQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1783"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Third Cold Point of the Little Ice Age ", :start_year => 1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "J63Q3mxMEF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1850"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "J63Q3mxMEF",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1850"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Little Ice Age ends ", :start_year => 1860)
if result.length == 0
result = HoloceneEvent.create({:name => "The Little Ice Age ends ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "KH4SMZVmRC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1860"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Little Ice Age ends ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "KH4SMZVmRC",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1860"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Tollmann's hypothetical bolide ",
:body => "<p>While the ice cores show a downturn in the climate at during the 8th millennium BC, they do not hold evidence of a single event.  I believe 
that this event is a little ice age phenomina.  A series of volcanic eruptions created a volcanic skys with red sunsets and airborn dust from the 
eruptions.  A second smaller bolide was posulated to occur at 3150 BCE (±200).
</p>",
:slug => "EvxgLBMKyp",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Tollmann's hypothetical bolide ", :start_year => -7640)
if result.length == 0
result = HoloceneEvent.create({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Tollmann's_hypothetical_bolide",
:user_id => @user.id,
:slug => "KHARJTNKnn",
:lat => "",
:lng => "",
:start_year_uncert => "200",
:start_year => "-7640"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:slug => "KHARJTNKnn",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Tollmann's_hypothetical_bolide",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-7640"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tollmann's hypothetical bolide ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Tollmann's_hypothetical_bolide",
:user_id => @user.id,
:slug => "PXK9xMbB6h",
:lat => "",
:lng => "",
:start_year_uncert => "200",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:slug => "PXK9xMbB6h",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Tollmann's_hypothetical_bolide",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Seven massive volcanic eruptions shown in ice cores ", :start_year => -7901)
if result.length == 0
result = HoloceneEvent.create({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "RHpYd3BLWA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7901"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "RHpYd3BLWA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7901"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Fisher Caldera, Aleutian Islands  VEI 6 ", :start_year => -7420)
if result.length == 0
result = HoloceneEvent.create({:name => "Fisher Caldera, Aleutian Islands  VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "XpDAGRxkPM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7420"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Fisher Caldera, Aleutian Islands  VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "XpDAGRxkPM",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7420"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -7460)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "u2xyPHBBYL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "u2xyPHBBYL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+ ", :start_year => -7480)
if result.length == 0
result = HoloceneEvent.create({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mCVHUGyQ3p",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7480"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "mCVHUGyQ3p",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7480"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@little_ice_age_timeline.holocene_events << result unless @little_ice_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Genesis ",
:position =>chapter_index,
:slug => "qseLjd4n6Q",
:book => @book,
:body => "<p>My maternal grandmother corralled my one day just before I went off to college.  She exponded to me the history of the Bible and that someday I 
or someone else would demonstrate it's validity.
</p><p>In the years since, I have watched the fate of archeology as one school and then another demonstrated why or why not biblical events could occur.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "Day 1 Let there be Light ",
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
:slug => "Q8C8QsFChK",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 1 Let there be Light ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 1 Let there be Light ",
:end_year => "-9600",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "4WVZcYB6jS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 1 Let there be Light ",
:end_year => "-9600",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "4WVZcYB6jS",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Clovis Comet ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "6T64KRa2Hk",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "6T64KRa2Hk",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 2 Dividing the Waters ",
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
:slug => "kaxSkkwKAh",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 2 - Dividing the Waters ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 2 - Dividing the Waters ",
:end_year => "-9100",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZQpJqPNcZB",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 2 - Dividing the Waters ",
:end_year => "-9100",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "ZQpJqPNcZB",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jericho is founded ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Jericho is founded ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Fh8ySZCLBV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jericho is founded ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Fh8ySZCLBV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 3 Dry Land ",
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
:slug => "1S4MkKLvnJ",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 3: Dry Land ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 3: Dry Land ",
:end_year => "-8300",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mzpXPaJmAv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 3: Dry Land ",
:end_year => "-8300",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "mzpXPaJmAv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tower of Jericho is completed ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "MafrD1wW1z",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "MafrD1wW1z",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 4 Sun, Moon and Stars 'Lights in the Firmament' ",
:body => "<p>
A 'Day' which seems to reflect the growing wonder at God's creation.
A cold period with low atmospheric particulates or moisture.
Cold nights offer clearer sighs of the stars, planets and possible Aurora Brollies displays.
</p>",
:slug => "N6mvLqMvzW",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ",
:end_year => "-7000",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "fgNWgzr3kC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ",
:end_year => "-7000",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "fgNWgzr3kC",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tollmann's hypothetical bolide ", :start_year => -7640)
if result.length == 0
result = HoloceneEvent.create({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Tollmann's_hypothetical_bolide",
:user_id => @user.id,
:slug => "RR8vtMdhrR",
:lat => "",
:lng => "",
:start_year_uncert => "200",
:start_year => "-7640"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:slug => "RR8vtMdhrR",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Tollmann's_hypothetical_bolide",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-7640"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Seven massive volcanic eruptions shown in ice cores ", :start_year => -7901)
if result.length == 0
result = HoloceneEvent.create({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1de0MRbbxQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7901"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "1de0MRbbxQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7901"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Fisher Caldera, Aleutian Islands  VEI 6 ", :start_year => -7420)
if result.length == 0
result = HoloceneEvent.create({:name => "Fisher Caldera, Aleutian Islands  VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "emea1bxkgs",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7420"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Fisher Caldera, Aleutian Islands  VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "emea1bxkgs",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7420"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -7460)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pC4uXDzeuX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "pC4uXDzeuX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+ ", :start_year => -7480)
if result.length == 0
result = HoloceneEvent.create({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Ub5ChbY7gS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7480"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Ub5ChbY7gS",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7480"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 5 Water and Air creatures ",
:body => "<p>
After such flooding caused by the ice melt, the rivers and streams would have been washed clean.
In the middle of the reestablishment of fisheries, the 8.2K Event happened.  Colder, drier conditions last for a
hundred years.  The dryer conditions would force aquatic fowl into an area with proper conditions.  
The dryness would reduce conditions needed for fish to establish themselves in the rivers and streams.
</p>",
:slug => "G5rueNkvXx",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 5 - Water and Air creatures ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 5 - Water and Air creatures ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "0GtXdUBHZX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 5 - Water and Air creatures ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "0GtXdUBHZX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 5 - 8.2K Event ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Su31qMarKy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Su31qMarKy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 6 Land creatures and Man ",
:body => "<p>
I would contend that Days 5 and 6 are a bit 'shorter' that the previous one.
These reason for the is that as the Lord 'rested' and man played in the Garden of Eden, the ocean level rose.
Eventually, they cased the inflow of sea water into the Black Sea.
</p><p>
The domestication of animals has allowed man to expand in a manner never before seen in human history. While some animals have been with mankind for millennium, others are more recent and some will never be tamed.
As man's awareness has grown over time, the dependency on livestock for food and labor has grown as well.
</p>",
:slug => "efpaFTmDLy",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 6 - Land creatures and Man ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 6 - Land creatures and Man ",
:end_year => "-5700",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "DQwB43cw56",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 6 - Land creatures and Man ",
:end_year => "-5700",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "DQwB43cw56",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 7 The Lord Rested ",
:body => "",
:slug => "ABeFBaajp0",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Day 7 - The Lord Rested ", :start_year => -5700)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 7 - The Lord Rested ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3FFdMjUcdX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 7 - The Lord Rested ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "3FFdMjUcdX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "God Comes to visit ",
:body => "<p>
What would a person consider as a visit from God?  I content that a volcano exploding with enough force would generate a sound heard around the world.
</p><p>
I could also contend that an impact event would also qualify.  First the bright sreak across the sky.  Then an explosion generating a massive sound. 
Two such impacts are the Tunguska event and the Chelyabinsk meteor.
</p>",
:slug => "W0htW3j7T9",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "God Comes to visit ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "God Comes to visit ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pMk4ZM2vVq",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5677"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "God Comes to visit ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "pMk4ZM2vVq",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Crater Lake Caldera VEI 7", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lake Caldera VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:url => "",
:user_id => @user.id,
:slug => "z0teB0eJFD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5677"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Crater Lake Caldera VEI 7",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @volcanic ],
:region => @northamerica,
:slug => "z0teB0eJFD",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = Section.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:body => "<p>
At that time the Black sea area was truly Eden.
Large fresh water lake with gentle rolling hills.
Four rivers flowing to the area proving a guide out of the area.
Having had several thousand years to adapt to the valley, it's loss would be a religious experience.
The Black Sea basin before the flooding by the sea was a paradice compaired to other areas during the Holocene. Fresh water with four river running into it profiding trails leading out. The plain would have been firtile with grass as well as marshes with birds, fish and other animals. 
</p><p>
Depending on the rate of rise of the wasters, one could find oneself at the edge of the new ocean with literally the cloths on ones back.
</p>",
:slug => "jT8fURZN5w",
:position => section_index,
:display_name => true,
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
:slug => "Eb38LRbRXX",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Cast out of Eden - Flooding of the Black Sea ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical,@earth ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "xLAu6MePwQ",
:lat => "44",
:lng => "35",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical,@earth ],
:region => @eurasia,
:slug => "xLAu6MePwQ",
:lat => "44",
:lng => "35",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Noah's Flood ",
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
:slug => "CwUef8tCr6",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Piora Oscillation ", :start_year => -3250)
if result.length == 0
result = HoloceneEvent.create({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8ELdGhh0yh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "8ELdGhh0yh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tollmann's hypothetical bolide ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "w1AcUpCr8Y",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tollmann's hypothetical bolide ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @earth ],
:region => @eurasia,
:slug => "w1AcUpCr8Y",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -3195)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "A9NNq3H6vE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3195"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "A9NNq3H6vE",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3195"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Burckle Crater: Noah's Flood ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Burckle Crater: Noah's Flood ",
:end_year => "-2800",
:body => "",
:tag_list => [],
:event_types => [  @biblical,@impact ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "AStjHLsVXr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burckle Crater: Noah's Flood ",
:end_year => "-2800",
:body => "",
:tag_list => [],
:event_types => [ @biblical,@impact ],
:region => @global,
:slug => "AStjHLsVXr",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Deucalion Deluge ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JuGEWJ7yqN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @earth ],
:region => @global,
:slug => "JuGEWJ7yqN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Noah's Flood ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "NEZBYpbxzL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @biblical ],
:region => @global,
:slug => "NEZBYpbxzL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Greece - Theater of the Real ",
:position =>chapter_index,
:slug => "L05x0uuUa7",
:book => @book,
:body => "<p>Who were the Greeks and how did the Sea People hide from history?
</p><p>
There are many theories about the appearance of the Sea People. One believes peoples from the various islands of the Mediterranean becames seafairing enmass.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Cycladic culture ", :start_year => -3200)
if result.length == 0
result = HoloceneEvent.create({:name => "Cycladic culture ",
:end_year => "-1050",
:body => "<p>The first culture in the Agean sea as a philosophical base.
</p><p>The culture essentially became Minoan around 2000 BC when the pottery essecially became all Minoan in style.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "wd2Thuxr6b",
:lat => "39",
:lng => "25",
:start_year_uncert => "",
:start_year => "-3200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cycladic culture ",
:end_year => "-1050",
:body => "<p>The first culture in the Agean sea as a philosophical base.
</p><p>The culture essentially became Minoan around 2000 BC when the pottery essecially became all Minoan in style.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "wd2Thuxr6b",
:lat => "39",
:lng => "25",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Minoan civilization ", :start_year => -2700)
if result.length == 0
result = HoloceneEvent.create({:name => "Minoan civilization ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "c8DjRwBqZq",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Minoan civilization ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "c8DjRwBqZq",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mycenaean Greece ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenaean Greece ",
:end_year => "-1100",
:body => "<p>This style of pottery became the last style before the collapse of the Bronze Age.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "PCxN4NQZKL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenaean Greece ",
:end_year => "-1100",
:body => "<p>This style of pottery became the last style before the collapse of the Bronze Age.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "PCxN4NQZKL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "2200 BC - 2100 BC - 4.2 Kiloyear Event",
:body => "<p>This events started the migration of peoples out of the East at Bacria towards the Mediterranean Sea and pressured people to move south.  
Their environment dried up along with the rest of the Middle East and Asia.  
At the very least, a civilization would send out scouting parties to see how extensive the climate downturn has become.
</p><p>A 180-km-long wall, the 'Repeller of the Amorites', was built across central Mesopotamia to stem nomadic incursions to the south.</p>",
:slug => "HBRQEEZYHb",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5uVQ4hsv9U",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "5uVQ4hsv9U",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Blanco, Cerro VEI 7 ", :start_year => -2300)
if result.length == 0
result = HoloceneEvent.create({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "C6uqGjLMm3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "C6uqGjLMm3",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Lycian Sea People ", :start_year => -1450)
if result.length == 0
result = HoloceneEvent.create({:name => "The Lycian Sea People ",
:end_year => "-546",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "p9UUWUE5B8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1450"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Lycian Sea People ",
:end_year => "-546",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "p9UUWUE5B8",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1450"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Lycian People become part of Assuwa league ", :start_year => -1250)
if result.length == 0
result = HoloceneEvent.create({:name => "The Lycian People become part of Assuwa league ",
:end_year => "",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "F7V5swtBYG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Lycian People become part of Assuwa league ",
:end_year => "",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "F7V5swtBYG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1250"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Sherden Sea People ", :start_year => -1399)
if result.length == 0
result = HoloceneEvent.create({:name => "The Sherden Sea People ",
:end_year => "-1300",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "65B2pu0Hx2",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1399"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Sherden Sea People ",
:end_year => "-1300",
:body => "",
:tag_list => ["SeaPeople"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "65B2pu0Hx2",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1399"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jason and the Argonauts ", :start_year => -1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Jason and the Argonauts ",
:end_year => "",
:body => "<p>The classic tale defining a part of Greek culture.  There is discussion about the story being one of the 
descendents of a people who occupied parts of Greece going on a voyage back to their ancestrial home land.
I believe that their homeland was Bactria.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Argonauts",
:user_id => @user.id,
:slug => "AYbRxmp3QD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jason and the Argonauts ",
:end_year => "",
:body => "<p>The classic tale defining a part of Greek culture.  There is discussion about the story being one of the 
descendents of a people who occupied parts of Greece going on a voyage back to their ancestrial home land.
I believe that their homeland was Bactria.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "AYbRxmp3QD",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Argonauts",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@greece_timeline.holocene_events << result unless @greece_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "1628 BC - Santorini - an Inconvenient Dating ",
:position =>chapter_index,
:slug => "CttypUjMnX",
:book => @book,
:body => "<p>This single event has influcenced history and religion than any other.  
The explosion that came when Thera finally blew.  During the set of eruptions, the eruption plumb was towards the northeast.
</p><p>The second set of eruptions was toward the southeast over the Dead sea and Egypt.  
<ul>
<li>The 10 Plagues of Egypt are in fact events resulting from the explosion. </li>
<li>The destruction of Sodom and Gomorrah by a pyroclstic bomb spit out by the eruption.</li>
<li>The occupation of mainland Greece by the Ekwesh Sea Peoples in 1,600 BC replacing those peoples destroyed by the tsunamis from Santorini.</li>
</ul>
</p><p>These events bring into question the begots and begets of the Bible and when did a particular individual exist.  The 10 Plagues set
in motion the Exodus according to the Bible, yet research is pointing to Moses being born after the Plagues and before the Exodus occurs.
It is not clear as to when the Isrealites left Egypt after the Plagues.  
The first objective event after the wandering in Desert is the Battle of Jerico after the Exodus.
This event again proves inconvenient.  It has been dated to between 1,600 BC and 1,500 BC while the best date I can find for Moses is 
1572 BC - 1451 BC.  
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "8Pqm8T8uct",
:lat => "36.4167",
:lng => "25.4333",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "8Pqm8T8uct",
:lat => "36.4167",
:lng => "25.4333",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ipuwer Papyrus ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Ipuwer Papyrus ",
:end_year => "-1450",
:body => "<p>This document's referal to 'the river is blood' and that Asiatics are arriving (the invasion by the Hyksos) indicates that the 
document details things during the eruption of Santorini and immediately afterwards.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Ipuwer_Papyrus",
:user_id => @user.id,
:slug => "zjAcBWzPfx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ipuwer Papyrus ",
:end_year => "-1450",
:body => "<p>This document's referal to 'the river is blood' and that Asiatics are arriving (the invasion by the Hyksos) indicates that the 
document details things during the eruption of Santorini and immediately afterwards.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "zjAcBWzPfx",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Ipuwer_Papyrus",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event(4 years) ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(4 years) ",
:end_year => "-1622",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "cU2qZPTGSc",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(4 years) ",
:end_year => "-1622",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "cU2qZPTGSc",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Inconvenient Dates ",
:body => "<p>These events bring into question the begots and begets of the Bible and when did a particular individual exist.
There are two issues when did the individuals of the bible live and how long did they do so.
</p><p>
<div class='gtree'>
  <ul>
    <li>
      <a href='#' title='Link: #'>Terah 1,987 BC - 1,782 BC</a>
      <ul>
        <li>
		<a href='#'>Abraham 1,917 BC - 1,742 BC</a>
		<a href='#'>Sarah</a>
          <ul>
            <li><a href='#'>Issac 1,817 BC - 1,637 BC</a>
                <a href='#'>Rebecca</a>
              <ul>
                <li>
                  <a href='#'>Jacob 1,757 BC - 1,610 BC</a>
                  <a href='#'>Rachel</a>
                <ul>
                <li>
                  <a href='#'>Joseph 1,662 BC - 1,552 BC</a>
                </li>
                </ul>
              </li></ul>
          </li></ul>
        </li>
        <li><a href='#'>Haran</a>
        <ul>
           <li><a href='#'>Lot 1,827 BC - 1,622 BC</a>
        </li></ul>
        </li>
      </ul>
    </li>
  </ul>
</div>
<div class='page-break'></div>
</p><p>The inconvenience of dates is this:
<ul>
<li>Terah is 70 when Abaham is born.</li>
<li>Abraham is 75 when he takes Lot to Canaan.</li>
<li>Abraham is 100 years old when Issac was born.</li>
<li>Abraham dies at 175</li>
<li>Issac was 60 years old when Esau and Jacob were born.</li>
<li>Issac was 180 when he died.</li>
<li>Jacob was 130 years old when the 7 years of famine start after the eruption of Santorini in 1628 BC.</li>
<li>Jacob dies in 1,610 BC and was 147 years old.</li>
<li>Joseph was 38/39 when Jacob came to Egypt.</li>
<li>Joseph dies in 1,552 BC and was 110 years old.</li>
<li>Lot dies in 1,622 BC and was 205 years old.</li>
<li>Abraham and Lot were alive at the time of the destruction of Sodom and Gomorrah.</li>
</ul>
</p><p>The result is a 290 year sequence between the birth of Abraham and the eruption of Santorini.  The 290 year figure would also make sense in light
of the 4.2 Kiloyear event.
</p><p>But not for the distruction of Sodom and Gomorrah.  
Indeed, it appears that the story of Sodom and Gomorrah was dropped into the story of Abraham and Lot's adventures in Canaan and Egypt and there after.  
The story of Lot's capture and Abraham's response sounds real.
</p><p>Abraham's meeting with the three men.  The going to Sodom by two of the 'men', the conversation with the local people, the fleeting of the city all seem to have a difference feel in cadence.  I believe that the story of the destruction of Sodom and Gomorrah sound real as well.  Just not the people.
</p>",
:slug => "tYhPW3Wprx",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Terah ", :start_year => -1987)
if result.length == 0
result = HoloceneEvent.create({:name => "Terah ",
:end_year => "-1782",
:body => "<p>Lived 205 years.</p>",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "pYYKs5EX4H",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1987"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Terah ",
:end_year => "-1782",
:body => "<p>Lived 205 years.</p>",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "pYYKs5EX4H",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1987"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Abraham ", :start_year => -1917)
if result.length == 0
result = HoloceneEvent.create({:name => "Abraham ",
:end_year => "-1742",
:body => "<p>Lived 175 years.</p>",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "3qZVUq6Kmm",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1917"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Abraham ",
:end_year => "-1742",
:body => "<p>Lived 175 years.</p>",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "3qZVUq6Kmm",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1917"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Issac ", :start_year => -1817)
if result.length == 0
result = HoloceneEvent.create({:name => "Issac ",
:end_year => "-1637",
:body => "<p>Lived 180 years.</p>",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "C6ANHUm0JW",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1817"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Issac ",
:end_year => "-1637",
:body => "<p>Lived 180 years.</p>",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "C6ANHUm0JW",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1817"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jacob ", :start_year => -1757)
if result.length == 0
result = HoloceneEvent.create({:name => "Jacob ",
:end_year => "-1610",
:body => "<p>Lived 147 years. Dies in Egypt after being there for 18 years.</p>",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "XJA10CA3Zv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1757"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jacob ",
:end_year => "-1610",
:body => "<p>Lived 147 years. Dies in Egypt after being there for 18 years.</p>",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "XJA10CA3Zv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1757"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joseph ", :start_year => -1662)
if result.length == 0
result = HoloceneEvent.create({:name => "Joseph ",
:end_year => "-1552",
:body => "<p>Lived 110 years.</p>",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "c5EmEvzaKP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1662"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joseph ",
:end_year => "-1552",
:body => "<p>Lived 110 years.</p>",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "c5EmEvzaKP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1662"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lot ", :start_year => -1827)
if result.length == 0
result = HoloceneEvent.create({:name => "Lot ",
:end_year => "-1622",
:body => "<p>Lived 205 years.</p>",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "Wp1EMPPvrL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1827"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lot ",
:end_year => "-1622",
:body => "<p>Lived 205 years.</p>",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "Wp1EMPPvrL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1827"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "1600 BC -  Sea People take over part of Greece after tsumani of Santorini eruption possibly the Ekwesh ",
:body => "<p>The repeated earthquakes and tsunamis from Santorini would have reduces the livability of the isles and land west of Santorini.  
After the eruption of Santorini, the availablity of the lands of Greece affected by the tsunamis would increase phanomally.  
There would be a pause before the invasion/rehabitation due to the uncertainty of another tsumani.  
Eventaually, people migrating would have begun filling the gaps in the islands and landscapes.  
</p>",
:slug => "WtvAyKYXHC",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Destruction of Sodom and Gomorrah ",
:body => "<p>Thera had two minor eruptions before exploding.  The first eruption cast a plume trace to the northeast of the 
Mediteranian.  Traces of the plume have been found in Turkey and parts of Lebinon.  The second eruption was towards the
south east over the land of Isreal.  Abraham  in the plains of Mamre would have seen the first eruption as something 
devine and safe as no fallout from the plume reached his location.  The interviening months between the first and second
eruptions would have allowed time for news of the destruction caused by the fallout of the first explosion to filter to 
Abraham.
</p><p>When the second eruption occured and the plume came overhead, Abraham was visited by people who survived the first plume.
These survivors were surely angles having survived by being on God's side.  They sought to warm Lot, his family and friends
that the fallout from the plume could destroy them.  Who or what the angles sent to Lot in Sodom is unknowable.
There effect on the crowd at Sodom seems real enough.  If something or someone is brought to the city with knowledge
of what is happening with the eruption plume overhead would be very sought after. Unless that city is one where they chop
you to pieces if you speak bad of the city.  Perdicting Doom would be bad so Lot tired to proctect them.
</p><p>
Steven Collins' work at Tall el-Hammam in Jordon has shown that the city he found matches the description of Sodom
as defined in the Bible.  During the work of excuvation, large quantities of glass where found that resemble Trinitite
indicating a very hot explotion.  That the glass was located in a area covering Tall el-Hammam suggests to me a 
volcanic cinder bomb not cooling correctly as it comes down resulting in a superheated explosion on a limited scale.
</p>",
:slug => "14bJqvhcPe",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Destruction of Sodom and Gomorrah ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Sodom and Gomorrah ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @place,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "49PMnjwbdw",
:lat => "31.8403",
:lng => "35.6740",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Sodom and Gomorrah ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @place,@biblical ],
:region => @middleeast,
:slug => "49PMnjwbdw",
:lat => "31.8403",
:lng => "35.6740",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "1628 BC - The 10 Plagues of Egypt ",
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
</p>",
:slug => "auKUTLtTEu",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "The 10 Plagues of Egypt ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "The 10 Plagues of Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Npte99cByT",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The 10 Plagues of Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @biblical ],
:region => @global,
:slug => "Npte99cByT",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ipuwer Papyrus ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Ipuwer Papyrus ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "aReQGu5rRn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ipuwer Papyrus ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "aReQGu5rRn",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@santorini_timeline.holocene_events << result unless @santorini_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Plague, survivors and the issue of war ",
:position =>chapter_index,
:slug => "4dZWkWqsvm",
:book => @book,
:body => "<p>Research on DNA traces of epidemics identified a epidemic that struck Europe about 1,500BC.
Curiously, it did not affect the population of the Middle East.
If a disease followed the same pattern of out of Africa via the Red Sea as in the Justian Plague, first to be infected would be the port
of call in the Red Sea.  
From there by land it would travel to Egypt and the Levant, by sea the Minoans would have taken it back to Crete and from there to its colonies in Greece and Anatolia.
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
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1530",
:body => "<p>The 'Battle' of Jerico and it subsiquent destruction of all living souls is a curious event in the history of Moses and the tribes.
The elaborate clensing ritual for the aftermath of the battle seems to be more of a contamination clense than calming the soul so as 
to not murder your wife and children after killing everyone in Jerico.
</p><p>That this battle was a cleansing of Bubonic Plague from Ancient Canna seems to fit the event and its description of the cleansing ritual after the battle.  That no living thing
was left alive was based on the fear of contagion.  In this case a bacterial plague.  This event seemed to influence Joshua's obsession with purity of the people as well.
</p><p>1550 BC - 1530 BC: Joshua 6:17 - Destruction of Jerico (radiocarbon dating range)
</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "BLgNXx0tXq",
:lat => "31.871",
:lng => "35.444",
:start_year_uncert => "43",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1530",
:body => "<p>The 'Battle' of Jerico and it subsiquent destruction of all living souls is a curious event in the history of Moses and the tribes.
The elaborate clensing ritual for the aftermath of the battle seems to be more of a contamination clense than calming the soul so as 
to not murder your wife and children after killing everyone in Jerico.
</p><p>That this battle was a cleansing of Bubonic Plague from Ancient Canna seems to fit the event and its description of the cleansing ritual after the battle.  That no living thing
was left alive was based on the fear of contagion.  In this case a bacterial plague.  This event seemed to influence Joshua's obsession with purity of the people as well.
</p><p>1550 BC - 1530 BC: Joshua 6:17 - Destruction of Jerico (radiocarbon dating range)
</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @middleeast,
:slug => "BLgNXx0tXq",
:lat => "31.871",
:lng => "35.444",
:url => "",
:user_id => @user.id,
:start_year_uncert => "43",
:start_year => "-1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bubonic Plague first appearance ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "<p>Gentic research into heart disease arrived at the conclustion that Bubonic plage appeared in Europe around 1,500 BC.
I use the cleansing ritual at the destruction of Jerico is show that Bubonic plague was already present in the Middle East around 1,550 BC.
This epidemic possibly reduced the population by 90%.  The British isles being the exception.
The evidence for this is the destuction of trading cities in Cornwall.  The archelogy showed a 90% reduction in the trading cities.  
</p>",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "nyX9gvs1Wq",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "<p>Gentic research into heart disease arrived at the conclustion that Bubonic plage appeared in Europe around 1,500 BC.
I use the cleansing ritual at the destruction of Jerico is show that Bubonic plague was already present in the Middle East around 1,550 BC.
This epidemic possibly reduced the population by 90%.  The British isles being the exception.
The evidence for this is the destuction of trading cities in Cornwall.  The archelogy showed a 90% reduction in the trading cities.  
</p>",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "nyX9gvs1Wq",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague strikes Egypt ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague strikes Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "Sy3cy4uQzx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague strikes Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @middleeast,
:slug => "Sy3cy4uQzx",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Canaanites arrive in eastern Nile Delta starting the Fourteenth Dynasty ", :start_year => -1800)
if result.length == 0
result = HoloceneEvent.create({:name => "Canaanites arrive in eastern Nile Delta starting the Fourteenth Dynasty ",
:end_year => "-1650",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "hM3MLa26D6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Canaanites arrive in eastern Nile Delta starting the Fourteenth Dynasty ",
:end_year => "-1650",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "hM3MLa26D6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Hyksos conquere Canaanites and Egyptian Dynasties ", :start_year => -1650)
if result.length == 0
result = HoloceneEvent.create({:name => "Hyksos conquere Canaanites and Egyptian Dynasties ",
:end_year => "-1550",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "vrcYUd42FS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hyksos conquere Canaanites and Egyptian Dynasties ",
:end_year => "-1550",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "vrcYUd42FS",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1650"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Hyksos expelled by Egyptian Dynasties ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Hyksos expelled by Egyptian Dynasties ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "cPPmsd7p4s",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hyksos expelled by Egyptian Dynasties ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "cPPmsd7p4s",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Exodus ",
:body => "<p>
Research has shown that there were two Exodus episodes.  
The first due to the plagues of Egypt eruption of Santorini and the second during the expultion of the Hyksos in the 1200's BC..
</p><p>When the plague showed up in the Middle East, it appears to have followed what happened during the Justian plague 
and that is infect the Middle East first.  Specifically the communitites closest to the Red Sea.  Jericho being amoung those cities affected.
</p><p>The fact of the infection of Jericho and what would have been the smoke from the Kaali Meteor Impact bring a 'Three Day of Darkness' effect towards the end of the 10 Plagues of Egypt, Moses started the first Exodes.
</p><p>This Exodes occured with in the background of the explustion of the Hyksos from Egypt which occured around 1,550 BC.  This Exodus was uneventful, a direct wandering towards Jerico and the plague.
</p><p>The 'Battle of Jericho' can be viewed as a clensing of disease, specifically the plague.  By the killing of every man, woman and child, the human vector of a disease dies.  The elaborate cleanse after the battle is more in line with self-quarantine with the cleaning and waiting for a disease vector to take effect.
</p><p>This event also brings up dates of inconvience.  Moses living to 120 year old had the experience and readiness of Joshua who lived to 110 years old.  They were together during the Exodes and afterward in the desert.
</p><p>Yet, they had to cleanse Jerico. 
</p>",
:slug => "9rRD70A7Cz",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Kaali Meteor Impact ", :start_year => -1490)
if result.length == 0
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "5Vtm7NNqvC",
:lat => "",
:lng => "",
:start_year_uncert => "40",
:start_year => "-1490"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kaali Meteor Impact ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @impact ],
:region => @europe,
:slug => "5Vtm7NNqvC",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "40",
:start_year => "-1490"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Exodus - First ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Exodus - First ",
:end_year => "-1500",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "A454rpR8sz",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Exodus - First ",
:end_year => "-1500",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @middleeast,
:slug => "A454rpR8sz",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Exodus - Second ", :start_year => -1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Exodus - Second ",
:end_year => "-1200",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "jCkVJc5QQU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Exodus - Second ",
:end_year => "-1200",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @middleeast,
:slug => "jCkVJc5QQU",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Moses ", :start_year => -1592)
if result.length == 0
result = HoloceneEvent.create({:name => "Moses ",
:end_year => "-1472",
:body => "<p>Lived 120 years.</p>",
:tag_list => ["BiblicalEvent", "BiblicalEvent"],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "VTUEYfckpy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1592"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Moses ",
:end_year => "-1472",
:body => "<p>Lived 120 years.</p>",
:tag_list => ["BiblicalEvent", "BiblicalEvent"],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "VTUEYfckpy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1592"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua ", :start_year => -1565)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua ",
:end_year => "-1455",
:body => "<p>Lived 110 years.</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "7WL5ZMQNUz",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1565"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua ",
:end_year => "-1455",
:body => "<p>Lived 110 years.</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "7WL5ZMQNUz",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1565"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1530",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "J0LuYtZEd5",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "-1530",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "J0LuYtZEd5",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Period of the Judges ",
:body => "<p>The period of the Judges is important for defining a age guestimate for Joshua.  His passing of the tourch to the Judges
sets the time period for his death.
</p>",
:slug => "M0zJfXvyrd",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Period of the Judges ", :start_year => -1510)
if result.length == 0
result = HoloceneEvent.create({:name => "Period of the Judges ",
:end_year => "-1100",
:body => "<p>The Period of the Judges is one that has better stability of evidence.  From the passing of the tourch from Joshua to the judges,
the textual analysis is stronger for the reality of the stories.
</p><p>1382 BC - 1063 BC - Period of the Judges - alternate dates
</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [  @cultural,@biblical ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Biblical_judges",
:user_id => @user.id,
:slug => "d74JhJzHQK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1510"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Period of the Judges ",
:end_year => "-1100",
:body => "<p>The Period of the Judges is one that has better stability of evidence.  From the passing of the tourch from Joshua to the judges,
the textual analysis is stronger for the reality of the stories.
</p><p>1382 BC - 1063 BC - Period of the Judges - alternate dates
</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [ @cultural,@biblical ],
:region => @middleeast,
:slug => "d74JhJzHQK",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Biblical_judges",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1510"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 6 ", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1f4JAZmz1Z",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "1f4JAZmz1Z",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Leviticus 19:19 ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Leviticus 19:19 ",
:end_year => "",
:body => "<p>
' [the Hebrew people] shalt not sow their field with mingled seed... '(King James Bible)
</p><p>
Some scholars believe the phrase mingled seeds includes grafting, although this interpretation remains contentious among scholars as some have taken this phrase to mean purity of race as well.  
In reality, it seems to include things which waste time or resources.  Trying to crossbreed animals that are not compatible wastes time and effort.  
Wearing cloths of two or more fabrics is both a was of time and resources.  If a field is planted with two different seeds how can they be properly harvested?
</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [  @cultural,@biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZmFVGNzFdP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leviticus 19:19 ",
:end_year => "",
:body => "<p>
' [the Hebrew people] shalt not sow their field with mingled seed... '(King James Bible)
</p><p>
Some scholars believe the phrase mingled seeds includes grafting, although this interpretation remains contentious among scholars as some have taken this phrase to mean purity of race as well.  
In reality, it seems to include things which waste time or resources.  Trying to crossbreed animals that are not compatible wastes time and effort.  
Wearing cloths of two or more fabrics is both a was of time and resources.  If a field is planted with two different seeds how can they be properly harvested?
</p>",
:tag_list => ["BiblicalEvent"],
:event_types => [ @cultural,@biblical ],
:region => @global,
:slug => "ZmFVGNzFdP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Small reoccupation of Jerico ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Small reoccupation of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "deQtfKnM6c",
:lat => "31.871",
:lng => "35.444",
:start_year_uncert => "",
:start_year => "-1500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Small reoccupation of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "deQtfKnM6c",
:lat => "31.871",
:lng => "35.444",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jerico unoccupied ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Jerico unoccupied ",
:end_year => "-900",
:body => "",
:tag_list => [],
:event_types => [  @place,@place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "vZQwG0HaCL",
:lat => "31.871",
:lng => "35.444",
:start_year_uncert => "",
:start_year => "-1400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jerico unoccupied ",
:end_year => "-900",
:body => "",
:tag_list => [],
:event_types => [ @place,@place ],
:region => @middleeast,
:slug => "vZQwG0HaCL",
:lat => "31.871",
:lng => "35.444",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Bronze Age Collapse ",
:position =>chapter_index,
:slug => "PaP1YTS4mE",
:book => @book,
:body => "<p>A great question in history has always been the collapse of the Prototypical Manoral societies in the Macadonian and Greek areas.  
With an event which produced an 18 year substandard harvest resulting in a transgenerational famine
 with people facing genocide due to the weather.   
People searching for substance flooded south into any area that had any food without care as to those there already.  
The most famous are the Sea People.
</p><p>
The Sea People are believed to be from the various islands of the Mediterranean.  
Another possibility is that they came from the areas of the Black sea.  
This could explain the fact that they all seemed to have some form of Greekness. 
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Mycenea - Earthquake ", :start_year => -1240)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea - Earthquake ",
:end_year => "",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "eQhjgDKRSj",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1240"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea - Earthquake ",
:end_year => "",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "eQhjgDKRSj",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1240"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mycenea - Earthquakes ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "VRxR83QSX1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "VRxR83QSX1",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Late Bronze Age Collapse ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "j7PgC7AZB7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "j7PgC7AZB7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Poseidon's Horses: Earthquake Swarm ", :start_year => -1225)
if result.length == 0
result = HoloceneEvent.create({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "DDbtEx5APa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1225"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "DDbtEx5APa",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1225"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "1260 BC - 1180 BC - Trojan War ",
:body => "<p>That the Trojan war is placed in the bronze Age Collapse, the question of motives is that the Trojans and their allies may have been the
Sea Peoples and were finally cornered as told by the Iliad.
</p><p>
Apollo his association with mice and their caring of plague was noted in the Iliad.  
That such an association should be stated so clearly indicated along standing understanding of causes of disease.
</p><p>
</p>",
:slug => "E3EQUCyukF",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Trojan War ", :start_year => -1260)
if result.length == 0
result = HoloceneEvent.create({:name => "Trojan War ",
:end_year => "-1180",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "7eHJkUCthh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1260"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Trojan War ",
:end_year => "-1180",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "7eHJkUCthh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1260"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Helka 3, Iceland VEI 6 ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Helka 3, Iceland VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "fr32TARSK4",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helka 3, Iceland VEI 6 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "fr32TARSK4",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Downturn of environment: Tree Ring Event(18 years) ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2uz8s2xdW4",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "2uz8s2xdW4",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "1100 BC - 776 BC - Greek Dark Ages ",
:body => "",
:slug => "vcC0z44mDN",
:position => section_index,
:display_name => true,
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
:url => "",
:user_id => @user.id,
:slug => "75wpGRDGXs",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Greek Dark Ages ",
:end_year => "-776",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:slug => "75wpGRDGXs",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Homeric Minimum ", :start_year => -950)
if result.length == 0
result = HoloceneEvent.create({:name => "Homeric Minimum ",
:end_year => "-800",
:body => "<p>Solar minimum.
</p>",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "FGj7wau1Xy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Homeric Minimum ",
:end_year => "-800",
:body => "<p>Solar minimum.
</p>",
:tag_list => [],
:event_types => [ @earth ],
:region => @global,
:slug => "FGj7wau1Xy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Olympic Games ", :start_year => -776)
if result.length == 0
result = HoloceneEvent.create({:name => "First Olympic Games ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "QE2cKvGgqD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-776"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Olympic Games ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "QE2cKvGgqD",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-776"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Crisis of the Third Century ",
:position =>chapter_index,
:slug => "3ubM7cerde",
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
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "1T4r8SQ6aZ",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-206"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Romans Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "1T4r8SQ6aZ",
:lat => "37.21",
:lng => "-6.938",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-206"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "yjNkqx6rW1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "165"
})
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
:slug => "yjNkqx6rW1",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "165"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 7 ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "9EC60WFaKh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "180"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "9EC60WFaKh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
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
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "4nVhAsHJjn",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "180"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mauri Conquer Rio Tinto and area ",
:end_year => "200",
:body => "<p>The loss of the

Rio Tinto mines silver output to the Roman empire brought about the crisis of the Third century.
</p><p>
The Mauri conquered the area when the Roman army contracted due to the plague of Antonine.  The plague decimated the army with a 13 to 15 percent loss with the cities suffering similarly while the rural population suffered 7 to 10 percent in loss of life.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "4nVhAsHJjn",
:lat => "37.21",
:lng => "-6.938",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
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
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "9VRyrmXCM7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "284"
})
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
:event_types => [  ],
:region => @global,
:slug => "9VRyrmXCM7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "284"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Start of Migration Period ", :start_year => 300)
if result.length == 0
result = HoloceneEvent.create({:name => "Start of Migration Period ",
:end_year => "",
:body => "<p>
Several smaller volcanic eruptions about this time may have lead to the Age of Migration.  Volcanic eruptions can have an accumulative effect on the climate resulting in a global winter without a single cause.  A 'Winter' would be the straw that broke as at the end of such a 'Winter', a patent starts to see that their eldest child is failing due to lack of nourishment.
</p>",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "BM10wrN2a2",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Start of Migration Period ",
:end_year => "",
:body => "<p>
Several smaller volcanic eruptions about this time may have lead to the Age of Migration.  Volcanic eruptions can have an accumulative effect on the climate resulting in a global winter without a single cause.  A 'Winter' would be the straw that broke as at the end of such a 'Winter', a patent starts to see that their eldest child is failing due to lack of nourishment.
</p>",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "BM10wrN2a2",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Constantine I - Law reaffirming Coloni(serfdom) ", :start_year => 325)
if result.length == 0
result = HoloceneEvent.create({:name => "Constantine I - Law reaffirming Coloni(serfdom) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @person ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "XPjgNbhNpJ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "325"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Constantine I - Law reaffirming Coloni(serfdom) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @person ],
:region => @europe,
:slug => "XPjgNbhNpJ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "325"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Huns force Goths into Roman Empire ", :start_year => 376)
if result.length == 0
result = HoloceneEvent.create({:name => "Huns force Goths into Roman Empire ",
:end_year => "",
:body => "<p>The arriving Huns force the Goths to flee into Roman territories.  Beginning of the Migration-Invasion question as groups try to get out of the way of the Huns.</p>",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "WyZYsSxNBS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "376"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Huns force Goths into Roman Empire ",
:end_year => "",
:body => "<p>The arriving Huns force the Goths to flee into Roman territories.  Beginning of the Migration-Invasion question as groups try to get out of the way of the Huns.</p>",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "WyZYsSxNBS",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "376"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@crisis_3rd_century_timeline.holocene_events << result unless @crisis_3rd_century_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Arthur and The Justian Plague ",
:position =>chapter_index,
:slug => "XRU6TRPHdt",
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
result = HoloceneEvent.where(:name => "Badon Hill ", :start_year => 500)
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
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Battle_of_Badon",
:user_id => @user.id,
:slug => "eePSTUVz83",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "500"
})
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
:event_types => [ @place ],
:region => @europe,
:slug => "eePSTUVz83",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Battle_of_Badon",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilopango, El Salvador VEI 7 ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "9TKQv1VAsE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "9TKQv1VAsE",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ",
:end_year => "536",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "nAfTavBW4Z",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ",
:end_year => "536",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "nAfTavBW4Z",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Year of Darkness - global winter ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "J9HcLLUF0M",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "J9HcLLUF0M",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Year of Darkness - total weather affect ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - total weather affect ",
:end_year => "595",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3me9r9daL3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Year of Darkness - total weather affect ",
:end_year => "595",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "3me9r9daL3",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
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
:event_types => [  @person,@cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "RNtuZQKKfZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "537"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Death of Arthur ",
:end_year => "",
:body => "<p>
In the Anneals Cambriae entry for 537 states 'The Strife of Camlann in which Arthur and Medraut fell [and there was death in Britain and in Ireland].'
The '[and there was death in Britain and Ireland]' ties the death of Arthur to the deaths resulting from the 535 event.
</p>",
:tag_list => ["Arthur"],
:event_types => [ @person,@cultural ],
:region => @europe,
:slug => "RNtuZQKKfZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "537"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Famine"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QC19DLHt8N",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Famine"],
:event_types => [  ],
:region => @global,
:slug => "QC19DLHt8N",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
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
:event_types => [  @person ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Manch%C3%A1n_of_Mohill",
:user_id => @user.id,
:slug => "pCvbegZHpD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "464"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Manchán of Mohill ",
:end_year => "538",
:body => "<p>Manchán of Mohill founded many early Christian churches in Ireland.  Died during the Cold/Famine events of the global winter associated with the 535/536 event.
</p>",
:tag_list => [],
:event_types => [ @person ],
:region => @europe,
:slug => "pCvbegZHpD",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Manch%C3%A1n_of_Mohill",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "464"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "ZdXqC7vnfN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "639"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Emmaus ",
:end_year => "",
:body => "<p>Bubonic Plague struck after conquest by the Rashidun Caliphate who setup a military camp.
</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "ZdXqC7vnfN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "639"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
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
:url => "https://en.wikipedia.org/wiki/Plague_of_Mohill",
:user_id => @user.id,
:slug => "KaG6VPKQ3b",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "544"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Mohill ",
:end_year => "",
:body => "<p>Arrival of Plague in Ireland.
</p>",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "KaG6VPKQ3b",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Plague_of_Mohill",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "544"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread", :start_year => 539)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "MJ8Le00pSq",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "539"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [  ],
:region => @global,
:slug => "MJ8Le00pSq",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "539"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("annalesulster")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Failure of Bread", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Wq53v6RAwX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "540"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_types => [  ],
:region => @global,
:slug => "Wq53v6RAwX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("annalesulster")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Justian Plague - Second Occurrence of Plague in Europe ", :start_year => 541)
if result.length == 0
result = HoloceneEvent.create({:name => "Justian Plague - Second Occurrence of Plague in Europe ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Vm7Rvyt2MM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "541"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Justian Plague - Second Occurrence of Plague in Europe ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Vm7Rvyt2MM",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "541"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@arthur_timeline.holocene_events << result unless @arthur_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Bond Event 0 ",
:position =>chapter_index,
:slug => "qmMnnGLsMP",
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
:slug => "yxj2dT4hR3",
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
result = HoloceneEvent.where(:name => "Start of Cuneiform writing", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Start of Cuneiform writing",
:end_year => "-3000",
:body => "<p>Sumerian city of Uruk</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:slug => "tu2T7Ddyyf",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Start of Cuneiform writing",
:end_year => "-3000",
:body => "<p>Sumerian city of Uruk</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "tu2T7Ddyyf",
:lat => "",
:lng => "",
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cuneiform writing convays concepts as well i.e. honour vs an honourable man", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Cuneiform writing convays concepts as well i.e. honour vs an honourable man",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:slug => "EtMKWCvpKS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cuneiform writing convays concepts as well i.e. honour vs an honourable man",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "EtMKWCvpKS",
:lat => "",
:lng => "",
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cuneiform writing expresses full Rebus Principle", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Cuneiform writing expresses full Rebus Principle",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:slug => "trPAhyJvdf",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cuneiform writing expresses full Rebus Principle",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "trPAhyJvdf",
:lat => "",
:lng => "",
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Babylonian Table describing rudimentary form of integral calculus ", :start_year => -350)
if result.length == 0
result = HoloceneEvent.create({:name => "Babylonian Table describing rudimentary form of integral calculus ",
:end_year => "-50",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "xMwY76yDZu",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Babylonian Table describing rudimentary form of integral calculus ",
:end_year => "-50",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "xMwY76yDZu",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-350"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "K8538 - Sumerian Star Map ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "<p>Alternate dating 3,300 BC
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "vfsJsFpVNL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "<p>Alternate dating 3,300 BC
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "vfsJsFpVNL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2193"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine developed in China ", :start_year => -7000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine developed in China ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @fareast,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "ULv7BdZ8KL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine developed in China ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @fareast,
:slug => "ULv7BdZ8KL",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Grapes in Georgia ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Grapes in Georgia ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "PW2TkqsAuT",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Grapes in Georgia ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "PW2TkqsAuT",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine in Georgia ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Georgia ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "tcB2Zrh9DY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine in Georgia ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "tcB2Zrh9DY",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine in Iran ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Iran ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "bjb7hATM4J",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine in Iran ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "bjb7hATM4J",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine in Greece ", :start_year => -4500)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Greece ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "K6Be4X1CqS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine in Greece ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "K6Be4X1CqS",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine in Egypt ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "TdWRe7pbf0",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine in Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "TdWRe7pbf0",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine in Sicily ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Sicily ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "hRXZD1wYYN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine in Sicily ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "hRXZD1wYYN",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Oldest Winery in Armenia ", :start_year => -4100)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest Winery in Armenia ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "M7fP0FZDhL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Oldest Winery in Armenia ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "M7fP0FZDhL",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gesher", :start_year => -10459)
if result.length == 0
result = HoloceneEvent.create({:name => "Gesher",
:end_year => "",
:body => "<p>Possible center of Neolithic Revolution.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Gesher_(archaeological_site)",
:user_id => @user.id,
:slug => "cwHASRwetH",
:lat => "32.602778",
:lng => "35.555556",
:start_year_uncert => "348",
:start_year => "-10459"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gesher",
:end_year => "",
:body => "<p>Possible center of Neolithic Revolution.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "cwHASRwetH",
:lat => "32.602778",
:lng => "35.555556",
:url => "https://en.wikipedia.org/wiki/Gesher_(archaeological_site)",
:user_id => @user.id,
:start_year_uncert => "348",
:start_year => "-10459"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Appearance of Wheeled Vehicles", :start_year => -3700)
if result.length == 0
result = HoloceneEvent.create({:name => "Appearance of Wheeled Vehicles",
:end_year => "-3500",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "B98pASrewy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Appearance of Wheeled Vehicles",
:end_year => "-3500",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "B98pASrewy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beer", :start_year => -11000)
if result.length == 0
result = HoloceneEvent.create({:name => "Beer",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "Q1vNuLA4xy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-11000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beer",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "Q1vNuLA4xy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-11000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Potter's Wheel", :start_year => -4500)
if result.length == 0
result = HoloceneEvent.create({:name => "Potter's Wheel",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "J7218AYAgP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Potter's Wheel",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @neareast,
:slug => "J7218AYAgP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ljubljana Marshes Wheel", :start_year => -3150)
if result.length == 0
result = HoloceneEvent.create({:name => "Ljubljana Marshes Wheel",
:end_year => "",
:body => "<p>Oldest wheel found.  Wheel was for a pushcart.
</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "ZRgWhPvFfv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ljubljana Marshes Wheel",
:end_year => "",
:body => "<p>Oldest wheel found.  Wheel was for a pushcart.
</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "ZRgWhPvFfv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3150"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Scorpion I", :start_year => -3200)
if result.length == 0
result = HoloceneEvent.create({:name => "Scorpion I",
:end_year => "-3150",
:body => "<p>Scoprion I seems to have started Egypt towards written language.  Evidence found in his tomb suggests writing was developed
to record tribute from conqured cities.  Scopion I was barried with imported grape wine laced with madicinal herbs as well as wine, dried grapes, grape seed and skins.
</p>",
:tag_list => [],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "ufHF2Utuzf",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Scorpion I",
:end_year => "-3150",
:body => "<p>Scoprion I seems to have started Egypt towards written language.  Evidence found in his tomb suggests writing was developed
to record tribute from conqured cities.  Scopion I was barried with imported grape wine laced with madicinal herbs as well as wine, dried grapes, grape seed and skins.
</p>",
:tag_list => [],
:event_types => [ @person ],
:region => @middleeast,
:slug => "ufHF2Utuzf",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gilgal", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "Gilgal",
:end_year => "",
:body => "<p>Carbonized figs from a variant which can only be propogated by hand found dated to 9,400 BC.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "Qr7u6hMZX9",
:lat => "32.032778",
:lng => "35.475556",
:start_year_uncert => "",
:start_year => "-9500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gilgal",
:end_year => "",
:body => "<p>Carbonized figs from a variant which can only be propogated by hand found dated to 9,400 BC.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "Qr7u6hMZX9",
:lat => "32.032778",
:lng => "35.475556",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Scorpion II/Narmer", :start_year => -3150)
if result.length == 0
result = HoloceneEvent.create({:name => "Scorpion II/Narmer",
:end_year => "-3150",
:body => "<p>Starts conquest of Lower Egypt to unify Egypt.
</p>",
:tag_list => [],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "fUaPkpqjyg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Scorpion II/Narmer",
:end_year => "-3150",
:body => "<p>Starts conquest of Lower Egypt to unify Egypt.
</p>",
:tag_list => [],
:event_types => [ @person ],
:region => @middleeast,
:slug => "fUaPkpqjyg",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3150"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Hyxos introduce Horse to Egypt ", :start_year => -1658)
if result.length == 0
result = HoloceneEvent.create({:name => "Hyxos introduce Horse to Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "ACN1t4W5WN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1658"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hyxos introduce Horse to Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "ACN1t4W5WN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1658"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Propogation of Fig trees at Gilgal ", :start_year => -9400)
if result.length == 0
result = HoloceneEvent.create({:name => "Propogation of Fig trees at Gilgal ",
:end_year => "",
:body => "<p>Variant can only be propogated by hand.
</p>",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "ttSNG2X6G5",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Propogation of Fig trees at Gilgal ",
:end_year => "",
:body => "<p>Variant can only be propogated by hand.
</p>",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "ttSNG2X6G5",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginning occupation of Nabta Playa, Egypt ", :start_year => -9000)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginning occupation of Nabta Playa, Egypt ",
:end_year => "-7000",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "eMMLJF7k3C",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-9000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginning occupation of Nabta Playa, Egypt ",
:end_year => "-7000",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "eMMLJF7k3C",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Large scale occupation of Nabta Playa, Egypt ", :start_year => -7000)
if result.length == 0
result = HoloceneEvent.create({:name => "Large scale occupation of Nabta Playa, Egypt ",
:end_year => "-6000",
:body => "<p>Sustenance included fruit, legumes, millets, sorghum and tubers.  Goats and sheep were imported.
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "En9s7WWKdK",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-7000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Large scale occupation of Nabta Playa, Egypt ",
:end_year => "-6000",
:body => "<p>Sustenance included fruit, legumes, millets, sorghum and tubers.  Goats and sheep were imported.
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "En9s7WWKdK",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Construction of stone calendar at Nabta Playa, Egypt ", :start_year => -4800)
if result.length == 0
result = HoloceneEvent.create({:name => "Construction of stone calendar at Nabta Playa, Egypt ",
:end_year => "",
:body => "<p>This was the creation of a smaller stone circle inside those set earlier.
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "6RqgWkU85Z",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-4800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Construction of stone calendar at Nabta Playa, Egypt ",
:end_year => "",
:body => "<p>This was the creation of a smaller stone circle inside those set earlier.
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "6RqgWkU85Z",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Alignment of megalithic stones at Nabta Playa, Egypt ", :start_year => -6270)
if result.length == 0
result = HoloceneEvent.create({:name => "Alignment of megalithic stones at Nabta Playa, Egypt ",
:end_year => "",
:body => "<p>
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "TaYAPYJJK4",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-6270"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Alignment of megalithic stones at Nabta Playa, Egypt ",
:end_year => "",
:body => "<p>
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "TaYAPYJJK4",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6270"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Zorats Karer(Carahunge) ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Zorats Karer(Carahunge) ",
:end_year => "",
:body => "<p>The 'Armenian Stonehenge'.
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "nLuWRgEymZ",
:lat => "39.5507",
:lng => "46.0286",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zorats Karer(Carahunge) ",
:end_year => "",
:body => "<p>The 'Armenian Stonehenge'.
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @eurasia,
:slug => "nLuWRgEymZ",
:lat => "39.5507",
:lng => "46.0286",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge before the monument ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge before the monument ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "zgbxpxaDbq",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge before the monument ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "zgbxpxaDbq",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 1 ", :start_year => -3100)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 1 ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "q0CQh3rYD1",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-3100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 1 ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "q0CQh3rYD1",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3100"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 2 ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 2 ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "78jRtfHkyN",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 2 ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "78jRtfHkyN",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 I ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 I ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "AHA9NexZX3",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 I ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "AHA9NexZX3",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 II ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 II ",
:end_year => "-2400",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "071J92x4tT",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 II ",
:end_year => "-2400",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "071J92x4tT",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 III ", :start_year => -2400)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 III ",
:end_year => "-2280",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "D3EMGJTUXF",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 III ",
:end_year => "-2280",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "D3EMGJTUXF",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2400"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 IV ", :start_year => -2280)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 IV ",
:end_year => "-1930",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "0agCWvmKkG",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2280"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 IV ",
:end_year => "-1930",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "0agCWvmKkG",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2280"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 V ", :start_year => -1930)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 V ",
:end_year => "-1600",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "PfvecguSuc",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-1930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 V ",
:end_year => "-1600",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "PfvecguSuc",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1930"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge - Post construction ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge - Post construction ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "MvpxrfHSjS",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-1600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge - Post construction ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "MvpxrfHSjS",
:lat => "51.178889",
:lng => "-1.826111",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1600"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '320px-Stonehenge2007_07_30.jpg')), filename: '320px-Stonehenge2007_07_30.jpg', content_type: 'image/20px-stonehenge2007_07_30.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carnac Stones in Brittany ", :start_year => -4500)
if result.length == 0
result = HoloceneEvent.create({:name => "Carnac Stones in Brittany ",
:end_year => "-3300",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "dfyZ9AyXzd",
:lat => "47.5965",
:lng => "-3.066",
:start_year_uncert => "",
:start_year => "-4500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carnac Stones in Brittany ",
:end_year => "-3300",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "dfyZ9AyXzd",
:lat => "47.5965",
:lng => "-3.066",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Alignment of belt stones to Orion Nabta Playa, Egypt ", :start_year => -6400)
if result.length == 0
result = HoloceneEvent.create({:name => "Alignment of belt stones to Orion Nabta Playa, Egypt ",
:end_year => "-4900",
:body => "<p>
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "m3mACeUC5W",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-6400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Alignment of belt stones to Orion Nabta Playa, Egypt ",
:end_year => "-4900",
:body => "<p>
</p>",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "m3mACeUC5W",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Çatalhöyük ", :start_year => -7500)
if result.length == 0
result = HoloceneEvent.create({:name => "Çatalhöyük ",
:end_year => "-5700",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/%C3%87atalh%C3%B6y%C3%BCk",
:user_id => @user.id,
:slug => "0UzZWJgVEF",
:lat => "37.666667",
:lng => "32.828056",
:start_year_uncert => "",
:start_year => "-7500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Çatalhöyük ",
:end_year => "-5700",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "0UzZWJgVEF",
:lat => "37.666667",
:lng => "32.828056",
:url => "https://en.wikipedia.org/wiki/%C3%87atalh%C3%B6y%C3%BCk",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tell Sabi Abyad ", :start_year => -7550)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Sabi Abyad ",
:end_year => "-1250",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:slug => "gq3W2XeLNf",
:lat => "36.504",
:lng => "39.093",
:start_year_uncert => "",
:start_year => "-7550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Sabi Abyad ",
:end_year => "-1250",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "gq3W2XeLNf",
:lat => "36.504",
:lng => "39.093",
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7550"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Oldest pottery in Syria - Tell Sabi Abyad ", :start_year => -6900)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest pottery in Syria - Tell Sabi Abyad ",
:end_year => "-6800",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:slug => "x4QLCMCwFu",
:lat => "36.504",
:lng => "39.093",
:start_year_uncert => "",
:start_year => "-6900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Oldest pottery in Syria - Tell Sabi Abyad ",
:end_year => "-6800",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "x4QLCMCwFu",
:lat => "36.504",
:lng => "39.093",
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joshua  ", :start_year => -1565)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua  ",
:end_year => "-1455",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Battle_of_Jericho",
:user_id => @user.id,
:slug => "eKMQuujNNU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1565"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua  ",
:end_year => "-1455",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "eKMQuujNNU",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Battle_of_Jericho",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1565"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mureybet ", :start_year => -10200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mureybet ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Mureybet",
:user_id => @user.id,
:slug => "1t67HAqMQm",
:lat => "36.0434",
:lng => "38.1287",
:start_year_uncert => "",
:start_year => "-10200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mureybet ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "1t67HAqMQm",
:lat => "36.0434",
:lng => "38.1287",
:url => "https://en.wikipedia.org/wiki/Mureybet",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jericho is founded ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Jericho is founded ",
:end_year => "",
:body => "<p>Initial habitation was intermittent due to the droughts and cold of the Younger Dryas time period.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Jericho",
:user_id => @user.id,
:slug => "J1KdxtrcSP",
:lat => "31.871111",
:lng => "35.444167",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jericho is founded ",
:end_year => "",
:body => "<p>Initial habitation was intermittent due to the droughts and cold of the Younger Dryas time period.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "J1KdxtrcSP",
:lat => "31.871111",
:lng => "35.444167",
:url => "https://en.wikipedia.org/wiki/Jericho",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tower of Jericho is completed ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "<p>The tower seems to have been created as an anti-flooding system.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tower_of_Jericho",
:user_id => @user.id,
:slug => "s5Wn1b791p",
:lat => "31.871111",
:lng => "35.444167",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "<p>The tower seems to have been created as an anti-flooding system.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "s5Wn1b791p",
:lat => "31.871111",
:lng => "35.444167",
:url => "https://en.wikipedia.org/wiki/Tower_of_Jericho",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tower of Jericho is completed ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "<p>The tower seems to have been created as an anti-flooding system.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tower_of_Jericho",
:user_id => @user.id,
:slug => "MQHczpYgac",
:lat => "31.871111",
:lng => "35.444167",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "<p>The tower seems to have been created as an anti-flooding system.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "MQHczpYgac",
:lat => "31.871111",
:lng => "35.444167",
:url => "https://en.wikipedia.org/wiki/Tower_of_Jericho",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Suppiluliuma I died in the plague which spread across the region ", :start_year => -1322)
if result.length == 0
result = HoloceneEvent.create({:name => "Suppiluliuma I died in the plague which spread across the region ",
:end_year => "",
:body => "<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "bXUCG3hnWr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1322"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Suppiluliuma I died in the plague which spread across the region ",
:end_year => "",
:body => "<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "bXUCG3hnWr",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1322"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Çayönü Tepesi ", :start_year => -7200)
if result.length == 0
result = HoloceneEvent.create({:name => "Çayönü Tepesi ",
:end_year => "-6600",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/%C3%87ay%C3%B6n%C3%BC",
:user_id => @user.id,
:slug => "8nUQzJn4FW",
:lat => "38.216389",
:lng => "39.726389",
:start_year_uncert => "",
:start_year => "-7200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Çayönü Tepesi ",
:end_year => "-6600",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "8nUQzJn4FW",
:lat => "38.216389",
:lng => "39.726389",
:url => "https://en.wikipedia.org/wiki/%C3%87ay%C3%B6n%C3%BC",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sweet Track in Britian ", :start_year => -3807)
if result.length == 0
result = HoloceneEvent.create({:name => "Sweet Track in Britian ",
:end_year => "",
:body => "<p>Trackway built over older trackway from 3838 BC.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Sweet_Track",
:user_id => @user.id,
:slug => "L4JevSGaCn",
:lat => "51.164167",
:lng => "-2.826389",
:start_year_uncert => "",
:start_year => "-3807"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sweet Track in Britian ",
:end_year => "",
:body => "<p>Trackway built over older trackway from 3838 BC.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "L4JevSGaCn",
:lat => "51.164167",
:lng => "-2.826389",
:url => "https://en.wikipedia.org/wiki/Sweet_Track",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3807"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Galen ", :start_year => 216)
if result.length == 0
result = HoloceneEvent.create({:name => "Galen ",
:end_year => "",
:body => "<p>Doctor during the Antonine Plague.
</p>",
:tag_list => [],
:event_types => [  @person ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2kkW6dwzEh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "216"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Galen ",
:end_year => "",
:body => "<p>Doctor during the Antonine Plague.
</p>",
:tag_list => [],
:event_types => [ @person ],
:region => @global,
:slug => "2kkW6dwzEh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "216"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Goseck Circle ", :start_year => -4900)
if result.length == 0
result = HoloceneEvent.create({:name => "Goseck Circle ",
:end_year => "-4700",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Goseck_circle",
:user_id => @user.id,
:slug => "Bpxqq2ZVxg",
:lat => "51.198333",
:lng => "11.864722",
:start_year_uncert => "",
:start_year => "-4900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Goseck Circle ",
:end_year => "-4700",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "Bpxqq2ZVxg",
:lat => "51.198333",
:lng => "11.864722",
:url => "https://en.wikipedia.org/wiki/Goseck_circle",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Measles emerges as an infectious disease ", :start_year => 500)
if result.length == 0
result = HoloceneEvent.create({:name => "Measles emerges as an infectious disease ",
:end_year => "900",
:body => "",
:tag_list => ["Disease"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "F0kfXX6xD8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Measles emerges as an infectious disease ",
:end_year => "900",
:body => "",
:tag_list => ["Disease"],
:event_types => [  ],
:region => @global,
:slug => "F0kfXX6xD8",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Persian physician Rhazes 860–932 ", :start_year => 932)
if result.length == 0
result = HoloceneEvent.create({:name => "Persian physician Rhazes 860–932 ",
:end_year => "",
:body => "<p>The first systematic description of measles, and its distinction from smallpox and chickenpox, in 'The Book of Smallpox and Measles'.
</p>",
:tag_list => ["Disease"],
:event_types => [  @person ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "7VSq7v20kw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "932"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Persian physician Rhazes 860–932 ",
:end_year => "",
:body => "<p>The first systematic description of measles, and its distinction from smallpox and chickenpox, in 'The Book of Smallpox and Measles'.
</p>",
:tag_list => ["Disease"],
:event_types => [ @person ],
:region => @fareast,
:slug => "7VSq7v20kw",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "932"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Ogyges ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Ogyges ",
:end_year => "",
:body => "<p>Plato, Laws, Book III.
</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "E7FxezJPDr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Ogyges ",
:end_year => "",
:body => "<p>Plato, Laws, Book III.
</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [ @earth ],
:region => @europe,
:slug => "E7FxezJPDr",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chickens reached Europe ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Europe ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "H2YmvZBa12",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chickens reached Europe ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @europe,
:slug => "H2YmvZBa12",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chickens reached Syria ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Syria ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "rC9mKuhHf0",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chickens reached Syria ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "rC9mKuhHf0",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chickens reached Egypt ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "kCyvmymDrj",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chickens reached Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "kCyvmymDrj",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "China/Harappan origins of Chickens ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "China/Harappan origins of Chickens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @husbandry ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "PQ6A5b3CGz",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "China/Harappan origins of Chickens ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @husbandry ],
:region => @fareast,
:slug => "PQ6A5b3CGz",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Signs of Tuberculosis in humans ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Signs of Tuberculosis in humans ",
:end_year => "",
:body => "<p>Acquired from domesticated animals</p>",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Fv07BstxZv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Signs of Tuberculosis in humans ",
:end_year => "",
:body => "<p>Acquired from domesticated animals</p>",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @global,
:slug => "Fv07BstxZv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tubercular decay in the spines of Egyptian mummies ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Tubercular decay in the spines of Egyptian mummies ",
:end_year => "-2400",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "s7M1jjFpCD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tubercular decay in the spines of Egyptian mummies ",
:end_year => "-2400",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "s7M1jjFpCD",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "One in four deaths in England was due to 'consumption'/Tuberculosis ", :start_year => 1815)
if result.length == 0
result = HoloceneEvent.create({:name => "One in four deaths in England was due to 'consumption'/Tuberculosis ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "F6CgpvEpn6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1815"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "One in four deaths in England was due to 'consumption'/Tuberculosis ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "F6CgpvEpn6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1815"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Oldest skeletal evidence for Leprosy ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest skeletal evidence for Leprosy ",
:end_year => "",
:body => "<p>Found in human remains from the archaeological sites of Balathal in India and Harappa in Pakistan</p>",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "asArkwfAkN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Oldest skeletal evidence for Leprosy ",
:end_year => "",
:body => "<p>Found in human remains from the archaeological sites of Balathal in India and Harappa in Pakistan</p>",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @eurasia,
:slug => "asArkwfAkN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Leprosy probably did not exist in Greece or the Middle East before Common Era ", :start_year => 1)
if result.length == 0
result = HoloceneEvent.create({:name => "Leprosy probably did not exist in Greece or the Middle East before Common Era ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "BtmKBtw5PU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leprosy probably did not exist in Greece or the Middle East before Common Era ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "BtmKBtw5PU",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Hippocrates describes Leprosy ", :start_year => -460)
if result.length == 0
result = HoloceneEvent.create({:name => "Hippocrates describes Leprosy ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @person ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "UZn9XZHY3n",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hippocrates describes Leprosy ",
:end_year => "",
:body => "",
:tag_list => ["Disease"],
:event_types => [ @person ],
:region => @europe,
:slug => "UZn9XZHY3n",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pigs were domesticated from wild boar ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Pigs were domesticated from wild boar ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "YTDrds7qFL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pigs were domesticated from wild boar ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "YTDrds7qFL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Horses ", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Horses ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Domestication_of_the_horse",
:user_id => @user.id,
:slug => "hH6s2UDdNn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Horses ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @global,
:slug => "hH6s2UDdNn",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Domestication_of_the_horse",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dog buried inside of human dwellings ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Dog buried inside of human dwellings ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "X5FS3XJkZE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dog buried inside of human dwellings ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @eurasia,
:slug => "X5FS3XJkZE",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Two distinct dog branches - East and West ", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Two distinct dog branches - East and West ",
:end_year => "-4400",
:body => "<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "4Eh4hsCetm",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Two distinct dog branches - East and West ",
:end_year => "-4400",
:body => "<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @eurasia,
:slug => "4Eh4hsCetm",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Sheep ", :start_year => -11000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Sheep ",
:end_year => "-9000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry,@husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "fx12rrQh01",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-11000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Sheep ",
:end_year => "-9000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry,@husbandry ],
:region => @middleeast,
:slug => "fx12rrQh01",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-11000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Goats ", :start_year => -7000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Goats ",
:end_year => "-6000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "wUYcTKDKA8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Goats ",
:end_year => "-6000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "wUYcTKDKA8",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Establishment of Bactria ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Establishment of Bactria ",
:end_year => "-2000",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Bactria",
:user_id => @user.id,
:slug => "HFjFa3q9wG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Establishment of Bactria ",
:end_year => "-2000",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "HFjFa3q9wG",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Bactria",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Cats ", :start_year => -7500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Cats ",
:end_year => "-7000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "XkvHW3R9mM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Cats ",
:end_year => "-7000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "XkvHW3R9mM",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
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
:event_types => [  @husbandry ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "C9S9LuKxSq",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
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
:event_types => [ @husbandry ],
:region => @eurasia,
:slug => "C9S9LuKxSq",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The eight Neolithic founder crops ", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "The eight Neolithic founder crops ",
:end_year => "",
:body => "<p> The crops were the first to be domesticated: emmer and einkorn wheat, hulled barley, peas, lentils, bitter vetch, chick peas and flax.
The first cultivation was in the Levant.
</p>",
:tag_list => [],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "vHKTHPxjyP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The eight Neolithic founder crops ",
:end_year => "",
:body => "<p> The crops were the first to be domesticated: emmer and einkorn wheat, hulled barley, peas, lentils, bitter vetch, chick peas and flax.
The first cultivation was in the Levant.
</p>",
:tag_list => [],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "vHKTHPxjyP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Atlantus sinks beneath the waves ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Atlantus sinks beneath the waves ",
:end_year => "",
:body => "<p>Gobekli Tepe gives credance of an advanced civilization which sank beneath the wave of the sea.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "7M6qZnaUnX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Atlantus sinks beneath the waves ",
:end_year => "",
:body => "<p>Gobekli Tepe gives credance of an advanced civilization which sank beneath the wave of the sea.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "7M6qZnaUnX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Battle of Kedesh ", :start_year => -1274)
if result.length == 0
result = HoloceneEvent.create({:name => "Battle of Kedesh ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "f3nVL4a07z",
:lat => "34.57",
:lng => "36.51",
:start_year_uncert => "",
:start_year => "-1274"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Battle of Kedesh ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "f3nVL4a07z",
:lat => "34.57",
:lng => "36.51",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1274"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Clovis Comet ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Ck3DgYuB1f",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Ck3DgYuB1f",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Vulture stone at Gobekli Tepe dated by star map ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Vulture stone at Gobekli Tepe dated by star map ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "MMPEt7aABt",
:lat => "",
:lng => "",
:start_year_uncert => "250",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Vulture stone at Gobekli Tepe dated by star map ",
:end_year => "",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "MMPEt7aABt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "250",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
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
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "F8E6YUTcZT",
:lat => "37.223056",
:lng => "38.9225",
:start_year_uncert => "",
:start_year => "-9600"
})
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
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "F8E6YUTcZT",
:lat => "37.223056",
:lng => "38.9225",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '218px-Göbekli_Tepe,_Urfa.jpg')), filename: '218px-Göbekli_Tepe,_Urfa.jpg', content_type: 'image/18px-göbekli_tepe,_urfa.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Domestication of Cows ", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Cows ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Cattle",
:user_id => @user.id,
:slug => "tXqJ6FwMRc",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Cows ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "tXqJ6FwMRc",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Cattle",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level II ", :start_year => -8800)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "mSrXJTs5KJ",
:lat => "37.223056",
:lng => "38.9225",
:start_year_uncert => "",
:start_year => "-8800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "mSrXJTs5KJ",
:lat => "37.223056",
:lng => "38.9225",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8800"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '218px-Göbekli_Tepe,_Urfa.jpg')), filename: '218px-Göbekli_Tepe,_Urfa.jpg', content_type: 'image/18px-göbekli_tepe,_urfa.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Flood of Dardanus ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Dardanus ",
:end_year => "",
:body => "<p>The story of the flood of Dardanus states that Dardanus survived on the  mountain which became Samothraki island in the Aegean sea.  The date for the flooding of the Samothraki plateau is about 8,500 BC.</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "2GVSZuu69F",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Dardanus ",
:end_year => "",
:body => "<p>The story of the flood of Dardanus states that Dardanus survived on the  mountain which became Samothraki island in the Aegean sea.  The date for the flooding of the Samothraki plateau is about 8,500 BC.</p>",
:tag_list => ["Earth", "Flood"],
:event_types => [ @earth ],
:region => @europe,
:slug => "2GVSZuu69F",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beginnings of grain agriculture ", :start_year => -8300)
if result.length == 0
result = HoloceneEvent.create({:name => "Beginnings of grain agriculture ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "EMn7r50gSN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beginnings of grain agriculture ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "EMn7r50gSN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level I ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "zJBsh3f5ta",
:lat => "37.223056",
:lng => "38.9225",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "zJBsh3f5ta",
:lat => "37.223056",
:lng => "38.9225",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '218px-Göbekli_Tepe,_Urfa.jpg')), filename: '218px-Göbekli_Tepe,_Urfa.jpg', content_type: 'image/18px-göbekli_tepe,_urfa.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Monolith worked on at submerged site south of Sicily ", :start_year => -7350)
if result.length == 0
result = HoloceneEvent.create({:name => "Monolith worked on at submerged site south of Sicily ",
:end_year => "",
:body => "<p>Pantelleria Vecchia Bank</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "zbqh0rrpbR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Monolith worked on at submerged site south of Sicily ",
:end_year => "",
:body => "<p>Pantelleria Vecchia Bank</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "zbqh0rrpbR",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7350"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nevali Cori ", :start_year => -8400)
if result.length == 0
result = HoloceneEvent.create({:name => "Nevali Cori ",
:end_year => "-8100",
:body => "<p>The site is known for having some of the world's oldest known temples and monumental sculpture. Together with the earlier site of Göbekli Tepe, it has revolutionised scientific understanding of the Eurasian Neolithic period. The oldest domesticated Einkorn wheat was found there
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Neval%C4%B1_%C3%87ori",
:user_id => @user.id,
:slug => "CGRYHRJRvc",
:lat => "37.518333",
:lng => "38.605556",
:start_year_uncert => "",
:start_year => "-8400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nevali Cori ",
:end_year => "-8100",
:body => "<p>The site is known for having some of the world's oldest known temples and monumental sculpture. Together with the earlier site of Göbekli Tepe, it has revolutionised scientific understanding of the Eurasian Neolithic period. The oldest domesticated Einkorn wheat was found there
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "CGRYHRJRvc",
:lat => "37.518333",
:lng => "38.605556",
:url => "https://en.wikipedia.org/wiki/Neval%C4%B1_%C3%87ori",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sphinx created in Egypt ", :start_year => -10500)
if result.length == 0
result = HoloceneEvent.create({:name => "Sphinx created in Egypt ",
:end_year => "",
:body => "<p>This age is based on the fact that the rising constilation at the time the Sphinx was created is Leo.  It is argued that the Sphinx as it is now
is modified by later dynasties to resemble man instead of a lion.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Great_Sphinx_of_Giza",
:user_id => @user.id,
:slug => "JxY638ay1h",
:lat => "29.975278",
:lng => "31.137778",
:start_year_uncert => "",
:start_year => "-10500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sphinx created in Egypt ",
:end_year => "",
:body => "<p>This age is based on the fact that the rising constilation at the time the Sphinx was created is Leo.  It is argued that the Sphinx as it is now
is modified by later dynasties to resemble man instead of a lion.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "JxY638ay1h",
:lat => "29.975278",
:lng => "31.137778",
:url => "https://en.wikipedia.org/wiki/Great_Sphinx_of_Giza",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Possible water damage to the sphinx with impact from Burckle Crater ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Possible water damage to the sphinx with impact from Burckle Crater ",
:end_year => "",
:body => "<p>The Water erosion hypothesis says that they is evidence of water erosion in the quary from which the Sphinx was created.  It gives no date for the water fall. 
I would content that Noah's flood was a major cause of the erosion.
</p>",
:tag_list => [],
:event_types => [  @cultural,@place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "dbcjTPCtPQ",
:lat => "29.975278",
:lng => "31.137778",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Possible water damage to the sphinx with impact from Burckle Crater ",
:end_year => "",
:body => "<p>The Water erosion hypothesis says that they is evidence of water erosion in the quary from which the Sphinx was created.  It gives no date for the water fall. 
I would content that Noah's flood was a major cause of the erosion.
</p>",
:tag_list => [],
:event_types => [ @cultural,@place ],
:region => @middleeast,
:slug => "dbcjTPCtPQ",
:lat => "29.975278",
:lng => "31.137778",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Ocean going reed boats ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "First Ocean going reed boats ",
:end_year => "",
:body => "<p>The first ocean going reed boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area.</p>",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "tkvcZzdqx5",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Ocean going reed boats ",
:end_year => "",
:body => "<p>The first ocean going reed boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area.</p>",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eurasia,
:slug => "tkvcZzdqx5",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dugout canoe ", :start_year => -8200)
if result.length == 0
result = HoloceneEvent.create({:name => "Dugout canoe ",
:end_year => "-7600",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mFF1YLhwJu",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dugout canoe ",
:end_year => "-7600",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "mFF1YLhwJu",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
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
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "4G7gwFu8Pn",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Copper Mining at Rio Tinto, Spain ",
:end_year => "",
:body => "<p>
Rio Tinto is the oldest mine in use in the western hemisphere.  It's importance in history has been over looked.  Perhaps due to it's remoteness with Spain itself, its story is reduced.
</p><p>
Rio Tinto was mined by Neolithic man starting at least 3,000 BC.  A stone hoe was found at excavations at the site.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "4G7gwFu8Pn",
:lat => "37.21",
:lng => "-6.938",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Start of Mayan Calendar ", :start_year => -3114)
if result.length == 0
result = HoloceneEvent.create({:name => "Start of Mayan Calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Maya_calendar",
:user_id => @user.id,
:slug => "XWVCR28BW3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3114"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Start of Mayan Calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @centralamerica,
:slug => "XWVCR28BW3",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Maya_calendar",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3114"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Tinto Smelting recorded in Ice Cores ", :start_year => -2475)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Tinto Smelting recorded in Ice Cores ",
:end_year => "-2275",
:body => "<p>Mining stopped with  the exhaustion of the forests.</p>",
:tag_list => ["RioTinto"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "C2FKH7s2mT",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-2475"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Tinto Smelting recorded in Ice Cores ",
:end_year => "-2275",
:body => "<p>Mining stopped with  the exhaustion of the forests.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "C2FKH7s2mT",
:lat => "37.21",
:lng => "-6.938",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2475"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "End of Rio Tinto Smelting - Deforestation ", :start_year => -2275)
if result.length == 0
result = HoloceneEvent.create({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "<p>The end of the smelting at 

Rio Tinto was due to the deforestation of the surrounding areas.</p>",
:tag_list => ["RioTinto"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "7djFEyg9UG",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-2275"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "<p>The end of the smelting at 

Rio Tinto was due to the deforestation of the surrounding areas.</p>",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "7djFEyg9UG",
:lat => "37.21",
:lng => "-6.938",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2275"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Phoenicians arrive at Rio Tinto ", :start_year => -1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "<p>Phoenicians begin trading with the Tartessians at
Rio Tinto.</p>",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "KFPNyqqybD",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "<p>Phoenicians begin trading with the Tartessians at
Rio Tinto.</p>",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [ @place ],
:region => @europe,
:slug => "KFPNyqqybD",
:lat => "37.21",
:lng => "-6.938",
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Leather Bellows ", :start_year => -900)
if result.length == 0
result = HoloceneEvent.create({:name => "Leather Bellows ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "WnEVeJhcpt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leather Bellows ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @global,
:slug => "WnEVeJhcpt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Tinto as King Solomon\'s mines ", :start_year => -971)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Tinto as King Solomon\'s mines ",
:end_year => "-931",
:body => "",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "rNwgBH6khf",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-971"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Tinto as King Solomon\'s mines ",
:end_year => "-931",
:body => "",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [ @place ],
:region => @europe,
:slug => "rNwgBH6khf",
:lat => "37.21",
:lng => "-6.938",
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-971"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Solon ", :start_year => -638)
if result.length == 0
result = HoloceneEvent.create({:name => "Solon ",
:end_year => "-558",
:body => "",
:tag_list => ["Tartessos", "Atlantis"],
:event_types => [  @person ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "gCcQqybT9a",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-638"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Solon ",
:end_year => "-558",
:body => "",
:tag_list => ["Tartessos", "Atlantis"],
:event_types => [ @person ],
:region => @europe,
:slug => "gCcQqybT9a",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-638"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carthaginians Arrive at Rio Tinto ", :start_year => -535)
if result.length == 0
result = HoloceneEvent.create({:name => "Carthaginians Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "PXG0QMSAQq",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carthaginians Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [ @place ],
:region => @europe,
:slug => "PXG0QMSAQq",
:lat => "37.21",
:lng => "-6.938",
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grafting practice for grapevines ", :start_year => -500)
if result.length == 0
result = HoloceneEvent.create({:name => "Grafting practice for grapevines ",
:end_year => "",
:body => "<p>
The Mishna describes grafting as a commonplace technique used to grow grapevines.
</p>",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Grafting",
:user_id => @user.id,
:slug => "cpZFm4ykx5",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grafting practice for grapevines ",
:end_year => "",
:body => "<p>
The Mishna describes grafting as a commonplace technique used to grow grapevines.
</p>",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "cpZFm4ykx5",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Grafting",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "DjWMCsCWqV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-430"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Athens ",
:end_year => "",
:body => "<p>
Typhus appears amoung the Athenians.</p>",
:tag_list => ["Disease", "Epidemic", "Typhus"],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "DjWMCsCWqV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-430"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Skara Brae inundated", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Skara Brae inundated",
:end_year => "",
:body => "<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  It is possible that it was buried by a tsumani as well.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Skara_Brae",
:user_id => @user.id,
:slug => "wHR21GWuRa",
:lat => "59.048611",
:lng => "-3.343056",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Skara Brae inundated",
:end_year => "",
:body => "<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  It is possible that it was buried by a tsumani as well.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "wHR21GWuRa",
:lat => "59.048611",
:lng => "-3.343056",
:url => "https://en.wikipedia.org/wiki/Skara_Brae",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Cyprian ", :start_year => 251)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Cyprian ",
:end_year => "270",
:body => "<p>Second appearance of Smallpox.
 This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.</p>",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [  @epidemic,@cultural ] ,
:region => @africa,
:url => "",
:user_id => @user.id,
:slug => "Jhpp2BjmFV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "251"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Cyprian ",
:end_year => "270",
:body => "<p>Second appearance of Smallpox.
 This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.</p>",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [ @epidemic,@cultural ],
:region => @africa,
:slug => "Jhpp2BjmFV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "251"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
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
:event_types => [   ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "hedBTrD8Mz",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Final collapse of the Roman Empire ",
:end_year => "",
:body => "<p>
Lost of 'Noblest third' of population.
Loss of complexity.
</p>",
:tag_list => [],
:event_types => [  ],
:region => @europe,
:slug => "hedBTrD8Mz",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "End of Migration Period ", :start_year => 700)
if result.length == 0
result = HoloceneEvent.create({:name => "End of Migration Period ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "JJgb4kvQr3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "End of Migration Period ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "JJgb4kvQr3",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Great Famine ", :start_year => 1315)
if result.length == 0
result = HoloceneEvent.create({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => ["Historical", "Famine"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "T7WkCRXMkZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1315"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => ["Historical", "Famine"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "T7WkCRXMkZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1315"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Black Death - The third occurance of Plague in Europe", :start_year => 1347)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Death - The third occurance of Plague in Europe",
:end_year => "1351",
:body => "<p>Third Occurrence of Plague in Europe.  Estimated 50% reducation in the population.
</p>",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic,@cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "CgSZw0CJSD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1347"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Death - The third occurance of Plague in Europe",
:end_year => "1351",
:body => "<p>Third Occurrence of Plague in Europe.  Estimated 50% reducation in the population.
</p>",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic,@cultural ],
:region => @europe,
:slug => "CgSZw0CJSD",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1347"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("cantor2001")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("ziegler1969")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tell Sabi Abyad ", :start_year => -7750)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Sabi Abyad ",
:end_year => "-1250",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:slug => "1q2Qw4R2Cw",
:lat => "36.504",
:lng => "39.093",
:start_year_uncert => "",
:start_year => "-7750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Sabi Abyad ",
:end_year => "-1250",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "1q2Qw4R2Cw",
:lat => "36.504",
:lng => "39.093",
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7750"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tell Sabi Abyad - Mass production of pottery ", :start_year => -6700)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Sabi Abyad - Mass production of pottery ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:slug => "868j5XEecA",
:lat => "36.504",
:lng => "39.093",
:start_year_uncert => "",
:start_year => "-6700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Sabi Abyad - Mass production of pottery ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "868j5XEecA",
:lat => "36.504",
:lng => "39.093",
:url => "https://en.wikipedia.org/wiki/Tell_Sabi_Abyad",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tell Qaramel ", :start_year => -10898)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Qaramel ",
:end_year => "-9300",
:body => "<p>Known for five tower structures.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Qaramel",
:user_id => @user.id,
:slug => "p06wtBUpqZ",
:lat => "36.3778",
:lng => "37.2751",
:start_year_uncert => "",
:start_year => "-10898"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Qaramel ",
:end_year => "-9300",
:body => "<p>Known for five tower structures.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "p06wtBUpqZ",
:lat => "36.3778",
:lng => "37.2751",
:url => "https://en.wikipedia.org/wiki/Tell_Qaramel",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10898"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tell Qaramel - Oldest tower in a settlement ", :start_year => -10898)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Qaramel - Oldest tower in a settlement ",
:end_year => "-9670",
:body => "<p>Pre-dates Jericho by two millennia.
</p>",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Qaramel",
:user_id => @user.id,
:slug => "VwNgDZtMV0",
:lat => "36.3778",
:lng => "37.2751",
:start_year_uncert => "",
:start_year => "-10898"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Qaramel - Oldest tower in a settlement ",
:end_year => "-9670",
:body => "<p>Pre-dates Jericho by two millennia.
</p>",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "VwNgDZtMV0",
:lat => "36.3778",
:lng => "37.2751",
:url => "https://en.wikipedia.org/wiki/Tell_Qaramel",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10898"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Time line ",
:position =>chapter_index,
:slug => "afumM6ATW1",
:book => @book,
:body => "<p>Earth related events such as volcanic eruptions, earthquakes, tsunamis, impact events, etc.
</p>"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = HoloceneEvent.where(:name => "Older Dryas", :start_year => -16050)
if result.length == 0
result = HoloceneEvent.create({:name => "Older Dryas",
:end_year => "-14700",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Oldest_Dryas",
:user_id => @user.id,
:slug => "SpaDew3wxQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-16050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Older Dryas",
:end_year => "-14700",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "SpaDew3wxQ",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Oldest_Dryas",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16050"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bølling-Allerød Warming", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Bølling-Allerød Warming",
:end_year => "-10700",
:body => "<p>The Bølling-Allerød Warming was a warm moist period that started with the end of the Older Dryes and ended with
the start of the Younger Dryes.  Hunter-gatherers moved into the northern lands challenging the Megafauna causing their extenction.
It is during this period that humanity starts to experiment with use and dometicate emmer and two-row barley.
</p>",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Bølling-Allerød_warming",
:user_id => @user.id,
:slug => "0GveY4UAXF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bølling-Allerød Warming",
:end_year => "-10700",
:body => "<p>The Bølling-Allerød Warming was a warm moist period that started with the end of the Older Dryes and ended with
the start of the Younger Dryes.  Hunter-gatherers moved into the northern lands challenging the Megafauna causing their extenction.
It is during this period that humanity starts to experiment with use and dometicate emmer and two-row barley.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "0GveY4UAXF",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Bølling-Allerød_warming",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bølling oscillation", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Bølling oscillation",
:end_year => "-12100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "qnKrDn26pe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bølling oscillation",
:end_year => "-12100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "qnKrDn26pe",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Allerød oscillation", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Allerød oscillation",
:end_year => "-11000",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "jc1SY6BYMh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Allerød oscillation",
:end_year => "-11000",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "jc1SY6BYMh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Electromagnetic storm from the Sun sets off magnetic mines off the coast of Vietnam. ", :start_year => 1972)
if result.length == 0
result = HoloceneEvent.create({:name => "Electromagnetic storm from the Sun sets off magnetic mines off the coast of Vietnam. ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [  @earth ] ,
:region => @southeastasia,
:url => "",
:user_id => @user.id,
:slug => "dFxu9QucHD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1972"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Electromagnetic storm from the Sun sets off magnetic mines off the coast of Vietnam. ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [ @earth ],
:region => @southeastasia,
:slug => "dFxu9QucHD",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1972"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Electromagnetic Storm ", :start_year => -591)
if result.length == 0
result = HoloceneEvent.create({:name => "Electromagnetic Storm ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "7tfmnazPac",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-591"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Electromagnetic Storm ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [ @earth ],
:region => @global,
:slug => "7tfmnazPac",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-591"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Electromagnetic Storm ", :start_year => 775)
if result.length == 0
result = HoloceneEvent.create({:name => "Electromagnetic Storm ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "7e1TmH45Fn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "775"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Electromagnetic Storm ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [ @earth ],
:region => @global,
:slug => "7e1TmH45Fn",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "775"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Electromagnetic Storm ", :start_year => 994)
if result.length == 0
result = HoloceneEvent.create({:name => "Electromagnetic Storm ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "gv6gsEAX7F",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "994"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Electromagnetic Storm ",
:end_year => "",
:body => "",
:tag_list => ["MagneticEvent"],
:event_types => [ @earth ],
:region => @global,
:slug => "gv6gsEAX7F",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "994"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "<p>Kicked out of Eden the first time.
</p>",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "cfVrASQ3Le",
:lat => "26",
:lng => "52",
:start_year_uncert => "",
:start_year => "-16000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "<p>Kicked out of Eden the first time.
</p>",
:tag_list => [],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "cfVrASQ3Le",
:lat => "26",
:lng => "52",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-16000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Zerelia West ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Zerelia West ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "T6QHs9kS6F",
:lat => "39.163333",
:lng => "22.708889",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zerelia West ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "T6QHs9kS6F",
:lat => "39.163333",
:lng => "22.708889",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Zerelia East ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Zerelia East ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "zeeHvRQasH",
:lat => "39.161944",
:lng => "22.714167",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zerelia East ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "zeeHvRQasH",
:lat => "39.161944",
:lng => "22.714167",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Boxhole ", :start_year => -3400)
if result.length == 0
result = HoloceneEvent.create({:name => "Boxhole ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "BqRt7Y8Ke7",
:lat => "-22.616667",
:lng => "135.2",
:start_year_uncert => "",
:start_year => "-3400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Boxhole ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "BqRt7Y8Ke7",
:lat => "-22.616667",
:lng => "135.2",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kachchh (Luna) ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Kachchh (Luna) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "dGp5D1M399",
:lat => "23.704722",
:lng => "69.260278",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kachchh (Luna) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "dGp5D1M399",
:lat => "23.704722",
:lng => "69.260278",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Svetloyar lake ", :start_year => -600)
if result.length == 0
result = HoloceneEvent.create({:name => "Svetloyar lake ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "0N2chbvMju",
:lat => "56.819",
:lng => "45.093",
:start_year_uncert => "",
:start_year => "-600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Svetloyar lake ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "0N2chbvMju",
:lat => "56.819",
:lng => "45.093",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Merewether ", :start_year => 1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Merewether ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @northamerica,
:url => "",
:user_id => @user.id,
:slug => "MBTAwMkLfx",
:lat => "58.04",
:lng => "-64.05",
:start_year_uncert => "",
:start_year => "1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Merewether ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @northamerica,
:slug => "MBTAwMkLfx",
:lat => "58.04",
:lng => "-64.05",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ak-Bura (Murgab) ", :start_year => 1700)
if result.length == 0
result = HoloceneEvent.create({:name => "Ak-Bura (Murgab) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "ykBVwnd6pG",
:lat => "38.094028",
:lng => "74.282778",
:start_year_uncert => "",
:start_year => "1700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ak-Bura (Murgab) ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "ykBVwnd6pG",
:lat => "38.094028",
:lng => "74.282778",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lake Cheko ", :start_year => 1908)
if result.length == 0
result = HoloceneEvent.create({:name => "Lake Cheko ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "6DprnD7sta",
:lat => "60.964",
:lng => "101.86",
:start_year_uncert => "",
:start_year => "1908"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lake Cheko ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @fareast,
:slug => "6DprnD7sta",
:lat => "60.964",
:lng => "101.86",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1908"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Curuçá astrobleme ", :start_year => 1930)
if result.length == 0
result = HoloceneEvent.create({:name => "Curuçá astrobleme ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @southamerica,
:url => "",
:user_id => @user.id,
:slug => "SSrAdDnUEG",
:lat => "-5.183333",
:lng => "-71.633333",
:start_year_uncert => "",
:start_year => "1930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Curuçá astrobleme ",
:end_year => "",
:body => "<p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @southamerica,
:slug => "SSrAdDnUEG",
:lat => "-5.183333",
:lng => "-71.633333",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1930"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tsunami at Tartessos area ", :start_year => -1500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => ["Tartessos", "Tsunami"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "wHdYsfGyX2",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-1500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tsunami at Tartessos area ",
:end_year => "",
:body => "",
:tag_list => ["Tartessos", "Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:slug => "wHdYsfGyX2",
:lat => "37.21",
:lng => "-6.938",
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sirente Italy ", :start_year => 312)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Italy ",
:end_year => "",
:body => "<p>This event may be the cause of Roman emperor Constantine's vision at Milvian Bridge.
</p><p>Unconfirmed</p>",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "8QsQDHX28G",
:lat => "42.177222",
:lng => "13.595833",
:start_year_uncert => "90",
:start_year => "312"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Italy ",
:end_year => "",
:body => "<p>This event may be the cause of Roman emperor Constantine's vision at Milvian Bridge.
</p><p>Unconfirmed</p>",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "8QsQDHX28G",
:lat => "42.177222",
:lng => "13.595833",
:url => "",
:user_id => @user.id,
:start_year_uncert => "90",
:start_year => "312"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 9 - Colvis Impact Event ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate,@impact ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2qnZ8RBnNd",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 9 - Colvis Impact Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate,@impact ],
:region => @global,
:slug => "2qnZ8RBnNd",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Clovis Comet ", :start_year => -10900)
if result.length == 0
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Younger_Dryas_impact_hypothesis",
:user_id => @user.id,
:slug => "EjT4sgPqzG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact ],
:region => @northamerica,
:slug => "EjT4sgPqzG",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Younger_Dryas_impact_hypothesis",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Campo del Cielo Crater ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Campo_del_Cielo",
:user_id => @user.id,
:slug => "YSwgVtAN6s",
:lat => "-27.633333",
:lng => "-61.7",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @southamerica,
:slug => "YSwgVtAN6s",
:lat => "-27.633333",
:lng => "-61.7",
:url => "https://en.wikipedia.org/wiki/Campo_del_Cielo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Carancas Impact Crater ", :start_year => 2007)
if result.length == 0
result = HoloceneEvent.create({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/2007_Carancas_impact_event",
:user_id => @user.id,
:slug => "eb8tQkZkuD",
:lat => "-16.664439",
:lng => "-69.044164",
:start_year_uncert => "",
:start_year => "2007"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @southamerica,
:slug => "eb8tQkZkuD",
:lat => "-16.664439",
:lng => "-69.044164",
:url => "https://en.wikipedia.org/wiki/2007_Carancas_impact_event",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2007"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Chelyabinsk meteor ", :start_year => 2013)
if result.length == 0
result = HoloceneEvent.create({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Chelyabinsk_meteor",
:user_id => @user.id,
:slug => "GcENZtSEsY",
:lat => "55.15",
:lng => "61.41",
:start_year_uncert => "",
:start_year => "2013"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Chelyabinsk meteor ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @global,
:slug => "GcENZtSEsY",
:lat => "55.15",
:lng => "61.41",
:url => "https://en.wikipedia.org/wiki/Chelyabinsk_meteor",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2013"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grendel Crater ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "pwHxSvvGxg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "536"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "pwHxSvvGxg",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Haviland Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Haviland_Crater",
:user_id => @user.id,
:slug => "p5HJvLGfGQ",
:lat => "37.583333",
:lng => "-99.166667",
:start_year_uncert => "",
:start_year => "1000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @northamerica,
:slug => "p5HJvLGfGQ",
:lat => "37.583333",
:lng => "-99.166667",
:url => "https://en.wikipedia.org/wiki/Haviland_Crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Henbury Meteorites Conservation Reserve ", :start_year => -2700)
if result.length == 0
result = HoloceneEvent.create({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Henbury_Meteorites_Conservation_Reserve",
:user_id => @user.id,
:slug => "mJW1g4mVVH",
:lat => "-24.566667",
:lng => "133.133333",
:start_year_uncert => "",
:start_year => "-2700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Henbury Meteorites Conservation Reserve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "mJW1g4mVVH",
:lat => "-24.566667",
:lng => "133.133333",
:url => "https://en.wikipedia.org/wiki/Henbury_Meteorites_Conservation_Reserve",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilumetsa Crater ", :start_year => -4600)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Ilumetsa_crater",
:user_id => @user.id,
:slug => "PQATHskCQb",
:lat => "57.95",
:lng => "27.4",
:start_year_uncert => "",
:start_year => "-4600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "PQATHskCQb",
:lat => "57.95",
:lng => "27.4",
:url => "https://en.wikipedia.org/wiki/Ilumetsa_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Morasko Meterorite Nature Reseve ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Morasko_Meteorite_Nature_Reserve",
:user_id => @user.id,
:slug => "wUTHM0KLxX",
:lat => "52.483333",
:lng => "16.9",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "wUTHM0KLxX",
:lat => "52.483333",
:lng => "16.9",
:url => "https://en.wikipedia.org/wiki/Morasko_Meteorite_Nature_Reserve",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '220px-Morasko_krater_zima.jpg')), filename: '220px-Morasko_krater_zima.jpg', content_type: 'image/20px-morasko_krater_zima.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rio Caurto Craters ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @southamerica,
:url => "",
:user_id => @user.id,
:slug => "4RQgs5JEr6",
:lat => "-32.878333",
:lng => "-64.223333",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @southamerica,
:slug => "4RQgs5JEr6",
:lat => "-32.878333",
:lng => "-64.223333",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sobolev Crater ", :start_year => 1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "https://en.wikipedia.org/wiki/Sobolev_crater",
:user_id => @user.id,
:slug => "ftYq9bpMRt",
:lat => "46.3",
:lng => "137.866667",
:start_year_uncert => "",
:start_year => "1000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "ftYq9bpMRt",
:lat => "46.3",
:lng => "137.866667",
:url => "https://en.wikipedia.org/wiki/Sobolev_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tai Hu Lake ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @centralasia,
:url => "https://en.wikipedia.org/wiki/Lake_Tai",
:user_id => @user.id,
:slug => "5hfsx0Z4dM",
:lat => "31.233333",
:lng => "120.133333",
:start_year_uncert => "",
:start_year => "-2500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @centralasia,
:slug => "5hfsx0Z4dM",
:lat => "31.233333",
:lng => "120.133333",
:url => "https://en.wikipedia.org/wiki/Lake_Tai",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wabar Craters ", :start_year => 1863)
if result.length == 0
result = HoloceneEvent.create({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Wabar_craters",
:user_id => @user.id,
:slug => "J9SfnDdXV0",
:lat => "21.5",
:lng => "50.466667",
:start_year_uncert => "",
:start_year => "1863"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @middleeast,
:slug => "J9SfnDdXV0",
:lat => "21.5",
:lng => "50.466667",
:url => "https://en.wikipedia.org/wiki/Wabar_craters",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1863"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kamil Crater ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Kamil_Crater",
:user_id => @user.id,
:slug => "RLdyDTankq",
:lat => "22.018333",
:lng => "26.087778",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "RLdyDTankq",
:lat => "22.018333",
:lng => "26.087778",
:url => "https://en.wikipedia.org/wiki/Kamil_Crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Whitecourt Crater ", :start_year => 1105)
if result.length == 0
result = HoloceneEvent.create({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Whitecourt_crater",
:user_id => @user.id,
:slug => "V4bj2rK8Aj",
:lat => "53.9987",
:lng => "-115.5957",
:start_year_uncert => "",
:start_year => "1105"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @northamerica,
:slug => "V4bj2rK8Aj",
:lat => "53.9987",
:lng => "-115.5957",
:url => "https://en.wikipedia.org/wiki/Whitecourt_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1105"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dalgaranga crater ", :start_year => -1000)
if result.length == 0
result = HoloceneEvent.create({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "cEL1Afyeyb",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "cEL1Afyeyb",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "UDWJgrpuWX",
:lat => "",
:lng => "",
:start_year_uncert => "70",
:start_year => "-10900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "<p>This event was a 1,300 year cold event as waters from the ice plateau covering North America flowed into the Atlantic basin shutting down the Gulf stream.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "UDWJgrpuWX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "70",
:start_year => "-10900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Seven massive volcanic eruptions shown in ice cores ", :start_year => -7901)
if result.length == 0
result = HoloceneEvent.create({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "<p>Series of seven massive volcanic eruptions give volcanic skies and lowered temperatures(ending 7090 BC).
</p>",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QTmTLEzgb8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7901"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "<p>Series of seven massive volcanic eruptions give volcanic skies and lowered temperatures(ending 7090 BC).
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "QTmTLEzgb8",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7901"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Eruption of Mount Edgecumbe, Alaska ", :start_year => -7220)
if result.length == 0
result = HoloceneEvent.create({:name => "Eruption of Mount Edgecumbe, Alaska ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @volcanic,@place ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "T5DMtpbDqg",
:lat => "57.050",
:lng => "-135.750",
:start_year_uncert => "",
:start_year => "-7220"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Eruption of Mount Edgecumbe, Alaska ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @volcanic,@place ],
:region => @global,
:slug => "T5DMtpbDqg",
:lat => "57.050",
:lng => "-135.750",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7220"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "WqeVKvfvpG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Older Peron ",
:end_year => "-4100",
:body => "<p>High point in sea levels during the Holocene.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "WqeVKvfvpG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "svJrDhfg2X",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "<p>Second highest point in sea levels during the Holocene.
</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "svJrDhfg2X",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 8 ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 8 ",
:end_year => "",
:body => "<p>The Gulf Stream resumes.</p>",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZkhsmCBZ3B",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 8 ",
:end_year => "",
:body => "<p>The Gulf Stream resumes.</p>",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "ZkhsmCBZ3B",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Lvinaya_Past",
:user_id => @user.id,
:slug => "WsVHsxM19M",
:lat => "44.608",
:lng => "146.994",
:start_year_uncert => "50",
:start_year => "-7480"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "WsVHsxM19M",
:lat => "44.608",
:lng => "146.994",
:url => "https://en.wikipedia.org/wiki/Lvinaya_Past",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-7480"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-lvinaya_past_20070718011232.jpg')), filename: '280px-lvinaya_past_20070718011232.jpg', content_type: 'image/80px-lvinaya_past_20070718011232.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "1C5uEd2T6F",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 7 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "1C5uEd2T6F",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 6 - Erdalen Glacial activity ", :start_year => -7400)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dMsxhqqkAC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "dMsxhqqkAC",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sakura-Jima, Kyushu (Japan) VEI 6+", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @fareast,
:url => "https://en.wikipedia.org/wiki/Sakurajima",
:user_id => @user.id,
:slug => "94gG6Qa95D",
:lat => "31.580",
:lng => "130.658",
:start_year_uncert => "1000",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @fareast,
:slug => "94gG6Qa95D",
:lat => "31.580",
:lng => "130.658",
:url => "https://en.wikipedia.org/wiki/Sakurajima",
:user_id => @user.id,
:start_year_uncert => "1000",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Sakurajima55.jpg')), filename: '280px-Sakurajima55.jpg', content_type: 'image/80px-sakurajima55.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "S8xtcH4hLa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Land Bridge from Siberia to North America sinks ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @fareast,
:slug => "S8xtcH4hLa",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6", :start_year => 1991)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>I have included this event as it is with in recorded history.  The global temperatures did dip though not as expected.  The discrepancy is due to the general overall warming due to human activity.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Lower north flank and summit</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "r4R8EhwdgF",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "",
:start_year => "1991"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>I have included this event as it is with in recorded history.  The global temperatures did dip though not as expected.  The discrepancy is due to the general overall warming due to human activity.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Lower north flank and summit</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "r4R8EhwdgF",
:lat => "15.130",
:lng => "120.350",
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1991"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Pinatubo91eruption_clark_air_base.jpg')), filename: '280px-Pinatubo91eruption_clark_air_base.jpg', content_type: 'image/80px-pinatubo91eruption_clark_air_base.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Novarupta",
:user_id => @user.id,
:slug => "Pk0ZzGFuvW",
:lat => "58.270",
:lng => "-155.157",
:start_year_uncert => "",
:start_year => "1912"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Novarupta ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "Pk0ZzGFuvW",
:lat => "58.270",
:lng => "-155.157",
:url => "https://en.wikipedia.org/wiki/Novarupta",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1912"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'Novarupta.jpg')), filename: 'Novarupta.jpg', content_type: 'image/ovarupta.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Santa Maria VEI 6 ", :start_year => 1902)
if result.length == 0
result = HoloceneEvent.create({:name => "Santa Maria VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
SW flank</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Santa_Mar%C3%ADa_(volcano)",
:user_id => @user.id,
:slug => "g5C46huKTm",
:lat => "14.756",
:lng => "-91.552",
:start_year_uncert => "",
:start_year => "1902"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santa Maria VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
SW flank</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "g5C46huKTm",
:lat => "14.756",
:lng => "-91.552",
:url => "https://en.wikipedia.org/wiki/Santa_Mar%C3%ADa_(volcano)",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1902"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Santiaguito_from_Santamaria.jpg')), filename: '280px-Santiaguito_from_Santamaria.jpg', content_type: 'image/80px-santiaguito_from_santamaria.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Krakatau, Indonesia VEI 6", :start_year => 1883)
if result.length == 0
result = HoloceneEvent.create({:name => "Krakatau, Indonesia VEI 6",
:end_year => "",
:body => "<p>While not as big as Tambora, Krakatoa was better observed by a good many people.  The documentation is very informative as to the magnitude of such explosions.  It was heard around the world.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Krakatoa",
:user_id => @user.id,
:slug => "hxfLy348Hy",
:lat => "-6.102",
:lng => "105.423",
:start_year_uncert => "",
:start_year => "1883"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Krakatau, Indonesia VEI 6",
:end_year => "",
:body => "<p>While not as big as Tambora, Krakatoa was better observed by a good many people.  The documentation is very informative as to the magnitude of such explosions.  It was heard around the world.</p><p>VEI 6
Confirmed Eruption
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "hxfLy348Hy",
:lat => "-6.102",
:lng => "105.423",
:url => "https://en.wikipedia.org/wiki/Krakatoa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1883"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Krakatoa_eruption_lithograph.jpg')), filename: '280px-Krakatoa_eruption_lithograph.jpg', content_type: 'image/80px-krakatoa_eruption_lithograph.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815", :start_year => 1812)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815",
:end_year => "1815",
:body => "",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Tambora",
:user_id => @user.id,
:slug => "Xjt98gWZyf",
:lat => "-8.250",
:lng => "118.000",
:start_year_uncert => "",
:start_year => "1812"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 continious eruptions until explosion in 1815",
:end_year => "1815",
:body => "",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "Xjt98gWZyf",
:lat => "-8.250",
:lng => "118.000",
:url => "https://en.wikipedia.org/wiki/Mount_Tambora",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1812"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
</p><p>This was the first eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book[[YwxcJnZt9K]] provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
 of 1816.</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Tambora",
:user_id => @user.id,
:slug => "EkNk2XS1zy",
:lat => "-8.250",
:lng => "118.000",
:start_year_uncert => "",
:start_year => "1815"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Historical Observations
</p><p>This was the first eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book[[YwxcJnZt9K]] provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
 of 1816.</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "EkNk2XS1zy",
:lat => "-8.250",
:lng => "118.000",
:url => "https://en.wikipedia.org/wiki/Mount_Tambora",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1815"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "YwxcJnZt9K", :body => "Volcano Weather: the story of 1816, the year without a summer", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Unknown Source VEI 6 ", :start_year => 1808)
if result.length == 0
result = HoloceneEvent.create({:name => "Unknown Source VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @unknown,
:url => "",
:user_id => @user.id,
:slug => "17Nr2jjrA7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1808"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Unknown Source VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @unknown,
:slug => "17Nr2jjrA7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1808"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6", :start_year => 1660)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Long_Island_(Papua_New_Guinea)",
:user_id => @user.id,
:slug => "MC2d5uxuAF",
:lat => "-5.358",
:lng => "147.120",
:start_year_uncert => "20",
:start_year => "1660"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "MC2d5uxuAF",
:lat => "-5.358",
:lng => "147.120",
:url => "https://en.wikipedia.org/wiki/Long_Island_(Papua_New_Guinea)",
:user_id => @user.id,
:start_year_uncert => "20",
:start_year => "1660"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Huaynaputina",
:user_id => @user.id,
:slug => "YGKNXpgn64",
:lat => "-16.608",
:lng => "-70.850",
:start_year_uncert => "",
:start_year => "1601"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Huaynaputina, Peru VEI 6",
:end_year => "1603",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
Summit and south flank</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "YGKNXpgn64",
:lat => "-16.608",
:lng => "-70.850",
:url => "https://en.wikipedia.org/wiki/Huaynaputina",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1601"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '220px-Huaynaputina.jpg')), filename: '220px-Huaynaputina.jpg', content_type: 'image/20px-huaynaputina.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Billy_Mitchell_(volcano)",
:user_id => @user.id,
:slug => "GtKBzNDmcT",
:lat => "-6.092",
:lng => "155.225",
:start_year_uncert => "20",
:start_year => "1580"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "GtKBzNDmcT",
:lat => "-6.092",
:lng => "155.225",
:url => "https://en.wikipedia.org/wiki/Billy_Mitchell_(volcano)",
:user_id => @user.id,
:start_year_uncert => "20",
:start_year => "1580"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @icelandandarcticocean,
:url => "",
:user_id => @user.id,
:slug => "Zr0UC7FhxV",
:lat => "64.633",
:lng => "-17.516",
:start_year_uncert => "",
:start_year => "1477"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bardarbunga, Northeastern Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Historical Observations
Veidivötn (Veidivatnahraun)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @icelandandarcticocean,
:slug => "Zr0UC7FhxV",
:lat => "64.633",
:lng => "-17.516",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1477"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "",
:user_id => @user.id,
:slug => "gPq94Yc3RZ",
:lat => "-0.850",
:lng => "-78.900",
:start_year_uncert => "",
:start_year => "1280"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Quilotoa, Ecuador VEI 6",
:end_year => "",
:body => "<p>One of the largest 

eruption of the Holocene period.</p><p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "gPq94Yc3RZ",
:lat => "-0.850",
:lng => "-78.900",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1280"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Rinjani VEI 7 ", :start_year => 1257)
if result.length == 0
result = HoloceneEvent.create({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Ice Core
Samalas Eruption</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "",
:user_id => @user.id,
:slug => "4WpQJneSS9",
:lat => "-8.420",
:lng => "116.470",
:start_year_uncert => "",
:start_year => "1257"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Ice Core
Samalas Eruption</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "4WpQJneSS9",
:lat => "-8.420",
:lng => "116.470",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1257"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "",
:user_id => @user.id,
:slug => "gGTKHEA7K7",
:lat => "41.980",
:lng => "128.080",
:start_year_uncert => "4",
:start_year => "942"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "gGTKHEA7K7",
:lat => "41.980",
:lng => "128.080",
:url => "",
:user_id => @user.id,
:start_year_uncert => "4",
:start_year => "942"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ceboruco, Mexico VEI 6", :start_year => 930)
if result.length == 0
result = HoloceneEvent.create({:name => "Ceboruco, Mexico VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "",
:user_id => @user.id,
:slug => "hET3mks6qw",
:lat => "21.125",
:lng => "-104.508",
:start_year_uncert => "200",
:start_year => "930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ceboruco, Mexico VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "hET3mks6qw",
:lat => "21.125",
:lng => "-104.508",
:url => "",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "930"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:slug => "h3x1DpEJuU",
:lat => "61.380",
:lng => "-141.750",
:start_year_uncert => "1",
:start_year => "847"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "h3x1DpEJuU",
:lat => "61.380",
:lng => "-141.750",
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:start_year_uncert => "1",
:start_year => "847"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-MtChurchill-KlutlanGlacier.jpg')), filename: '280px-MtChurchill-KlutlanGlacier.jpg', content_type: 'image/80px-mtchurchill-klutlanglacier.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Witori VEI 6 ", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "NeD4NTsLtF",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "75",
:start_year => "710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "NeD4NTsLtF",
:lat => "-5.576",
:lng => "150.516",
:url => "",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "710"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rabaul VEI 6 ", :start_year => 683)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabaul VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Rabaul_caldera",
:user_id => @user.id,
:slug => "NAM9C65Uu9",
:lat => "-4.271",
:lng => "152.203",
:start_year_uncert => "2",
:start_year => "683"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabaul VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "NAM9C65Uu9",
:lat => "-4.271",
:lng => "152.203",
:url => "https://en.wikipedia.org/wiki/Rabaul_caldera",
:user_id => @user.id,
:start_year_uncert => "2",
:start_year => "683"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '260px-STS008-36-1403_cropped_rotated.jpg')), filename: '260px-STS008-36-1403_cropped_rotated.jpg', content_type: 'image/60px-sts008-36-1403_cropped_rotated.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dakataua VEI 6 ", :start_year => 653)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Dakataua",
:user_id => @user.id,
:slug => "z98hcUDSdU",
:lat => "-5.094",
:lng => "150.094",
:start_year_uncert => "18",
:start_year => "653"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "z98hcUDSdU",
:lat => "-5.094",
:lng => "150.094",
:url => "https://en.wikipedia.org/wiki/Dakataua",
:user_id => @user.id,
:start_year_uncert => "18",
:start_year => "653"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ilopango, El Salvador VEI 7 ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
Ilopango</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Lake_Ilopango",
:user_id => @user.id,
:slug => "8azgk4w1JB",
:lat => "13.672",
:lng => "-89.053",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
Ilopango</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "8azgk4w1JB",
:lat => "13.672",
:lng => "-89.053",
:url => "https://en.wikipedia.org/wiki/Lake_Ilopango",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "535"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Ksudach VEI 6 ", :start_year => 240)
if result.length == 0
result = HoloceneEvent.create({:name => "Ksudach VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Ksudach V caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "",
:user_id => @user.id,
:slug => "yV0UPgTZ0R",
:lat => "51.844",
:lng => "157.572",
:start_year_uncert => "100",
:start_year => "240"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ksudach VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Ksudach V caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "yV0UPgTZ0R",
:lat => "51.844",
:lng => "157.572",
:url => "",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "240"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Taupo VEI 6 ", :start_year => 233)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs area</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:slug => "bSYhGvUHn6",
:lat => "-38.820",
:lng => "176.000",
:start_year_uncert => "13",
:start_year => "233"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs area</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "bSYhGvUHn6",
:lat => "-38.820",
:lng => "176.000",
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:start_year_uncert => "13",
:start_year => "233"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Churchill VEI 6 ", :start_year => 60)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:slug => "eMJxBUAqJ5",
:lat => "61.380",
:lng => "-141.750",
:start_year_uncert => "200",
:start_year => "60"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "eMJxBUAqJ5",
:lat => "61.380",
:lng => "-141.750",
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "60"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-MtChurchill-KlutlanGlacier.jpg')), filename: '280px-MtChurchill-KlutlanGlacier.jpg', content_type: 'image/80px-mtchurchill-klutlanglacier.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ambrym, Vanuatu VEI 6+", :start_year => 50)
if result.length == 0
result = HoloceneEvent.create({:name => "Ambrym, Vanuatu VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "Z1VJj0nWew",
:lat => "-16.250",
:lng => "168.120",
:start_year_uncert => "100",
:start_year => "50"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ambrym, Vanuatu VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "Z1VJj0nWew",
:lat => "-16.250",
:lng => "168.120",
:url => "",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "50"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "",
:user_id => @user.id,
:slug => "tSysLAny1p",
:lat => "12.242",
:lng => "-86.342",
:start_year_uncert => "100",
:start_year => "-50"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Apoyeque, Nicaragua VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
Apoyeque</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "tSysLAny1p",
:lat => "12.242",
:lng => "-86.342",
:url => "",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-50"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "",
:user_id => @user.id,
:slug => "XmNtaWCCsD",
:lat => "53.430",
:lng => "-168.130",
:start_year_uncert => "50",
:start_year => "-100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Okmok, Aleutian Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Okmok II caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "XmNtaWCCsD",
:lat => "53.430",
:lng => "-168.130",
:url => "",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "jMsJzDprMr",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "500",
:start_year => "-1050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "jMsJzDprMr",
:lat => "15.130",
:lng => "120.350",
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:start_year_uncert => "500",
:start_year => "-1050"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Pinatubo91eruption_clark_air_base.jpg')), filename: '280px-Pinatubo91eruption_clark_air_base.jpg', content_type: 'image/80px-pinatubo91eruption_clark_air_base.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Witori VEI 6 ", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "WYUh4QZ1mW",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "160",
:start_year => "-1370"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "WYUh4QZ1mW",
:lat => "-5.576",
:lng => "150.516",
:url => "",
:user_id => @user.id,
:start_year_uncert => "160",
:start_year => "-1370"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Aniakchak VEI 6 ", :start_year => -1645)
if result.length == 0
result = HoloceneEvent.create({:name => "Aniakchak VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Ice Core
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Aniakchak",
:user_id => @user.id,
:slug => "5GsXBhjCrq",
:lat => "56.880",
:lng => "-158.170",
:start_year_uncert => "10",
:start_year => "-1645"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aniakchak VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Ice Core
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "5GsXBhjCrq",
:lat => "56.880",
:lng => "-158.170",
:url => "https://en.wikipedia.org/wiki/Mount_Aniakchak",
:user_id => @user.id,
:start_year_uncert => "10",
:start_year => "-1645"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Aniakchak-caldera_alaska.jpg')), filename: '280px-Aniakchak-caldera_alaska.jpg', content_type: 'image/80px-aniakchak-caldera_alaska.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Veniaminof",
:user_id => @user.id,
:slug => "KuWGfDbWgF",
:lat => "56.170",
:lng => "-159.380",
:start_year_uncert => "",
:start_year => "-1750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Veniaminof, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "KuWGfDbWgF",
:lat => "56.170",
:lng => "-159.380",
:url => "https://en.wikipedia.org/wiki/Mount_Veniaminof",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1750"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-MountVeniaminof.jpg')), filename: '280px-MountVeniaminof.jpg', content_type: 'image/80px-mountveniaminof.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_St._Helens",
:user_id => @user.id,
:slug => "bf2UYgLmm7",
:lat => "46.200",
:lng => "-122.180",
:start_year_uncert => "",
:start_year => "-1860"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "St. Helens, Washington, USA VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "bf2UYgLmm7",
:lat => "46.200",
:lng => "-122.180",
:url => "https://en.wikipedia.org/wiki/Mount_St._Helens",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1860"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-MSH82_st_helens_plume_from_harrys_ridge_05-19-82.jpg')), filename: '280px-MSH82_st_helens_plume_from_harrys_ridge_05-19-82.jpg', content_type: 'image/80px-msh82_st_helens_plume_from_harrys_ridge_05-19-82.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Hudson",
:user_id => @user.id,
:slug => "Cubxvf5avm",
:lat => "-45.900",
:lng => "-72.970",
:start_year_uncert => "",
:start_year => "-1890"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "Cubxvf5avm",
:lat => "-45.900",
:lng => "-72.970",
:url => "https://en.wikipedia.org/wiki/Mount_Hudson",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1890"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Cerro_hudson.jpg')), filename: '280px-Cerro_hudson.jpg', content_type: 'image/80px-cerro_hudson.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Black_Peak_(Alaska)",
:user_id => @user.id,
:slug => "tD6W4ddY3g",
:lat => "56.552",
:lng => "-158.785",
:start_year_uncert => "150",
:start_year => "-1900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Peak, Alaska VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "tD6W4ddY3g",
:lat => "56.552",
:lng => "-158.785",
:url => "https://en.wikipedia.org/wiki/Black_Peak_(Alaska)",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-1900"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Black_Peak.jpg')), filename: '280px-Black_Peak.jpg', content_type: 'image/80px-black_peak.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Long_Island_(Papua_New_Guinea)",
:user_id => @user.id,
:slug => "Ez0Qdm9sur",
:lat => "-5.358",
:lng => "147.120",
:start_year_uncert => "100",
:start_year => "-2040"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "Ez0Qdm9sur",
:lat => "-5.358",
:lng => "147.120",
:url => "https://en.wikipedia.org/wiki/Long_Island_(Papua_New_Guinea)",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-2040"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Cerro_Blanco_(volcano)",
:user_id => @user.id,
:slug => "rRtGnPQJzd",
:lat => "-26.789",
:lng => "-67.765",
:start_year_uncert => "160",
:start_year => "-2300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "rRtGnPQJzd",
:lat => "-26.789",
:lng => "-67.765",
:url => "https://en.wikipedia.org/wiki/Cerro_Blanco_(volcano)",
:user_id => @user.id,
:start_year_uncert => "160",
:start_year => "-2300"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Cerro_Blanco_volcano_(AVA_Granule_L1B_20000916145757).jpg')), filename: '280px-Cerro_Blanco_volcano_(AVA_Granule_L1B_20000916145757).jpg', content_type: 'image/80px-cerro_blanco_volcano_(ava_granule_l1b_20000916145757).jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6", :start_year => -3550)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "KrBANSWMY5",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "",
:start_year => "-3550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "KrBANSWMY5",
:lat => "15.130",
:lng => "120.350",
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3550"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Pinatubo91eruption_clark_air_base.jpg')), filename: '280px-Pinatubo91eruption_clark_air_base.jpg', content_type: 'image/80px-pinatubo91eruption_clark_air_base.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Taal_Volcano",
:user_id => @user.id,
:slug => "EFfkJJFVSA",
:lat => "14.002",
:lng => "120.993",
:start_year_uncert => "200",
:start_year => "-3580"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taal, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "EFfkJJFVSA",
:lat => "14.002",
:lng => "120.993",
:url => "https://en.wikipedia.org/wiki/Taal_Volcano",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-3580"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Taal_Volcano_aerial_2013.jpg')), filename: '280px-Taal_Volcano_aerial_2013.jpg', content_type: 'image/80px-taal_volcano_aerial_2013.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Witori Caldera VEI 6 ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori Caldera VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "bJmX7phFGX",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "210",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori Caldera VEI 6 ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "bJmX7phFGX",
:lat => "-5.576",
:lng => "150.516",
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "210",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Ulawun_steam_plume.jpg')), filename: '280px-Ulawun_steam_plume.jpg', content_type: 'image/80px-ulawun_steam_plume.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Masaya, Nicaragua VEI 6 ", :start_year => -4050)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
NW of caldera</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Masaya_Volcano",
:user_id => @user.id,
:slug => "NPLqh9Ab6b",
:lat => "11.984",
:lng => "-86.161",
:start_year_uncert => "",
:start_year => "-4050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Tephrochronology
NW of caldera</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "NPLqh9Ab6b",
:lat => "11.984",
:lng => "-86.161",
:url => "https://en.wikipedia.org/wiki/Masaya_Volcano",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4050"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Volcan_Masaya2.jpg')), filename: '280px-Volcan_Masaya2.jpg', content_type: 'image/80px-volcan_masaya2.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7", :start_year => -4350)
if result.length == 0
result = HoloceneEvent.create({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (uncorrected)
Kikai caldera</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Kikai_Caldera",
:user_id => @user.id,
:slug => "yM0duCehma",
:lat => "30.789",
:lng => "130.308",
:start_year_uncert => "",
:start_year => "-4350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (uncorrected)
Kikai caldera</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "yM0duCehma",
:lat => "30.789",
:lng => "130.308",
:url => "https://en.wikipedia.org/wiki/Kikai_Caldera",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4350"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'Kikai_Caldera_Relief_Map,_SRTM,_English.jpg')), filename: 'Kikai_Caldera_Relief_Map,_SRTM,_English.jpg', content_type: 'image/ikai_caldera_relief_map,_srtm,_english.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Macauley Island, Kermadec Islands VEI 6", :start_year => -4360)
if result.length == 0
result = HoloceneEvent.create({:name => "Macauley Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Macauley_Island",
:user_id => @user.id,
:slug => "10QGb31mBR",
:lat => "-30.210",
:lng => "-178.475",
:start_year_uncert => "200",
:start_year => "-4360"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Macauley Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "10QGb31mBR",
:lat => "-30.210",
:lng => "-178.475",
:url => "https://en.wikipedia.org/wiki/Macauley_Island",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-4360"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '260px-Macauley_Island.png')), filename: '260px-Macauley_Island.png', content_type: 'image/60px-macauley_island.png')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Hudson",
:user_id => @user.id,
:slug => "varcBNnKQ8",
:lat => "-45.900",
:lng => "-72.970",
:start_year_uncert => "",
:start_year => "-4750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "varcBNnKQ8",
:lat => "-45.900",
:lng => "-72.970",
:url => "https://en.wikipedia.org/wiki/Mount_Hudson",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4750"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Cerro_hudson.jpg')), filename: '280px-Cerro_hudson.jpg', content_type: 'image/80px-cerro_hudson.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Aniakchak",
:user_id => @user.id,
:slug => "H1wKSjyRq9",
:lat => "56.880",
:lng => "-158.170",
:start_year_uncert => "1000",
:start_year => "-5250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aniakchak, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "H1wKSjyRq9",
:lat => "56.880",
:lng => "-158.170",
:url => "https://en.wikipedia.org/wiki/Mount_Aniakchak",
:user_id => @user.id,
:start_year_uncert => "1000",
:start_year => "-5250"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Aniakchak-caldera_alaska.jpg')), filename: '280px-Aniakchak-caldera_alaska.jpg', content_type: 'image/80px-aniakchak-caldera_alaska.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Tao-Rusyr_Caldera",
:user_id => @user.id,
:slug => "0P5sJxJA4C",
:lat => "49.350",
:lng => "154.700",
:start_year_uncert => "75",
:start_year => "-5550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Tao-Rusyr</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "0P5sJxJA4C",
:lat => "49.350",
:lng => "154.700",
:url => "https://en.wikipedia.org/wiki/Tao-Rusyr_Caldera",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-5550"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'OnekotanIslandNASA.jpg')), filename: 'OnekotanIslandNASA.jpg', content_type: 'image/nekotanislandnasa.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Lake_Mash%C5%AB",
:user_id => @user.id,
:slug => "CgZH6WPxJj",
:lat => "43.572",
:lng => "144.561",
:start_year_uncert => "100",
:start_year => "-5550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mashu, Hokkaido (Japan) VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "CgZH6WPxJj",
:lat => "43.572",
:lng => "144.561",
:url => "https://en.wikipedia.org/wiki/Lake_Mash%C5%AB",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-5550"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '250px-Image-2008_Lake_Masshu.jpg')), filename: '250px-Image-2008_Lake_Masshu.jpg', content_type: 'image/50px-image-2008_lake_masshu.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Mt. Mizama (Crater Lake Caldera) VEI 7", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Mt. Mizama (Crater Lake Caldera) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Ice Core
Mt. Mazama summit and flank vents
North flank (Llao Rock)
This event is noted in native American legions about a battle of the Gods where one threw down the other.</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Crater_Lake",
:user_id => @user.id,
:slug => "wBJzzmXr1d",
:lat => "42.930",
:lng => "-122.120",
:start_year_uncert => "150",
:start_year => "-5677"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mt. Mizama (Crater Lake Caldera) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Ice Core
Mt. Mazama summit and flank vents
North flank (Llao Rock)
This event is noted in native American legions about a battle of the Gods where one threw down the other.</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "wBJzzmXr1d",
:lat => "42.930",
:lng => "-122.120",
:url => "https://en.wikipedia.org/wiki/Crater_Lake",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-5677"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '250px-Crater_Lake_winter_pano2.jpg')), filename: '250px-Crater_Lake_winter_pano2.jpg', content_type: 'image/50px-crater_lake_winter_pano2.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Khangar",
:user_id => @user.id,
:slug => "b2upzgtQF1",
:lat => "54.761",
:lng => "157.407",
:start_year_uncert => "16",
:start_year => "-5700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Khangar ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => [],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "b2upzgtQF1",
:lat => "54.761",
:lng => "157.407",
:url => "https://en.wikipedia.org/wiki/Khangar",
:user_id => @user.id,
:start_year_uncert => "16",
:start_year => "-5700"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Khangar.jpg')), filename: '280px-Khangar.jpg', content_type: 'image/80px-khangar.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Menenga, Eastern Africa VEI 6+", :start_year => -6050)
if result.length == 0
result = HoloceneEvent.create({:name => "Menenga, Eastern Africa VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @africa,
:url => "https://en.wikipedia.org/wiki/Menengai",
:user_id => @user.id,
:slug => "w8keB9kQhc",
:lat => "-0.200",
:lng => "36.070",
:start_year_uncert => "",
:start_year => "-6050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Menenga, Eastern Africa VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption
Radiocarbon (uncorrected)
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @africa,
:slug => "w8keB9kQhc",
:lat => "-0.200",
:lng => "36.070",
:url => "https://en.wikipedia.org/wiki/Menengai",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6050"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'Menengai_crater_view_from_the_edge.jpg')), filename: 'Menengai_crater_view_from_the_edge.jpg', content_type: 'image/enengai_crater_view_from_the_edge.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Kurile Lake Caldera VEI 7", :start_year => -6442)
if result.length == 0
result = HoloceneEvent.create({:name => "Kurile Lake Caldera VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Tao-Rusyr_Caldera",
:user_id => @user.id,
:slug => "gtspx6qzqZ",
:lat => "51.450",
:lng => "157.120",
:start_year_uncert => "28",
:start_year => "-6442"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kurile Lake Caldera VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "gtspx6qzqZ",
:lat => "51.450",
:lng => "157.120",
:url => "https://en.wikipedia.org/wiki/Tao-Rusyr_Caldera",
:user_id => @user.id,
:start_year_uncert => "28",
:start_year => "-6442"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'OnekotanIslandNASA.jpg')), filename: 'OnekotanIslandNASA.jpg', content_type: 'image/nekotanislandnasa.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Karymsky VEI 6 ", :start_year => -6600)
if result.length == 0
result = HoloceneEvent.create({:name => "Karymsky VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Karymsky caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Karymsky_(volcano)",
:user_id => @user.id,
:slug => "6MKHffQgX3",
:lat => "54.049",
:lng => "159.443",
:start_year_uncert => "",
:start_year => "-6600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Karymsky VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Karymsky caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "6MKHffQgX3",
:lat => "54.049",
:lng => "159.443",
:url => "https://en.wikipedia.org/wiki/Karymsky_(volcano)",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6600"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Akademia_nauk.jpg')), filename: '280px-Akademia_nauk.jpg', content_type: 'image/80px-akademia_nauk.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Fisher_Caldera",
:user_id => @user.id,
:slug => "hCJnEnMmMK",
:lat => "54.650",
:lng => "-164.430",
:start_year_uncert => "200",
:start_year => "-7420"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Fisher Caldera, Aleutian Islands  VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (uncorrected)
NE and SW parts of Fisher caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "hCJnEnMmMK",
:lat => "54.650",
:lng => "-164.430",
:url => "https://en.wikipedia.org/wiki/Fisher_Caldera",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-7420"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "JxnnbeP9wJ",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "150",
:start_year => "-7460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption
Radiocarbon (corrected)
Tayawan caldera</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "JxnnbeP9wJ",
:lat => "15.130",
:lng => "120.350",
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-7460"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Pinatubo91eruption_clark_air_base.jpg')), filename: '280px-Pinatubo91eruption_clark_air_base.jpg', content_type: 'image/80px-pinatubo91eruption_clark_air_base.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Aira Caldera VEI 6 ", :start_year => -8050)
if result.length == 0
result = HoloceneEvent.create({:name => "Aira Caldera VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Wakamiko Caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Aira_Caldera",
:user_id => @user.id,
:slug => "67gNkkutjU",
:lat => "31.593",
:lng => "130.657",
:start_year_uncert => "1000",
:start_year => "-8050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aira Caldera VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Wakamiko Caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "67gNkkutjU",
:lat => "31.593",
:lng => "130.657",
:url => "https://en.wikipedia.org/wiki/Aira_Caldera",
:user_id => @user.id,
:start_year_uncert => "1000",
:start_year => "-8050"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Sakura-jima_from_space.jpg')), filename: '280px-Sakura-jima_from_space.jpg', content_type: 'image/80px-sakura-jima_from_space.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @icelandandarcticocean,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "yAptqUpQL1",
:lat => "64.417",
:lng => "17.206",
:start_year_uncert => "50",
:start_year => "-8230"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grimsvotn, Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @icelandandarcticocean,
:slug => "yAptqUpQL1",
:lat => "64.417",
:lng => "17.206",
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-8230"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Iceland_Grimsvoetn_1972-B.jpg')), filename: '280px-Iceland_Grimsvoetn_1972-B.jpg', content_type: 'image/80px-iceland_grimsvoetn_1972-b.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Minchinmavida VEI 6 ", :start_year => -8400)
if result.length == 0
result = HoloceneEvent.create({:name => "Minchinmavida VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Michinmahuida",
:user_id => @user.id,
:slug => "QxfX5XDE0P",
:lat => "-42.793",
:lng => "-72.439",
:start_year_uncert => "150",
:start_year => "-8400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Minchinmavida VEI 6 ",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "QxfX5XDE0P",
:lat => "-42.793",
:lng => "-72.439",
:url => "https://en.wikipedia.org/wiki/Michinmahuida",
:user_id => @user.id,
:start_year_uncert => "150",
:start_year => "-8400"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-The-glaciated-michinmavida-volcano-lies-directly-behind-chaiten-in-eruption.jpg')), filename: '280px-The-glaciated-michinmavida-volcano-lies-directly-behind-chaiten-in-eruption.jpg', content_type: 'image/80px-the-glaciated-michinmavida-volcano-lies-directly-behind-chaiten-in-eruption.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Ulleung, Korea VEI 6", :start_year => -8750)
if result.length == 0
result = HoloceneEvent.create({:name => "Ulleung, Korea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Ulleungdo",
:user_id => @user.id,
:slug => "v3mmKGn4eB",
:lat => "37.500",
:lng => "130.870",
:start_year_uncert => "",
:start_year => "-8750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ulleung, Korea VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "v3mmKGn4eB",
:lat => "37.500",
:lng => "130.870",
:url => "https://en.wikipedia.org/wiki/Ulleungdo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8750"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '260px-Ulleung_island_from_above.jpg')), filename: '260px-Ulleung_island_from_above.jpg', content_type: 'image/60px-ulleung_island_from_above.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "Bu5Y8R9Ucy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "English Channel formed ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @europe,
:slug => "Bu5Y8R9Ucy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Climate or Thermal Maximum ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Climate or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "nE7JkCbfgm",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Climate or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "nE7JkCbfgm",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 5 - 8.2K Event ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "<p>The only Bond event to show a signature in the ice cores. 300 years of coldness and dryness.
</p>",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/8.2_kiloyear_event",
:user_id => @user.id,
:slug => "b74y6Fsy3u",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "<p>The only Bond event to show a signature in the ice cores. 300 years of coldness and dryness.
</p>",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "b74y6Fsy3u",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/8.2_kiloyear_event",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cotopaxi, Ecuador VEI 5+", :start_year => -5820)
if result.length == 0
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Cotopaxi",
:user_id => @user.id,
:slug => "MCLwKNxBs0",
:lat => "-0.680556",
:lng => "-78.437778",
:start_year_uncert => "75",
:start_year => "-5820"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  ],
:region => @global,
:slug => "MCLwKNxBs0",
:lat => "-0.680556",
:lng => "-78.437778",
:url => "https://en.wikipedia.org/wiki/Cotopaxi",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-5820"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Cotopaxi_volcano_2008-06-27T1322.jpg')), filename: '280px-Cotopaxi_volcano_2008-06-27T1322.jpg', content_type: 'image/80px-cotopaxi_volcano_2008-06-27t1322.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Black_Sea_deluge_hypothesis",
:user_id => @user.id,
:slug => "bjMYpuCdvw",
:lat => "44",
:lng => "35",
:start_year_uncert => "",
:start_year => "-5600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["Earth", "Flood"],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "bjMYpuCdvw",
:lat => "44",
:lng => "35",
:url => "https://en.wikipedia.org/wiki/Black_Sea_deluge_hypothesis",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -5060)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "C3AWMyeukM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5060"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @europe,
:slug => "C3AWMyeukM",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5060"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -4375)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "dBBbhvv7b0",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4375"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @europe,
:slug => "dBBbhvv7b0",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4375"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "aFxD9Axfvd",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "200",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "aFxD9Axfvd",
:lat => "-5.576",
:lng => "150.516",
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "200",
:start_year => "-4000"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Ulawun_steam_plume.jpg')), filename: '280px-Ulawun_steam_plume.jpg', content_type: 'image/80px-ulawun_steam_plume.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "Y8qMWtnUu7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "<p>5.9K Event was one of the most intense aridification events during the Holocene.</p>",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "Y8qMWtnUu7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Cotopaxi, Ecuador VEI 5+", :start_year => -3880)
if result.length == 0
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Cotopaxi",
:user_id => @user.id,
:slug => "T3mUuWqcxU",
:lat => "-0.680556",
:lng => "-78.437778",
:start_year_uncert => "75",
:start_year => "-3880"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "T3mUuWqcxU",
:lat => "-0.680556",
:lng => "-78.437778",
:url => "https://en.wikipedia.org/wiki/Cotopaxi",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-3880"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Cotopaxi_volcano_2008-06-27T1322.jpg')), filename: '280px-Cotopaxi_volcano_2008-06-27T1322.jpg', content_type: 'image/80px-cotopaxi_volcano_2008-06-27t1322.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "HuFhZSjXh7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "<p>An abrupt cold and wet period in climate history of the Holocene.  Global in nature.</p>",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "HuFhZSjXh7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Burckle Crater: Noah's Flood ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Burckle Crater: Noah's Flood ",
:end_year => "-2800",
:body => "<p>Unconfirmed</p>",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_types => [  @impact,@place ] ,
:region => @indianocean,
:url => "",
:user_id => @user.id,
:slug => "qtub9GC0qR",
:lat => "-30.86",
:lng => "61.36",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burckle Crater: Noah's Flood ",
:end_year => "-2800",
:body => "<p>Unconfirmed</p>",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_types => [ @impact,@place ],
:region => @indianocean,
:slug => "qtub9GC0qR",
:lat => "-30.86",
:lng => "61.36",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -3195)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "kBbxUCcrrn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3195"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @europe,
:slug => "kBbxUCcrrn",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3195"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
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
:event_types => [  @impact,@place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "s1vfT7ar1a",
:lat => "31.241389",
:lng => "47.105833",
:start_year_uncert => "",
:start_year => "-2354"
})
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
:event_types => [ @impact,@place ],
:region => @middleeast,
:slug => "s1vfT7ar1a",
:lat => "31.241389",
:lng => "47.105833",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tree Ring Event(9 years) ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(9 years) ",
:end_year => "-2345",
:body => "<p>Lasted 9 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1FJdANmG4S",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2354"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(9 years) ",
:end_year => "-2345",
:body => "<p>Lasted 9 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "1FJdANmG4S",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/4.2_kiloyear_event",
:user_id => @user.id,
:slug => "w1KHVaSddn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "w1KHVaSddn",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/4.2_kiloyear_event",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:tag_list => ["Eruption", "VEI7", "Tsunami", "Earth", "Earthquake"],
:event_types => [  @volcanic,@place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Santorini_caldera",
:user_id => @user.id,
:slug => "DYTWZ2693J",
:lat => "36.404",
:lng => "25.396",
:start_year_uncert => "14",
:start_year => "-1628"
})
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
:tag_list => ["Eruption", "VEI7", "Tsunami", "Earth", "Earthquake"],
:event_types => [ @volcanic,@place ],
:region => @europe,
:slug => "DYTWZ2693J",
:lat => "36.404",
:lng => "25.396",
:url => "https://en.wikipedia.org/wiki/Santorini_caldera",
:user_id => @user.id,
:start_year_uncert => "14",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Santorini_Caldera_Landsat.jpg')), filename: '280px-Santorini_Caldera_Landsat.jpg', content_type: 'image/80px-santorini_caldera_landsat.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tree Ring Event(6 years) ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(6 years) ",
:end_year => "-1622",
:body => "<p>Lasted 6 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "saN60y1S9e",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(6 years) ",
:end_year => "-1622",
:body => "<p>Lasted 6 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "saN60y1S9e",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Kaali Meteor Impact ", :start_year => -1490)
if result.length == 0
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Kaali_crater",
:user_id => @user.id,
:slug => "eDFUZZRje4",
:lat => "58.366667",
:lng => "22.666667",
:start_year_uncert => "40",
:start_year => "-1490"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kaali Meteor Impact ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "eDFUZZRje4",
:lat => "58.366667",
:lng => "22.666667",
:url => "https://en.wikipedia.org/wiki/Kaali_crater",
:user_id => @user.id,
:start_year_uncert => "40",
:start_year => "-1490"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '220px-Kaali-crater-saaremaa-estonia-aug-2007.jpg')), filename: '220px-Kaali-crater-saaremaa-estonia-aug-2007.jpg', content_type: 'image/20px-kaali-crater-saaremaa-estonia-aug-2007.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Macha Crater ", :start_year => -5300)
if result.length == 0
result = HoloceneEvent.create({:name => "Macha Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "https://en.wikipedia.org/wiki/Macha_crater",
:user_id => @user.id,
:slug => "NARuxzXgj0",
:lat => "60.085833",
:lng => "117.651944",
:start_year_uncert => "",
:start_year => "-5300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Macha Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "NARuxzXgj0",
:lat => "60.085833",
:lng => "117.651944",
:url => "https://en.wikipedia.org/wiki/Macha_crater",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5300"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'Macha_craters_overview_map.jpg')), filename: 'Macha_craters_overview_map.jpg', content_type: 'image/acha_craters_overview_map.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:slug => "kCn4QBpfRX",
:lat => "-38.820",
:lng => "176.000",
:start_year_uncert => "40",
:start_year => "-1460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (corrected)
Horomatangi Reefs?</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "kCn4QBpfRX",
:lat => "-38.820",
:lng => "176.000",
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:start_year_uncert => "40",
:start_year => "-1460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "1Rhy4dWVP8",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "100",
:start_year => "-1370"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "1Rhy4dWVP8",
:lat => "-5.576",
:lng => "150.516",
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "-1370"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Ulawun_steam_plume.jpg')), filename: '280px-Ulawun_steam_plume.jpg', content_type: 'image/80px-ulawun_steam_plume.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Mycenea - Earthquake ", :start_year => -1240)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea - Earthquake ",
:end_year => "",
:body => "",
:tag_list => ["Earth", "Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "x5URSc5Xr1",
:lat => "37.730792",
:lng => "22.756382",
:start_year_uncert => "",
:start_year => "-1240"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea - Earthquake ",
:end_year => "",
:body => "",
:tag_list => ["Earth", "Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "x5URSc5Xr1",
:lat => "37.730792",
:lng => "22.756382",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1240"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mycenea - Earthquakes ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenea - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earth", "Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "18war6XRkf",
:lat => "37.730792",
:lng => "22.756382",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenea - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earth", "Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "18war6XRkf",
:lat => "37.730792",
:lng => "22.756382",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Helka 3, Iceland VEI 6", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Helka 3, Iceland VEI 6",
:end_year => "",
:body => "<p>LHE date 1100 BC ±50 years
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Hekla",
:user_id => @user.id,
:slug => "GGMDdTD3xk",
:lat => "63.983333",
:lng => "-19.7",
:start_year_uncert => "50",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helka 3, Iceland VEI 6",
:end_year => "",
:body => "<p>LHE date 1100 BC ±50 years
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  ],
:region => @global,
:slug => "GGMDdTD3xk",
:lat => "63.983333",
:lng => "-19.7",
:url => "https://en.wikipedia.org/wiki/Hekla",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Downturn of environment: Tree Ring Event(18 years) ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2LUStcMLvL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "2LUStcMLvL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "d83WAbP1CL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Iron Age Climate Pessimism ",
:end_year => "-300",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "d83WAbP1CL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Iron Age Climate Pessimism - Coldest Point ", :start_year => -450)
if result.length == 0
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "N8jMSf5HSt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-450"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "N8jMSf5HSt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-450"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bond 2 ", :start_year => -800)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "KrHxdRvRJ8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 2 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "KrHxdRvRJ8",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Late Bronze Age Collapse ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "kf1N8VQDSh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Late Bronze Age Collapse ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @eurasia,
:slug => "kf1N8VQDSh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Poseidon's Horses: Earthquake Swarm ", :start_year => -1225)
if result.length == 0
result = HoloceneEvent.create({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake", "Earth"],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "s7avWrmcKx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1225"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake", "Earth"],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "s7avWrmcKx",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1225"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Storegga Slide ", :start_year => -8100)
if result.length == 0
result = HoloceneEvent.create({:name => "Storegga Slide ",
:end_year => "",
:body => "<p>A megatsunami Norwegian Sea caused by the collapse of a Feord face.
</p>",
:tag_list => ["Tsunami"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Storegga_Slide",
:user_id => @user.id,
:slug => "ar8M39daMf",
:lat => "64.866667",
:lng => "1.3",
:start_year_uncert => "",
:start_year => "-8100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Storegga Slide ",
:end_year => "",
:body => "<p>A megatsunami Norwegian Sea caused by the collapse of a Feord face.
</p>",
:tag_list => ["Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:slug => "ar8M39daMf",
:lat => "64.866667",
:lng => "1.3",
:url => "https://en.wikipedia.org/wiki/Storegga_Slide",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Coldest point of Iron Age  Pessimism ", :start_year => -450)
if result.length == 0
result = HoloceneEvent.create({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "C2m7PNm31r",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-450"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "C2m7PNm31r",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-450"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Destruction of Tartessos ", :start_year => -440)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Tartessos ",
:end_year => "",
:body => "<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar.</p>",
:tag_list => ["Tartessos"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "L7HmNwcdwx",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-440"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Tartessos ",
:end_year => "",
:body => "<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar.</p>",
:tag_list => ["Tartessos"],
:event_types => [ @place ],
:region => @europe,
:slug => "L7HmNwcdwx",
:lat => "37.21",
:lng => "-6.938",
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-440"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "https://en.wikipedia.org/wiki/Helike",
:user_id => @user.id,
:slug => "XxaAXZczxU",
:lat => "38.219167",
:lng => "22.132778",
:start_year_uncert => "",
:start_year => "-373"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helike, Greece disappears into the sea ",
:end_year => "",
:body => "<p>The city was submerged by a tsunami in the winter of 373 BC.
</p>",
:tag_list => ["Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:slug => "XxaAXZczxU",
:lat => "38.219167",
:lng => "22.132778",
:url => "https://en.wikipedia.org/wiki/Helike",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-373"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Raoul Island, Kermadec Islands VEI 6", :start_year => -208)
if result.length == 0
result = HoloceneEvent.create({:name => "Raoul Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Denham caldera</p><p>LHE lists the date as 250 BC.</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Raoul_Island",
:user_id => @user.id,
:slug => "7uB35yJ4pE",
:lat => "-29.266667",
:lng => "-177.916667",
:start_year_uncert => "75",
:start_year => "-208"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Raoul Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6
Confirmed Eruption
Radiocarbon (uncorrected)
Denham caldera</p><p>LHE lists the date as 250 BC.</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "7uB35yJ4pE",
:lat => "-29.266667",
:lng => "-177.916667",
:url => "https://en.wikipedia.org/wiki/Raoul_Island",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "-208"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '260px-STS008-36-1403_cropped_rotated.jpg')), filename: '260px-STS008-36-1403_cropped_rotated.jpg', content_type: 'image/60px-sts008-36-1403_cropped_rotated.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Tree Ring Event(4 years) ", :start_year => -208)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(4 years) ",
:end_year => "-204",
:body => "<p>Winter which lasted 4 years,.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "R31UvvEVrT",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-208"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(4 years) ",
:end_year => "-204",
:body => "<p>Winter which lasted 4 years,.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  ],
:region => @global,
:slug => "R31UvvEVrT",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-208"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "HDx1hAjxNz",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Roman Age Optimum ",
:end_year => "300",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "HDx1hAjxNz",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Masaya, Nicaragua VEI 5+", :start_year => 150)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Masaya_Volcano",
:user_id => @user.id,
:slug => "pFFvVfAv6J",
:lat => "11.982778",
:lng => "-86.161944",
:start_year_uncert => "",
:start_year => "150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  ],
:region => @global,
:slug => "pFFvVfAv6J",
:lat => "11.982778",
:lng => "-86.161944",
:url => "https://en.wikipedia.org/wiki/Masaya_Volcano",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "150"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Volcan_Masaya2.jpg')), filename: '280px-Volcan_Masaya2.jpg', content_type: 'image/80px-volcan_masaya2.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:slug => "Kr4KJ3WkNd",
:lat => "-38.820",
:lng => "176.000",
:start_year_uncert => "",
:start_year => "180"
})
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
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "Kr4KJ3WkNd",
:lat => "-38.820",
:lng => "176.000",
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "180"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rabaul, New Britain VEI 6", :start_year => 512)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabaul, New Britain VEI 6",
:end_year => "",
:body => "<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  The LHE list says 540 AD ±100 years.</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Rabaul",
:user_id => @user.id,
:slug => "fyVdxPyCbn",
:lat => "-4.2",
:lng => "152.183333",
:start_year_uncert => "4",
:start_year => "512"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabaul, New Britain VEI 6",
:end_year => "",
:body => "<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  The LHE list says 540 AD ±100 years.</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  ],
:region => @global,
:slug => "fyVdxPyCbn",
:lat => "-4.2",
:lng => "152.183333",
:url => "https://en.wikipedia.org/wiki/Rabaul",
:user_id => @user.id,
:start_year_uncert => "4",
:start_year => "512"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '260px-STS008-36-1403_cropped_rotated.jpg')), filename: '260px-STS008-36-1403_cropped_rotated.jpg', content_type: 'image/60px-sts008-36-1403_cropped_rotated.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Bond 1 Tree Ring Event(9 years) ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event(9 years) ",
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
:url => "",
:user_id => @user.id,
:slug => "h6UFkUhLPH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "536"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 1 Tree Ring Event(9 years) ",
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
:slug => "h6UFkUhLPH",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "536"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "DnDWg1LAgy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "540"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "DnDWg1LAgy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "540"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Olympia destroyed by tsunami ", :start_year => 551)
if result.length == 0
result = HoloceneEvent.create({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "<p>Earthquake at Olympia destroys the site at Peloponnese.</p>",
:tag_list => ["Tsunami", "Earthquake", "Earth"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "KwXzG6PHCA",
:lat => "37.636164122",
:lng => "21.6249975",
:start_year_uncert => "",
:start_year => "551"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "<p>Earthquake at Olympia destroys the site at Peloponnese.</p>",
:tag_list => ["Tsunami", "Earthquake", "Earth"],
:event_types => [ @earth ],
:region => @europe,
:slug => "KwXzG6PHCA",
:lat => "37.636164122",
:lng => "21.6249975",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "551"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("olympiaearthquake")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "Pr7G4zq25Y",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "75",
:start_year => "710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "Pr7G4zq25Y",
:lat => "-5.576",
:lng => "150.516",
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:start_year_uncert => "75",
:start_year => "710"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Ulawun_steam_plume.jpg')), filename: '280px-Ulawun_steam_plume.jpg', content_type: 'image/80px-ulawun_steam_plume.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Churchill, Eastern Alaska VEI 6", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill, Eastern Alaska VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:slug => "cTZXebD2xe",
:lat => "61.380",
:lng => "-141.750",
:start_year_uncert => "100",
:start_year => "800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill, Eastern Alaska VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "cTZXebD2xe",
:lat => "61.380",
:lng => "-141.750",
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:start_year_uncert => "100",
:start_year => "800"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-MtChurchill-KlutlanGlacier.jpg')), filename: '280px-MtChurchill-KlutlanGlacier.jpg', content_type: 'image/80px-mtchurchill-klutlanglacier.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Dakataua, New Britain VEI 6", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Dakataua",
:user_id => @user.id,
:slug => "84af2kbeFP",
:lat => "-5.094",
:lng => "150.094",
:start_year_uncert => "50",
:start_year => "800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "84af2kbeFP",
:lat => "-5.094",
:lng => "150.094",
:url => "https://en.wikipedia.org/wiki/Dakataua",
:user_id => @user.id,
:start_year_uncert => "50",
:start_year => "800"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Ulawun_steam_plume.jpg')), filename: '280px-Ulawun_steam_plume.jpg', content_type: 'image/80px-ulawun_steam_plume.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 5+", :start_year => 1030)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Billy_Mitchell_(volcano)",
:user_id => @user.id,
:slug => "RHLA6kYGuJ",
:lat => "-6.092",
:lng => "155.225",
:start_year_uncert => "25",
:start_year => "1030"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "RHLA6kYGuJ",
:lat => "-6.092",
:lng => "155.225",
:url => "https://en.wikipedia.org/wiki/Billy_Mitchell_(volcano)",
:user_id => @user.id,
:start_year_uncert => "25",
:start_year => "1030"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', 'MtBalbiToreNASA.jpg')), filename: 'MtBalbiToreNASA.jpg', content_type: 'image/tbalbitorenasa.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "gVq8Zfqg0z",
:lat => "",
:lng => "",
:start_year_uncert => "4",
:start_year => "1294"
})
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
:slug => "gVq8Zfqg0z",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "4",
:start_year => "1294"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
biblio = Biblioentry.find_by_xreflabel("baillie1999")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
result = HoloceneEvent.where(:name => "Mahuika Crater ", :start_year => 1440)
if result.length == 0
result = HoloceneEvent.create({:name => "Mahuika Crater ",
:end_year => "",
:body => "<p>The dating of this 1440 AD impact is in dispute due to several factors.</p><p>Unconfirmed</p>",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "tptBfhpf1d",
:lat => "-48.3",
:lng => "166.4",
:start_year_uncert => "15",
:start_year => "1440"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mahuika Crater ",
:end_year => "",
:body => "<p>The dating of this 1440 AD impact is in dispute due to several factors.</p><p>Unconfirmed</p>",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "tptBfhpf1d",
:lat => "-48.3",
:lng => "166.4",
:url => "",
:user_id => @user.id,
:start_year_uncert => "15",
:start_year => "1440"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kuwae, Vanuatu VEI 7 ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "<p>
Three year cooling event.
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Kuwae",
:user_id => @user.id,
:slug => "mFgWeqk5Ju",
:lat => "-16.829",
:lng => "168.536",
:start_year_uncert => "",
:start_year => "1453"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "<p>
Three year cooling event.
</p>",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @global,
:slug => "mFgWeqk5Ju",
:lat => "-16.829",
:lng => "168.536",
:url => "https://en.wikipedia.org/wiki/Kuwae",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-ShepherdIslandsMap.png')), filename: '280px-ShepherdIslandsMap.png', content_type: 'image/80px-shepherdislandsmap.png')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Three year cold event ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Three year cold event ",
:end_year => "1456",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "XFyw9a9xBa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1453"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Three year cold event ",
:end_year => "1456",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "XFyw9a9xBa",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1453"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Little Ice Age ", :start_year => 1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Little Ice Age ",
:end_year => "1850",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Zbq8bysd0D",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Little Ice Age ",
:end_year => "1850",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "Zbq8bysd0D",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Cold Point of Little Ice Age ", :start_year => 1650)
if result.length == 0
result = HoloceneEvent.create({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "NfZaxx5HE0",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "NfZaxx5HE0",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1650"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Second Cold Point of Little Ice Age ", :start_year => 1770)
if result.length == 0
result = HoloceneEvent.create({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1u60hWWPny",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1770"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "1u60hWWPny",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1770"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ", :start_year => 1783)
if result.length == 0
result = HoloceneEvent.create({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "<p>The famous volcanic event which started the great Benjamin Franklin asking the question of weither the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption.</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "cJ1pVdjFtA",
:lat => "64.42",
:lng => "-17.33",
:start_year_uncert => "",
:start_year => "1783"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "<p>The famous volcanic event which started the great Benjamin Franklin asking the question of weither the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption.</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  ],
:region => @global,
:slug => "cJ1pVdjFtA",
:lat => "64.42",
:lng => "-17.33",
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1783"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Iceland_Grimsvoetn_1972-B.jpg')), filename: '280px-Iceland_Grimsvoetn_1972-B.jpg', content_type: 'image/80px-iceland_grimsvoetn_1972-b.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Third Cold Point of the Little Ice Age ", :start_year => 1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "GK4utjjwQk",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1850"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "GK4utjjwQk",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1850"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Carrington Event: Solar Storm of 1859 ", :start_year => 1859)
if result.length == 0
result = HoloceneEvent.create({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "zXLrqvs4bh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1859"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [ @earth ],
:region => @global,
:slug => "zXLrqvs4bh",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1859"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tunguska Event ", :start_year => 1908)
if result.length == 0
result = HoloceneEvent.create({:name => "Tunguska Event ",
:end_year => "",
:body => "<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [  @impact,@place ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "8L3ePM0rrX",
:lat => "60.916667",
:lng => "101.95",
:start_year_uncert => "",
:start_year => "1908"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tunguska Event ",
:end_year => "",
:body => "<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [ @impact,@place ],
:region => @fareast,
:slug => "8L3ePM0rrX",
:lat => "60.916667",
:lng => "101.95",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "1908"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grimsvotn Volanco, Iceland VEI 4 ", :start_year => 2010)
if result.length == 0
result = HoloceneEvent.create({:name => "Grimsvotn Volanco, Iceland VEI 4 ",
:end_year => "",
:body => "<p>This eruption caused desruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  @volcanic,@place ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "ZWKSK5qeRw",
:lat => "64.417",
:lng => "17.206",
:start_year_uncert => "",
:start_year => "2010"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grimsvotn Volanco, Iceland VEI 4 ",
:end_year => "",
:body => "<p>This eruption caused desruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [ @volcanic,@place ],
:region => @global,
:slug => "ZWKSK5qeRw",
:lat => "64.417",
:lng => "17.206",
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "2010"
})
debugger if res.nil?
result = result[0]
end
end
result.image.attach(io: File.open(Rails.root.join('db', 'seeds', '280px-Iceland_Grimsvoetn_1972-B.jpg')), filename: '280px-Iceland_Grimsvoetn_1972-B.jpg', content_type: 'image/80px-iceland_grimsvoetn_1972-b.jpg')
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => 690)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Npwwnudqy0",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "690"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "Npwwnudqy0",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "690"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -360)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "MRabGEP53q",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-360"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "MRabGEP53q",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-360"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -770)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "S49jgg2LNN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-770"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "S49jgg2LNN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-770"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -1390)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "CLnMU6G0ch",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1390"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "CLnMU6G0ch",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1390"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -2860)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "cQ1YvzatZw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2860"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "cQ1YvzatZw",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2860"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3340)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "j3LhQCx7fQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3340"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "j3LhQCx7fQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3340"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "jeFcwZj1cw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "jeFcwZj1cw",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3630)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "rfhUbRDcNr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3630"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "rfhUbRDcNr",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3630"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3940)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "KEQzjZceQG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3940"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "KEQzjZceQG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3940"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -4230)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "PwjtWzBR8q",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4230"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "PwjtWzBR8q",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4230"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -4330)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "HgjxBprFYf",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4330"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "HgjxBprFYf",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4330"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5260)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mVEpVbqSBY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5260"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "mVEpVbqSBY",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5260"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5460)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "TpQhWXHbxv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "TpQhWXHbxv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5460"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5620)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3Mz9DqNZ9c",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5620"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "3Mz9DqNZ9c",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5620"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5710)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "AS8jYuFSnx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "AS8jYuFSnx",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5710"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5990)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3yzx9ycyHB",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5990"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "3yzx9ycyHB",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5990"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -6220)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "P0jxRMaCCy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6220"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "P0jxRMaCCy",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6220"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -6400)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "6nxMDFExY6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "6nxMDFExY6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -7040)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QnrP4KVsLv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7040"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "QnrP4KVsLv",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7040"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -7310)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8xHUppnHU7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7310"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "8xHUppnHU7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7310"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -7520)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5jr1uhh7s1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7520"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "5jr1uhh7s1",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-7520"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -8220)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ejC3N0wDdT",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8220"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "ejC3N0wDdT",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8220"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -9170)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "uBsAWS4HrW",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9170"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimun"],
:event_types => [ @earth ],
:region => @global,
:slug => "uBsAWS4HrW",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-9170"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
