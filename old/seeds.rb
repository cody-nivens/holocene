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
#@arthur_timeline = Timeline.create({:name => "Arthur & Second Plague",:description => "Events from 500 to 601 AD.", :user_id => @user.id})
@biblical_timeline = Timeline.create({:name => "Bible Events",:description => "Biblical Events.", :user_id => @user.id})
#@crisis_3rd_century_timeline = Timeline.create({:name => "Crisis of the 3rd century",:description => "Events in the 3rd century relating to Rome.", :user_id => @user.id})
@cultural_timeline = Timeline.create({:name => "Cultural",:description => "Cultural Events.", :user_id => @user.id})
@climate_timeline = Timeline.create({:name => "Climate",:description => "Climate Events.", :user_id => @user.id})
@first_plague_timeline = Timeline.create({:name => "First Plague",:description => "Events surrounding the first appearence of the Bubonic Plague.", :user_id => @user.id})
#@little_ice_age_timeline = Timeline.create({:name => "Little Ice Age",:description => "Little Ice Age related events.", :user_id => @user.id})
@timeline_timeline = Timeline.create({:name => "Earth Events Timeline",:description => "Earth related events.", :user_id => @user.id})
#@babylon_flood_timeline = Timeline.create({:name => "Babylon flood",:description => "Events related to floods.", :user_id => @user.id})
@global_winter_timeline = Timeline.create({:name => "Global Winter",:description => "Global winter events.", :user_id => @user.id})
@climate_factors_timeline = Timeline.create({:name => "Climate Factors",:description => "Factors affecting climate.", :user_id => @user.id})
@bronze_age_timeline = Timeline.create({:name => "Broze Age Collapse",:description => "Factors affecting the collapse of the late Bronze age.", :user_id => @user.id})
@santorini_timeline = Timeline.create({:name => "Santorini Eruption 1,628 BC",:description => "Factors affecting the collapse of the late Bronze age.", :user_id => @user.id})
@inconvient_dates_timeline = Timeline.create({:name => "Inconvient Dates",:description => "People with lenthly lives and how their dates are calulated.", :user_id => @user.id})
@sodom_timeline = Timeline.create({:name => "Sodom & Gomorrah",:description => "Factors affecting the descruction of Sodom and Gomorrah.", :user_id => @user.id})
@watchers_timeline = Timeline.create({:name => "Watchers",:description => "The people who watch the sky.", :user_id => @user.id})
@stone_uni_timeline = Timeline.create({:name => "University in Stone",:description => "The people who study the sky and other things.", :user_id => @user.id})
@noah_flood_timeline = Timeline.create({:name => "Noah's Flood",:description => "Events surrounding Noah's Flood.", :user_id => @user.id})
@introduction_timeline = Timeline.create({:name => "Introduction",:description => "Events used to explain introductory concepts.", :user_id => @user.id})
@enoch_timeline = Timeline.create({:name => "Enoch",:description => "Events used to explain the Enoch events.", :user_id => @user.id})
@holocene_impact_timeline = Timeline.create({:name => "Holocene Impact Event",:description => "Events used to explain the Holocene Impact Event.", :user_id => @user.id})
@drought_timeline = Timeline.create({:name => "Drought",:description => "Events relating to the 4.2 Kiloyear Event.", :user_id => @user.id})
@volcanoes_impacts_timeline = Timeline.create({:name => "Volcanoes/Impacts",:description => "Volcanoes and Impact Events which may have impacted global climate.", :user_id => @user.id})


@book = Book.create(:name => "Skywatch: 10,000 BC", :sub_name => "Science and Religion from the Sky", :copyright => "2020", :publisher=> "Cody Nivens", :show_events => false,  :user_id => @user.id)
@author = Author.create(first_name: "Cody", last_name: "Nivens", user_id: @user.id)
@book.authors << @author

chapter_index = 0
result = Biblioentry.create({:name => "The Dawning Moon of the Mind: Unlocking the Pyramid Texts",
  :xreflabel => "morrow2015",
  :copyright_year => "2015",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => " Farrar, Straus and Giroux"
})
debugger if result.errors.count > 0
[{:firstname=>"Susan Brind", :surname=>"Morrow"}].each do |name_info|
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
result = Biblioentry.create({:name => "Holocene Settlement of the Egyptian Sahara",
  :xreflabel => "wendorf_schild2001",
  :copyright_year => "2001",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Springer, Boston, MA"
})
debugger if result.errors.count > 0
[{:firstname=>"Fred", :surname=>"Wendorf"}, {:firstname=>"Romuald", :surname=>"Schild"}].each do |name_info|
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
result = Biblioentry.create({:name => "Famine and Pestilence in the Late Roman and Early Byzantine Empire. A Systematic Survey of Subsistence Crises and Epidemics",
  :xreflabel => "stathakopoulos2004",
  :copyright_year => "2004",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Birmingham Byzantine and Otto­man Monographs 9, Aldershot 2004;  (edited with G. Saint-Guillain)"
})
debugger if result.errors.count > 0
[{:firstname=>"Dionysios", :surname=>"Stathakopoulos"}].each do |name_info|
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
result = Biblioentry.create({:name => "In the wake of the Plague: The Black Death &amp; the world it made",
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
result = Biblioentry.create({:name => "Volcano Weather: the story of 1816, the year without a summer",
  :xreflabel => "stommel1983",
  :copyright_year => "1983",
  :copyright_holder => "Seven Seas Press, Inc",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Henry", :surname=>"Stommel"}, {:firstname=>"Elizabeth", :surname=>"Stommel"}].each do |name_info|
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
result = Biblioentry.create({:name => "Black Genesis",
  :xreflabel => "bauval2011",
  :copyright_year => "2011",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Bear and Company"
})
debugger if result.errors.count > 0
[{:firstname=>"Robert", :surname=>"Bauval"}, {:firstname=>"Thomas", :surname=>"Brophy"}].each do |name_info|
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
result = Biblioentry.create({:name => "The Book of Enoch",
  :xreflabel => "lumpkin2011",
  :copyright_year => "2011",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Fifth Estate Publisher"
})
debugger if result.errors.count > 0
[{:firstname=>"Joseph", :surname=>"Lumpkin"}].each do |name_info|
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
result = Biblioentry.create({:name => "The Book of Giants",
  :xreflabel => "lumpkin2014",
  :copyright_year => "2014",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Fifth Estate"
})
debugger if result.errors.count > 0
[{:firstname=>"Joseph", :surname=>"Lumpkin"}].each do |name_info|
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
result = Biblioentry.create({:name => "Footfall",
  :xreflabel => "niven1985",
  :copyright_year => "1985",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Ballantine Books"
})
debugger if result.errors.count > 0
[{:firstname=>"Larry", :surname=>"Niven"}, {:firstname=>"Jerry", :surname=>"Pournelle"}].each do |name_info|
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
result = Biblioentry.create({:name => "Judgement of the Nephilim",
  :xreflabel => "pitterson2017",
  :copyright_year => "2017",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Days of Noe Publishing"
})
debugger if result.errors.count > 0
[{:firstname=>"Ryan", :surname=>"Pitterson"}].each do |name_info|
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
result = Biblioentry.create({:name => "ESV Bible",
  :xreflabel => "bible",
  :copyright_year => "2007",
  :copyright_holder => "",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => "Crossways Bibles"
})
debugger if result.errors.count > 0
[{:firstname=>"Various", :surname=>"Authors"}].each do |name_info|
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
result = Biblioentry.create({:name => "The abrupt climate change near 4,400 yr BP on the cultural transition in Yuchisi, China and its global linkage",
  :xreflabel => "",
  :releaseinfo => "<a href='https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4901284/'>The abrupt climate change near 4,400 yr BP on the cultural transition in Yuchisi, China and its global linkage</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Jianjun", :surname=>"Wang"}, {:firstname=>"Liguang", :surname=>"Sun"}, {:firstname=>"Liqi", :surname=>"Chen"}, {:firstname=>"Libin", :surname=>"Xu"}, {:firstname=>"Yuhong", :surname=>"Wang"}, {:firstname=>"Xinming", :surname=>"Wang"}].each do |name_info|
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
result = Biblioentry.create({:name => "Orion Correlation Theory",
  :xreflabel => "orioncor",
  :releaseinfo => "<a href='https://en.wikipedia.org/wiki/Orion_correlation_theory'>Orion Correlation Theory</a>",
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
result = Biblioentry.create({:name => "Introductory Astronomy: Stonehenge",
  :xreflabel => "stonehengeastronomy",
  :releaseinfo => "<a href='http://astro.wsu.edu/worthey/astro/html/im-lab/stonehenge/stonehenge.html'></a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Guy", :surname=>"Worthey"}].each do |name_info|
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
[{:firstname=>"Richard B.", :surname=>"Stothers"}].each do |name_info|
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
  :releaseinfo => "<a href='http://volcano.si.edu/list_volcano_holocene.cfm'>Global Volcanism Program: Large Holocene Eruptions</a>",
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
[{:firstname=>"Andreas", :surname=>"Vött"}].each do |name_info|
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
result = Biblioentry.create({:name => "Late Neolithic megalithic structures at Nabta Playa (Sahara), southwestern Egypt.",
  :xreflabel => "wendrofsaa98",
  :releaseinfo => "<a href='https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html'>Late Neolithic megalithic structures at Nabta Playa (Sahara), southwestern Egypt.</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Fred", :surname=>"Wendorf"}].each do |name_info|
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
result = Biblioentry.create({:name => "DECODING GÖBEKLI TEPE WITH ARCHAEOASTRONOMY: WHAT DOES THE FOX SAY?",
  :xreflabel => "foxsay",
  :releaseinfo => "<a href='http://maajournal.com/Issues/2017/Vol17-1/Sweatman%20and%20Tsikritsis%2017%281%29.pdf'>DECODING GÖBEKLI TEPE WITH ARCHAEOASTRONOMY: WHAT DOES THE FOX SAY?</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Martin B.", :surname=>"Sweatman"}, {:firstname=>"Dimitrios", :surname=>"Tsikritsis"}].each do |name_info|
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
result = Biblioentry.create({:name => "SATELLITE IMAGERY MEASURES OF THE ASTRONOMICALLY ALIGNED MEGALITHS AT NABTA PLAYA ",
  :xreflabel => "nabtaplayagps",
  :releaseinfo => "<a href='https://web.archive.org/web/20080229170244/http://www.rhodes.aegean.gr/maa_journal/issues/past%20issues/volume%205%20no1%20june%202005/brophy.pdf'>SATELLITE IMAGERY MEASURES OF THE ASTRONOMICALLY ALIGNED MEGALITHS AT NABTA PLAYA</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"THOMAS G.", :surname=>"BROPHY"}, {:firstname=>"PAUL A.", :surname=>"ROSEN"}].each do |name_info|
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
result = Biblioentry.create({:name => "The role of cult and feasting in the emergence of Neolithic communities.  New evidence from Gobekli Tepe, south-eastern Turkey",
  :xreflabel => "gobeklicult",
  :releaseinfo => "<a href='https://www.cambridge.org/core/services/aop-cambridge-core/content/view/A1AA4FB20657599F859860D94CCD090E/S0003598X00047840a.pdf/role_of_cult_and_feasting_in_the_emergence_of_neolithic_communities_new_evidence_from_gobekli_tepe_southeastern_turkey.pdf'>The role of cult and feasting in the emergence of Neolithic communities.  New evidence from Gobekli Tepe, south-eastern Turkey</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Oliver", :surname=>"Dietrich"}, {:firstname=>"Manfred", :surname=>"Heun"}, {:firstname=>"Jens", :surname=>"Notroff"}, {:firstname=>"Klaus", :surname=>"Schmidt"}, {:firstname=>"Martin", :surname=>"Zarnkow"}].each do |name_info|
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
result = Biblioentry.create({:name => "Correlation of the Late Pleistocene Usselo Horizon (Europe) and the Clovis Layer (North America)",
  :xreflabel => "usselo2007",
  :releaseinfo => "<a href='https://ui.adsabs.harvard.edu/abs/2007AGUSMPP43A..02K/abstract'>Correlation of the Late Pleistocene Usselo Horizon (Europe) and the Clovis Layer (North America)</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"J. B.", :surname=>"Kloosterman"}].each do |name_info|
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
result = Biblioentry.create({:name => "THE SUMERIAN K8538 TABLET",
  :xreflabel => "k8538",
  :copyright_year => "2014",
  :copyright_holder => "",
  :releaseinfo => "<a href='https://www.knowledgeminer.eu/climate/pdf/Sumerian_K8538_Paper.pdf'>THE SUMERIAN K8538 TABLET
THE GREAT METEOR IMPACT DEVASTATING MESOPOTAMIA</a>",
  :user_id => @user.id,
  :book_id => @book.id,
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"JOACHIM", :surname=>"SEIFERT"}, {:firstname=>"FRANK", :surname=>"LEMKE"}].each do |name_info|
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
term = GlossaryTerm.where("name = ? or term = ?","Zep Tepi","Zep Tepi").find_or_create_by({name: "Zep Tepi",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "The Egyptian creation myth.  Zep Tepi is translated as 'the first occasion'.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","menhir","menhir").find_or_create_by({name: "menhir",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "A large upright stone which has been manipulated my mankind.     ",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
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
term = GlossaryTerm.where("name = ? or term = ?","Aridification","Aridification").find_or_create_by({name: "Aridification",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "The process of a region becoming increasingly arid, or dry. It refers to long term change, rather than seasonal variation.",
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
  :body => "Eruptions of size 6 or greater.",
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
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Archaeoastronomy","Archaeoastronomy").find_or_create_by({name: "Archaeoastronomy",
  :book => @book,
  :user => @user,
  :term => "",
  :body => "The study of archaeological sites and their relation to the sky.",
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
  :body => "A numeric value denoting how large a volcanic explosion is compared to other explosions.  Indexes greater than 5 affect the global climate.",
  :user => @user
})
term = GlossaryTerm.where("name = ? or term = ?","Volcanic Explosion Index","Volcanic Explosion Index").find_or_create_by({name: "Volcanic Explosion Index",
  :book => @book,
  :user => @user,
  :term => "vei",
  :body => "A numeric value denoting how large a volcanic explosion is compared to other explosions.  Indexes greater than 5 affect the global climate.",
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
  :body => "Spread by lice.  Rodents have lice which carry typhus. When the rodent is in close quarters with people, the disease is spread via the rodent lice turning to humans when the rodents die from the disease. . The rodent lice infect the human lice and the person sickens as a result.",
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
  :body => "A disease caused by Yersinia pestis.  The name Black Death is due to the color of swollen lympth glands called buboes.",
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
  :body => "A violent virus which is transmittable via any contaminated surface.",
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
  :body => "A river in Spain which has a 50 km stretch that is mined for iron ore, gold, silver and heavy metals.  It has been mined since 3000 BC.",
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
  :body => "A climate event in which it is very cold causing the tree to grow very little or not at all.",
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
  :body => ".",
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
  :body => "A climate event of cold which encompasses the entire planet.  No plant growth is observed.",
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
  :body => "A plague of bubonic plague that happened in Eurasia in 1347 to 1351.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Famine","Famine").find_or_create_by({name: "Famine",
  :book => @book,
  :user => @user,
  :term => "Famine",
  :body => "An extreme scarcity of food.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Biblical Event","Biblical Event").find_or_create_by({name: "Biblical Event",
  :book => @book,
  :user => @user,
  :term => "Biblical Event",
  :body => "Any event mentioned in the Bible.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Earth","Earth").find_or_create_by({name: "Earth",
  :book => @book,
  :user => @user,
  :term => "Earth",
  :body => "An event related to Earth processes.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Flood","Flood").find_or_create_by({name: "Flood",
  :book => @book,
  :user => @user,
  :term => "Flood",
  :body => "An overflowing of water beyond its normal confines.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Sea People","Sea People").find_or_create_by({name: "Sea People",
  :book => @book,
  :user => @user,
  :term => "Sea People",
  :body => "Groups of people live and fighting via ships.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","10 Plagues","10 Plagues").find_or_create_by({name: "10 Plagues",
  :book => @book,
  :user => @user,
  :term => "10 Plagues",
  :body => "The 10 Plagues of Egypt.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Epidemic","Epidemic").find_or_create_by({name: "Epidemic",
  :book => @book,
  :user => @user,
  :term => "Epidemic",
  :body => "A widespread occurrence of an infectious disease.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Earthquake","Earthquake").find_or_create_by({name: "Earthquake",
  :book => @book,
  :user => @user,
  :term => "Earthquake",
  :body => "A shaking of the earth which may result in damage.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Eruption","Eruption").find_or_create_by({name: "Eruption",
  :book => @book,
  :user => @user,
  :term => "Eruption",
  :body => "A volcanic eruption measured by the VEI index.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Impact Event","Impact Event").find_or_create_by({name: "Impact Event",
  :book => @book,
  :user => @user,
  :term => "Impact Event",
  :body => "A event where an object from space strikes the earth.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Disease","Disease").find_or_create_by({name: "Disease",
  :book => @book,
  :user => @user,
  :term => "Disease",
  :body => "A virus or bacterium which causes distress or death.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Historical","Historical").find_or_create_by({name: "Historical",
  :book => @book,
  :user => @user,
  :term => "Historical",
  :body => "That which has been written about in the time it happened.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Egypt","Egypt").find_or_create_by({name: "Egypt",
  :book => @book,
  :user => @user,
  :term => "Egypt",
  :body => "The first city-state.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Hittites","Hittites").find_or_create_by({name: "Hittites",
  :book => @book,
  :user => @user,
  :term => "Hittites",
  :body => "An empire in Anatolia who came into conflict with its neighbors.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Sumerian","Sumerian").find_or_create_by({name: "Sumerian",
  :book => @book,
  :user => @user,
  :term => "Sumerian",
  :body => "The second city-state.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Domestication","Domestication").find_or_create_by({name: "Domestication",
  :book => @book,
  :user => @user,
  :term => "Domestication",
  :body => "The process of taking a natural plant or animal and making it suitable for humans.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Tartessos","Tartessos").find_or_create_by({name: "Tartessos",
  :book => @book,
  :user => @user,
  :term => "Tartessos",
  :body => ".",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Atlantis","Atlantis").find_or_create_by({name: "Atlantis",
  :book => @book,
  :user => @user,
  :term => "Atlantis",
  :body => ".",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Magnetic Event","Magnetic Event").find_or_create_by({name: "Magnetic Event",
  :book => @book,
  :user => @user,
  :term => "Magnetic Event",
  :body => "An outburst from the sun which affect magnetic systems.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Tsunami","Tsunami").find_or_create_by({name: "Tsunami",
  :book => @book,
  :user => @user,
  :term => "Tsunami",
  :body => "A large sudden wave at the water edge which travels inland.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","VEI 6","VEI 6").find_or_create_by({name: "VEI 6",
  :book => @book,
  :user => @user,
  :term => "VEI 6",
  :body => "A volcanic explosion which affects the globe if between 30 N and 30 S; otherwise affects the hemisphere where it is located.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Global Volcano","Global Volcano").find_or_create_by({name: "Global Volcano",
  :book => @book,
  :user => @user,
  :term => "Global Volcano",
  :body => ".",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","VEI 7","VEI 7").find_or_create_by({name: "VEI 7",
  :book => @book,
  :user => @user,
  :term => "VEI 7",
  :body => "A volcanic explosion which affects the entire globe.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","VEI 5","VEI 5").find_or_create_by({name: "VEI 5",
  :book => @book,
  :user => @user,
  :term => "VEI 5",
  :body => "A volcanic explosion which may affect local weather.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","VEI 4","VEI 4").find_or_create_by({name: "VEI 4",
  :book => @book,
  :user => @user,
  :term => "VEI 4",
  :body => "A volcanic explosion which is beautiful to watch.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = nil
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","Solar Minimum","Solar Minimum").find_or_create_by({name: "Solar Minimum",
  :book => @book,
  :user => @user,
  :term => "Solar Minimum",
  :body => "When the output from the sun is at a minimum.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
result = Chapter.create({:name => "Preface ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "preface",
:book => @book,
:body => "
<p>My maternal grandmother corralled my one day just before I went off to college.
She expounded to me the history of the Bible and that someday I or someone else would demonstrate it's validity.
In her efforts, she relied on National Geographic's exquisite books which placed the Exodus at 1,200 BC.
As time has progressed, it has been found that if there was an Exodus at 1,200 BC, it was small and not Biblical in nature.
</p><p>
In the years since, I have watched the fate of archaeology as one school and then another demonstrated why or why not biblical events could occur.
Much of these excursions seem to be trying to either ignore reality or at best relabel it as something other than what it is.
In reality, the timing is much older than what archaeologists are willing to allow.
The explosion of Santorini has pushed events back into dates that are inconvenient to Archaeology.
</p><p>
Archaeology and History has issues with things that go boom.
They are inconvenient to explain.
If it happened then there should be some record so if there is no record then it didn't happen.
And if it did happen, it did not affect people or history in any way.
What is missed in these explanations is the affect of catastrophe on the Human Psyche.
PTSD is not a modern affliction.
Noah's use of wine to excess shows that self-medicating due to trauma was present in the Bible and was documented at such.
The generations that survive an event such as the explosion of Santorini need time to recover from the trauma physically, mentally and emotionally.
Such an effort will blur emotions, distort memories and create narratives to explain the destruction in a way as to Glorify their Deities which scapegoating someone for the loss.
</p><p>
I am grateful to those whose work in Archaeology has resulted in the data that is now available for the last 12,000 years.
Gobekli Tepe and the implications of organized labor and advanced astronomical knowledge has had a profound effect of the history of the Human Race.
The discovery of the Younger Dryas Impact Event has provided me with the kernel of what I hope is an interesting story.
</p>
"
})
res = Partition.create({
:name => "Preface",
:body => "My Ancient Ancestors were smarter than your Ancient Aliens.
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Chapter.create({:name => "Introduction ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "introduction",
:book => @book,
:body => "
<p>This book started with the book 'After the Ice' by Steven Mithen.  
During it's reading, I began to look at history in a different way.  
Previously, I had followed the tradition of cultural forces verses population as the main driver of history. 
'After the Ice' presented the idea that the environment's changes and the trail left by various peoples as they have struggled to live and ensure they children's survival influenced the development of civilization.
</p><p>
Brian Fagan's books and their assorted information on climate and its affect on history further informed this concept with data in recorded history.
Patterns in weather and their effects on the history of people became very apparent. 
Yet it was apparent from these books that weather could not explain all the various changes in the development of civilization.
</p><p>
A question formed in my mind as to what caused the breaks in historical development.  
</p><p>
Richard Stothers' work presented the Global Winter pattern by applying to many cases in the last 2,000 years.  
These cases showed a simple elegant solution for these drop-outs of history.  
Other historical periods should also have simple solutions as their causes especially when changes are wide spread.  
A simple bad winter in one region may not affect another.  When it does, then a solution should explain why.
</p><p>
This search has lead me to the Holocene Project's work and its importance to our future as well as its significance to our past.  
While many argue that such events can not happen or happen so infrequently that their significance in history are not relevant, the 2011 earthquake at Fukushima has showed that ignoring the past can have disastrous consequences.  
The nuclear disaster would not have happened if the project proponents had not ignored evidence of tsunamis that were not within written history and instead relied upon written records.  
Past civilizations may not have had the scientific sophistication to recognize what was happening, but they could record it in the limited world view they held.  
Such recording must not be ignored if we are to understand the dynamics of history.
</p><p>
In writing this book, I understand that I run the risk of the wrath of many group.
Many will of course state that I do not have the credentials to present this information.
My experience is in Computer Science, not Geology or History.
</p><p>
Second, various religious communities will not like a possible explanation for the beginnings of the Bible.
My faith does not suffer when archaeology shows that events in the Bible can be dated to an era different from the calculations based on the 'begets'.  
It is not the document that matters, it is the fact that this book's relevance has endured that is the important thing.  
Today many advocate beliefs that differ from what the central figure of their religion believed and stated.  
Yet, they feel that their faith ensured that what they believe and how they behave are okay with their founder because they have a statement of faith that their deity would not let them believe anything that would be inconsistent with the founder's teachings.
Such is not my faith.
</p><p>
Third, Climate deniers will not like the concept that climate can effect history.  
They believe that by ignoring the reality of the world, they can influence it.  
The Bible's admonishment to go forth and multiple can not be hindered by science which is after all evil as reason is the product of the Devil.  
A planet with limited resources does play a part in the Bible.  
Many great events of destruction have been a result of the God's wrath again the raise in population of 'sinful' people.  
The Book of Revelations seems to indicate that such destruction of resources will herald the return of the Christ so such things must be good since the faster we destroy them, the sooner that Christ returns.
With the advent of the Atomic Age, many people fell into the belief that if we destroy the world with the bomb, the Good Lord will return.  
Such a belief that God can be manipulated by our actions is hubris at best.
Christ will return in his own time not at a time set by Man.
</p><p>
Last, there are those who seem to believe that preparing for the possibility that an event can occur which preclude the ability of the government to help its people is either an act of terrorism or one of treason.
Such beliefs are understandable given the actions of a few.
Yet to label all because of such behavior is to limit the ability to recognize the difference between reality, truth and the Truth.  
Such behavior endangers the very government which professes to know what is best for all.
Mormonism despite it past has a prophecy which states that they will be the salvation of America.
Such a believe could be based on the fact that they prepare for the possibility of events outlined in this book.
Such a belief is worthy of faith indeed.
</p>
"
})
res = Partition.create({
:name => "Introduction",
:body => "
<p>Survivalists worry that the government is out to get them.</p>
<p>Preppers worry that the government will not be there when they need it.</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("mithen2003")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("fagan1999")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("fagan2000")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("fagan2004")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("fagan2008")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Chapter.create({:name => "The Holocene Impact Event ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "holocene_impact",
:book => @book,
:body => "
<p>14,800 years ago, Earth started out of the last ice-age.
This warming enabled humans to move north and hunt the megafauna to extinction.
They created hunting camps along the way bringing their family/clan up into Europe, Anatolia and the Middle East.
As time went by various places began to be used as semi-permeate camps.
Some of these camps had wild cereals near-by.
</p><p>
The gathering and processing of these grains into breads around 12,500 BC started the march to agriculture.
It is speculated that the taste of the processed cereals pushed both how they can be used and their cultivation.
</p>
"
})
res = Partition.create({
:name => "Of things that go boom",
:body => "
<p>Of goulies and ghosties<br/>
   and long legged besties<br/>
   and things that go boom in the night,<br/>
   St. Barbara deliver us.
</p>
<p>St. Barbara was born in the mid-third century<br/>
 and is the patron saint of armourers, artillerymen,<br/>
 military engineers, miners and others who work with<br/>
 explosives because of her legend's association with<br/>
 lightning, and also of mathematicians.
</p>
",
:chapter_id => result.id
})
res = Aside.create({
:name => "What Happened!?!",
:body => "
<p>Tog returned the to lands after God Spoke, after the fires.<br/>
Cresting the final rise before the Lands, he expecting to see smoke from the fires of the People.
</p><p>
Instead he found death.<br/>
Vultures far as the eye could see.
</p><p>
The People... Dead. All dead.
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("usselo2007")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "Bølling-Allerød Warming ",
:body => "
<p>A warm period that ran from 12,700 BC to 10,700 BC.
The access to the north and the megafauna probably resulted in an increase in population.
With the extinction of the megafauna, people would have suffered a decrease of population resulting in a return to hunting and gathering.  
Eventually, cereal grains would have been found and various preparations would have been created to take advantage of the cereal's sweet taste.
</p>
<p>By the end of this time frame, bread was being made, beer was just being produced and man's best friend was every hopeful you would drop what you are eating.  
Third of a pizza, a beer and a dog.  All that was missing was a Frisbee.
</p><p>
And then a very bad day happened.<br/>
Well, millennia really.
</p>
",
:slug => "XrwLuNeKBY",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Meltwater Pulse 1A ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Meltwater Pulse 1A ",
:end_year => "-11500",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "tfX1n0WT7Q",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Meltwater Pulse 1A ",
:end_year => "-11500",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "tfX1n0WT7Q",
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
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bread is made ", :start_year => -12500)
if result.length == 0
result = HoloceneEvent.create({:name => "Bread is made ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UC9jHqZefs",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bread is made ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "UC9jHqZefs",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Dog buried inside of human dwelling ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Dog buried inside of human dwelling ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Bv7Kj2hVRm",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dog buried inside of human dwelling ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Bv7Kj2hVRm",
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
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Beer", :start_year => -11000)
if result.length == 0
result = HoloceneEvent.create({:name => "Beer",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3dwUWy0gv5",
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
:event_types => [  ],
:region => @global,
:slug => "3dwUWy0gv5",
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
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bølling-Allerød Warming", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Bølling-Allerød Warming",
:end_year => "-10700",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "VfeKW9feHg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bølling-Allerød Warming",
:end_year => "-10700",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "VfeKW9feHg",
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
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Bølling oscillation", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Bølling oscillation",
:end_year => "-12100",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "GCQ9YkQ5zc",
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
:event_types => [  ],
:region => @global,
:slug => "GCQ9YkQ5zc",
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
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Allerød oscillation", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Allerød oscillation",
:end_year => "-11000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JM5KcVDHpC",
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
:event_types => [  ],
:region => @global,
:slug => "JM5KcVDHpC",
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
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "The Younger Dryas Impact Event ",
:body => "
<p>Around 10,950 BC an object slammed into Earth or exploded just above the surface creating a very bad day for everyone.
This event is now called the Younger Dryas Impact event.
Immediately following the impact, the Younger Dryas climate event happened.
It is called an impact event for several reasons:
</p>
<ul>
<li>The size or number of bodies is unknown.</li>
<li>Until recently, there was no evidence of any crater(s).</li>
<li>The circumstantial evidence is overwhelming.</li>
</ul>
<p>It appears to have shattered in the atmosphere with at least one impact crater created in Greenland.
These impacts were over the North American ice cap as well resulting in tons of ice thrown into the atmosphere.  
</p>
<p>The first major effect of the impact would be boom seeming to come from the North.  
This was followed by a shock wave which blew over parts of North America, Siberia and Northern Europe.  
The shock wave would have killed both people and animals as well as destroy trees and other flora and fauna.
[[hbu27ukVMd]] 
</p>
<p>Additionally, the impact's displacement of ice into the atmosphere would result in the ice crystals reflecting light in the high altitudes.
The resulting light would allow anyone to travel about at night.
The ice would also reflect sunlight back to space resulting in a sudden drop in temperature.
Winter came to the Northern Hemisphere in a geological blink of an eye.
</p>
",
:slug => "86VBQ5JmH4",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "hbu27ukVMd", :body => "usselo2007", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Younger Dryas Impact Event", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas Impact Event",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "eKVP0jLXJ6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas Impact Event",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "eKVP0jLXJ6",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Usselo Horizon ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Usselo Horizon ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Qbm8ur1jFe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Usselo Horizon ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Qbm8ur1jFe",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "The Younger Dryas ",
:body => "
<p>The Clovis Impact Event broke a dam atop the ice pack on the North American continent resulting in a large outpouring of ice cold fresh water into the Ocean.
This in turn shutdown the Thermohaline circulation keeping northern American and Europe warm.
The estimate as to how long it took to stop the circulation is 10 years.
</p><p>
The change was sudden and total.  
Areas of Europe where trees has started to take hold from the start of the Bølling oscillation turned to tundra.
The tundra would last 1,200 years.
</p><p>
The event caused people to move into a more subsistence existence.
Migrations of people from Europe and the northern tundra towards the south would have resulted in a great die off of people as those ahead of them on the trail would have hunted out the food.
They mobilize to follow prey and gather surviving vegetables.
</p>
",
:slug => "fxtp6Kv3JS",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Younger Dryas", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas",
:end_year => "-9700",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "s92udUAfxQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas",
:end_year => "-9700",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "s92udUAfxQ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@holocene_impact_timeline.holocene_events << result unless @holocene_impact_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Skywatch 10,800 BC - The Watchers ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "watchers",
:book => @book,
:body => "
<p>The Tradition of the Watchers was born with the Holocene Impact Event.  
Having seen the object which hit the planet, they were anxious to determine when such an event would occur again.  
</p><p>
Gobekli Tepe stands as testament to their beginnings, determination and purpose.  
There are two things that standout about the existence of Gobekli Tepe:  they could organize a labor force for the purpose of constructing the circles.
Secondly, the builders of Gobekli Tepe has a significant knowledge of the stars and their movements especially procession[[YK4DQ5UdLK]] .
The monuments point to one location in the Sky: where the Taurid meteors originate.
</p><p>
The light from the Younger Dryas Impact Event would have brought to the attention of mankind the animals of the night in a prolonged way. 
This allowed for an understanding based on sight. 
The animals and insects would not have been affected by the night brightness and would have continued their diurnal activities.
Consider that mankind on the plains of the Anatolia region would have had structures which where partially embedded in the earth. 
</p><p>
This was an insulation feature due to the winter cold.
During the Younger Dryas Impact Event illumination, the tops of the structures would have been removed to use the light. 
This would present a view of the sky and the earth around the habitation.
A group remembrance of this would have lead to recreations of such an event with the ribs of the Gobekli Tepe's circular structures, the animals seen and the night sky.
</p>
"
})
res = Aside.create({
:name => "Never Again!",
:body => "
<p>They had walked the Ice Bridge to where the Great Waters poured into the ocean.
There was no way past the Waters, no way to tell what really happened when God Spoke.
</p><p>
They built the circle with the stone columns telling of where in the sky God came from.
They built benches where people could look at the sky and see the Bull.
But it moved over the years and Mor now sat in the twelfth circle.
</p><p>
The group had decided.
They would bury the circles and look for a place to build a new one.
They would remember that God killed so many.
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("foxsay")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("usselo2007")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("gobeklicult")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("k8538")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = nil
Footnote.create(:slug => "YK4DQ5UdLK", :body => "FoxSay", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "The Beginnings ",
:body => "
<p>When the Holocene Event occurred, the was a great deal of death.  
Death of animals and humans.  
Those who had moved into Northern climes, where either directly blasted by the shock wave from the impact, 
burned by the flash fires started by the shock wave[[Lwzv5Agp8y]] 
 or froze as the temperature plummeted.
Such death would have filled the skies with vultures for weeks on end.  
</p>
<p>
Some of those who survived and witnessed the boom, the light display, and the deep chilling cold returned from days past asked why?
So they created Gobekli Tepe to watch for the return of that 'God' who stomped on the World.
But Gobekli Tepe was not a total answer because of the procession of the stars.
Eventually, procession would lead to the abandonment of Gobekli Tepe and the formation of two different groups.  
The first group being those who Watch for God's return.
The second, those who study the stars forming a University in Stone.
</p>
",
:slug => "escXp8xUPC",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "Lwzv5Agp8y", :body => "usselo2007", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Vulture stone at Gobekli Tepe dated by star map ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Vulture stone at Gobekli Tepe dated by star map ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "qC8FeSTbCV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Vulture stone at Gobekli Tepe dated by star map ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "qC8FeSTbCV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level III ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level III ",
:end_year => "-8800",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "nZMRd3D4Ga",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level III ",
:end_year => "-8800",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "nZMRd3D4Ga",
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
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level II ", :start_year => -8800)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "5FdGS5SqSg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "5FdGS5SqSg",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - Beer ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - Beer ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "fggKp2a5wa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - Beer ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "fggKp2a5wa",
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
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Gobekli Tepe - level I ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "y2ZCZaq7DT",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "y2ZCZaq7DT",
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
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "The Spread of Knowledge ",
:body => "
<p>
Who benefited from the work of the Watchers?<br/><br/>
Noah for one.
</p><p>
Tradition says that Noah was warned by a Watcher.
The purpose of the Watch is to detect and warm about another impact that may be like the Younger Dryas Impact.
That there are similar stories around the world is because the experience was the same.
The Watcher detected an object heading towards earth and went down the mountain as it were to warn the righteous.
</p><p>
Egypt benefited directly in the transfer of knowledge on mathematics, astronomy, and stone working.
That Egypt so quickly went from the hunter gathers along the Nile to building mastabas.
Additionally, much of the Cow cult worship at Nabta Playa seems to have translated into Egyptian society in the form of a God worship.
</p><p>
Stonehenge has become a World Heritage Site and represents the pinnacle of ancient people.
It is the ultimate expression of the work of the Watchers and the Stone university.
It demonstrates the rising and setting suns at the equinoxes and solstices as well as the northern and southern most moon rise and set.
</p><p>
Eventually, the results of the Watchers is the body of mathematical knowledge passed to the public via the Greek mathematicians.
Evidence of their work can be seen in the Sumerian Star Map, the Egyptian mathematical papyri and the Babylonian table describing a rudimentary form of integral calculus.
</p><p>
Perhaps the most interesting thing that has been found relating to astronomy is the K8538[[KnQamgwbBD]]  tablet found in Nineveh at the library of King Ashurbanipal.
The tablet is dated to around 650 BC based on the style of written Babylonian cuneiform.
It has taken about 150 years to decode as it has been described as the most unique Babylonian documents.
The tablet describes the approach of a comet over 21 day period up to and including the impact creating Umm al Binni.
As we will see the chapter on Drought, it caused the creation of Umm al Binni and the 4.2 kiloyear event resulting in 300 years of cold and drought.
</p>
",
:slug => "FpJ1cDvCwG",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "KnQamgwbBD", :body => "K8538", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "K8538 - Sumerian Star Map ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "vNUPczaRUY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "vNUPczaRUY",
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
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Babylonian Table describing rudimentary form of integral calculus ", :start_year => -350)
if result.length == 0
result = HoloceneEvent.create({:name => "Babylonian Table describing rudimentary form of integral calculus ",
:end_year => "-50",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "4M57aswWje",
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
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "4M57aswWje",
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
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Moscow Mathematical Papyrus ", :start_year => -1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Moscow Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "vAsE4cKFHe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1850"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Moscow Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "vAsE4cKFHe",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1850"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Rhind Mathematical Papyrus ", :start_year => -1542)
if result.length == 0
result = HoloceneEvent.create({:name => "Rhind Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "vNF0NgrF79",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1542"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rhind Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "vNF0NgrF79",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1542"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Lahun Mathematical Papyri ", :start_year => -1825)
if result.length == 0
result = HoloceneEvent.create({:name => "Lahun Mathematical Papyri ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "G6RPrYmDJx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1825"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lahun Mathematical Papyri ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "G6RPrYmDJx",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1825"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Egyptian Mathematical Leather Roll ", :start_year => -1650)
if result.length == 0
result = HoloceneEvent.create({:name => "Egyptian Mathematical Leather Roll ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "TSLT6NX2Hd",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Egyptian Mathematical Leather Roll ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "TSLT6NX2Hd",
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
@watchers_timeline.holocene_events << result unless @watchers_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "University in Stone ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "stone_uni",
:book => @book,
:body => "
<p>Essentially, the Watcher tradition and their use of megaliths was a university in stone.  
The stones detailed the position of stars that are then compared to the present show the progression of the stars.
</p>
<p>With the burial of Gobekli Tepe, those who built the monument looked around for a suitable place for the next set off stone observatories.  
One group went to Stonehenge in England and did a test sighting of something.  
They did not find what they were looking for yet another group that had discovered Nabta Playa, Egypt did find that object in the sky and they moved their observation there.
</p>
<p>The move happened in two parts.
First, the people who would eventually build Stonehenge moved from the Aegean Sea area to England via the Northern Mediterranean and Spain.
When or if they arrived in what is now Almendres, Portugal is a major question.  
The Almendres Cromlech seems to be along the lines of the efforts being done at Nabta Playa, Egypt.
</p>
<p>The second factor was the move of people from Nabta Playa, Egypt to England and what route did they take.
Most likely, they move down the Nile to the delta. 
Then across the coast of North Africa to the Atlantic, crossing at Gibraltar, Spain.
The final stage would be through Spain and/or Portugal to see the Cromlech at Almendres.
</p>
<p>Alternatively, they could have gone via the Levant into Greece where the constructors of Stonehenge have migrated.
They would have left knowledge and children behind in their migration.
</p>
"
})
res = Aside.create({
:name => "At last!",
:body => "
<p>
When he was 10, Jo's father had a visitor who asked questions about what Jo had learn from Nor, the oldest person in the group.
Jo recited named of plants and how to plant and cook them; herbs and how they help, how to prepare then and how to know what is too much.
</p><p>
When he was twelve, the man returned with another and Jo's father told him that they were going to take him to a school where he would learn about the stars.
So they started walking down out of the mountains, through many villages, towns and other places of humans.
</p>
<p>Jo had walked for the last 18 months to arrive here.
He crested the dunes and saw the bowl that encompasses Nabta Playa.
From where he stood, he could see the smoke of the fires, the megaliths, and somewhere was the calendar.
</p><p>
School at last.
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("nabtaplayagps")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("wendrofsaa98")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("wendorf_schild2001")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("bauval2011")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("foxsay")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("gobeklicult")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("stonehengeastronomy")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("rosen2007")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("orioncor")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "Orion - the Mark of a Belt ",
:body => "
<p>
One of the issues that the Ancient astronomers had was how do you tell the future that something happened.  
At Gobekli Tepe, the vulture stone serves that purpose.
However, carving a stone each time something happens is impractical. 
Indeed, the stone carvings at Gobekli Tepe show the degradation of craft between the Vulture stone and subsequent circles.
The selection of Orion's Belt as marker in time was based on their observations of the fact that the stars in the belt do not vary overtime.
</p><p>
Orion served as a marker.
The relative distance and degrees of separation are stable over time.
This makes it ideal for a time marker.
By placing markers marking the position of the three stars of the belt at say the summer solstice, we leave a time mark that says 'We were here then'.
Using multiple markers, we can show the progression of the stars.
</p><p>
The Orion Correlation Theory as put forth by Robert Bauval[[33xTvxWVEB]]  puts the construction of the Great Pyramids at about 10,500 BC.
His argument is that the pyramids are aligned to Orion's belt as it appeared in the sky around 10,500 BC. 
Knowing that they Vulture stone at Gobekli Tepe gives a date around 10,950 BC lends credence to Bauval's theory.
</p><p>
Accepting the 10,500 BC date can be explained by the concept that the engineers who built the Pyramids purposely aligned them to that date.
This is consistent with the concept that the last group of people from Nabta Playa moved into Egypt bringing their expertise in mathematics, engineering, astronomy and stone work to the Egyptian culture.
It is argued by the Ancient Aliens people that the advancement of the Egyptian society to pyramid building in a short period of time can be explained by the integration of the Nabta Playa refugees into main stream Egyptian culture.
</p><p>
Additionally, the second part of the Orion Correlation Theory that of the building and orientation of the Sphinx to the Leo constellation.
Again it is possible to assume that the orientation is correct if we look at who build the Sphinx and when.
If it were constructed by the group from Nabta Playa, then we can assume that they chose the orientation due to a specific reason.
And the orientation as with the pyramids did not related to when it was built.
The part of the Orion Correlation Theory on the water damage of the sphinx dating it to far in the past will be examined in the chapter on Noah's Flood.
</p>
",
:slug => "KSUfb4q650",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "33xTvxWVEB", :body => "OrionCor", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Section.create({:name => "Nabta Playa, Egypt - Stones in the Sand ",
:body => "
<p>Nabta Playa would play an essential role in advancing the understanding of Astronomy.
The arrangements of the stone show astronomical objects at certain times in the past.
By comparing the locations of each set of stone, an approximate calculation could be made on how long the progression cycle would take.
</p><p>
An example of the influence of the Holocene Impact Event is that there exists a set of structure at Nabta Playa that have 
oval structures on the surface setting on buried sculpted bedrock and cow sculpture.
One researcher believed that pits were dug out sometimes up to 5 meters(16 feet) in diameter and at least 3.5 meters(11 feet) deep.
The underlying bedrock was smoothed and then partially buried.
The cow sculpture was then added and the pit filled to the surrounding surface level.
Finally, an oval of megaliths were placed over the filled in pit.
</p><p>
Brophy[[D794GMvCWT]]  points out that given the dating of the organic materials in the sand is between 6,400 BC and 5,000 BC indicating that the CSA (Complex Structure A) was built before the sand covered.
The complex structures seem to be a recreation of the structures created at Gobekli Tepe.
The enclosures in the bedrock describes the circular structure created to hold the various items used at Gobekli Tepe, 
the Taurus star cluster being watched (cow sculpture) and stone flood and seats (smoothed bedrock).
A degradation of the story of the creation and purpose of Gobekli Tepe.
</p><p>
The alignment of the megaliths dating to 6,270 BC seem to indicate an understanding of the relationship between what is seen in the sky (comets) and droughts.
The 6,270 BC dating being consistent with the 8.2K Event which caused between 2 to 4 centuries of drought.
The megaliths align to the CSA from several directions.
After the drought when people returned to Nabta Playa, the megaliths were used to find the original work at the site now called Complex Structure A.
Finding that sand had covered the structures, the people created outlines about them to indicate their position.
</p><p>
Nabta Playa worked perfectly for at least 3,000 years.  
However, water started disappearing with the Bond 4/5.9 Kiloyear Event and it had to be abandoned around 3,600 BC.  
The observatory moved to Stonehenge as the area had been cleared of trees and looks like it does today.
</p>
",
:slug => "EVVyQMmtnU",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "D794GMvCWT", :body => "nabtaplayagps", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Beginning occupation ", :start_year => -10000)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Beginning occupation ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "gXvbARJMk9",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Beginning occupation ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "gXvbARJMk9",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Large scale occupation ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Large scale occupation ",
:end_year => "-7000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mdAhGMTRQX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Large scale occupation ",
:end_year => "-7000",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "mdAhGMTRQX",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Potter being made ", :start_year => -6800)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Potter being made ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "B1rZfm0aPU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Potter being made ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "B1rZfm0aPU",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Alignment of belt stones to Orion  ", :start_year => -6400)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Alignment of belt stones to Orion  ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "qUxnQYALRC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Alignment of belt stones to Orion  ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "qUxnQYALRC",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
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
:slug => "bpCgRtXH84",
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
:slug => "bpCgRtXH84",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Alignment of megalithic stones ", :start_year => -6270)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Alignment of megalithic stones ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "MvcVdgvnqP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6270"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Alignment of megalithic stones ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "MvcVdgvnqP",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6270"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Sheep and Goats Introduced ", :start_year => -6100)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Sheep and Goats Introduced ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ubpWdMegQA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Sheep and Goats Introduced ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ubpWdMegQA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Drought causes change of Occupants ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Drought causes change of Occupants ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "bVqxs8ZEeZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Drought causes change of Occupants ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "bVqxs8ZEeZ",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Construction of stone calendar ", :start_year => -4800)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Construction of stone calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Hhd5WJDDFk",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Construction of stone calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Hhd5WJDDFk",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Megalith period  ", :start_year => -3600)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Megalith period  ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xq6HcKFT1e",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Megalith period  ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xq6HcKFT1e",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
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
:slug => "rT5Qz8be9j",
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
:slug => "rT5Qz8be9j",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Almendres, Portugal - Monolith Marking Pins ",
:body => "
<p>The small size, round tops and shaped like a map marker.
The 'pins' were moved many times forming the present arrangement.
An isolated menhir aligns the circle with the winter solstice.
</p><p>
One of the question I have about this site is who created it.
The use of the stone 'marking pins' as a means of exploring the connections between the moon and the sun was brilliant.
Stone being permanent requires a great deal of thought about how to arrange them.
Almendres Cromlech's use of the marking pins allowed for ideas to be developed and changed made to see if the idea is correct.
</p>
",
:slug => "xzbMXcQSc7",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Almendres Cromlech I ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Almendres Cromlech I ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "9uXGxCFzWN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Almendres Cromlech I ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "9uXGxCFzWN",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Almendres Cromlech II ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Almendres Cromlech II ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "J5sxFWUMm9",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Almendres Cromlech II ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "J5sxFWUMm9",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Almendres Cromlech III ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Almendres Cromlech III ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZrU0RAWvkX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Almendres Cromlech III ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ZrU0RAWvkX",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Stonehenge, England - the Queen of Stone ",
:body => "
<p>No other stone circle has as many features for measuring astronomical events.
</p><p>
At Stonehenge, there were several things going on.  
First was the use of trees to teach movements of the stars and sun.  
Woodhenge is such a creation.  
But it uncovered the problem with using timber - it rots.
</p><p>
Using stone, they created the Cursus which from the point of view of the eventual monument is a grid against which the night sky can be measured.
At either end of the Cursus, holes denoting the sunrise and sunset at the summer solstice were found.
The Cursus also aligns with the equinox sunrise.
</p><p>
Stonehenge's construction faced many challenges the least of which was the transportation of the stones to the site.
The builders being the same group some 4 to 5 millennia after the construction of Gobekli Tepe still had both the astronomical knowledge as well as the organized labor force.
The Bell Beaker peoples who supplemented the people at Stonehenge when they arrived in England assumed some of the attributes of the builders. 
But as the changes in the bluestones shows the did not truly know what they were doing.
Stonehenge 3 III saw the replacement of the bluestones after they have been removed from the circle.
That they were eventually replaced, moved and then redressed to fit suggests that they understanding of astronomy was beginning to rise in the Bell Beaker culture.
</p><p>
Work on Stonehenge stopped when the plague hit England something after its arrival in the Middle East at Jerico.
The plague being a non-discriminator disease most likely decimated the population in England.
Its effects on the peoples of Europe has been documented in gene studies of the survivors.
</p>
",
:slug => "TQxtc2zyMQ",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Bell Beaker people replace builders of Stonehenge ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Bell Beaker people replace builders of Stonehenge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "76ZXy58ZUZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bell Beaker people replace builders of Stonehenge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "76ZXy58ZUZ",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Builders of Stonehenge migrate to England ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Builders of Stonehenge migrate to England ",
:end_year => "-4000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "NjvAX262tX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Builders of Stonehenge migrate to England ",
:end_year => "-4000",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "NjvAX262tX",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge before the monument ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge before the monument ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "WXPV33kfYX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge before the monument ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "WXPV33kfYX",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 1 ", :start_year => -3100)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 1 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "GH8ABvz4wH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 1 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "GH8ABvz4wH",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 2 ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "bhaCBWGyCV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 2 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "bhaCBWGyCV",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 I ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 I ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Vty6TrpuEu",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 I ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Vty6TrpuEu",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 II ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 II ",
:end_year => "-2400",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "6DGpmgu4KZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 II ",
:end_year => "-2400",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "6DGpmgu4KZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Woodhenge created ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Woodhenge created ",
:end_year => "-2400",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "BBcFJ4bnhM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Woodhenge created ",
:end_year => "-2400",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "BBcFJ4bnhM",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wood circle created at Durrington Walls ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Wood circle created at Durrington Walls ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "9agH1DheAe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wood circle created at Durrington Walls ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "9agH1DheAe",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 III ", :start_year => -2400)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 III ",
:end_year => "-2280",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pdFLqQudmm",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 III ",
:end_year => "-2280",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "pdFLqQudmm",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 IV ", :start_year => -2280)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 IV ",
:end_year => "-1930",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "NjF2b3VUWx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2280"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 IV ",
:end_year => "-1930",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "NjF2b3VUWx",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2280"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge 3 V ", :start_year => -1930)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 V ",
:end_year => "-1600",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "3mR9HLmCaA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 V ",
:end_year => "-1600",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "3mR9HLmCaA",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1930"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Stonehenge - Post construction ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge - Post construction ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "qCW0Bh4V19",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge - Post construction ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "qCW0Bh4V19",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Additional Efforts ",
:body => "
<p>These are areas of the world were calendaring and astronomy were done.
Warren Field for example started as a Lunar calendar and eventually a solar component was added to align the Sun-Moon calendars with the Midwinter Solstice.
Goseck Circle show evidence of use as a solar calendar denoting the solstices.
</p>
<p>The Sumerian Star Map and the Babylonian table denote a sophisticated level of understand of the need for records and the need to continue to translate the libraries associated with Babylon and Sumeria.
</p>
",
:slug => "8wcsTmJUBx",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Kokino ", :start_year => -1800)
if result.length == 0
result = HoloceneEvent.create({:name => "Kokino ",
:end_year => "-600",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "vjaJCK1vux",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kokino ",
:end_year => "-600",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "vjaJCK1vux",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Goloring ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Goloring ",
:end_year => "-800",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "aPC2xALmaV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Goloring ",
:end_year => "-800",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "aPC2xALmaV",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Warren Field - oldest calendar ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Warren Field - oldest calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "yW8ZG7EFRV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Warren Field - oldest calendar ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "yW8ZG7EFRV",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Zorats Karer(Carahunge) ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Zorats Karer(Carahunge) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "QzqNpPYmfE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zorats Karer(Carahunge) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "QzqNpPYmfE",
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
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Goseck Circle ", :start_year => -4900)
if result.length == 0
result = HoloceneEvent.create({:name => "Goseck Circle ",
:end_year => "-4700",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xR1ZKsyuYt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Goseck Circle ",
:end_year => "-4700",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xR1ZKsyuYt",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4900"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@stone_uni_timeline.holocene_events << result unless @stone_uni_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Genesis ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "biblical",
:book => @book,
:body => "
<p>The Younger Dryas Impact did more to mankind that start them on the path of science and learning.
It started Mankind on the road to monotheism.
The impact was done by one God and his is jealous.
</p><p>
Some group of people started a epic chronicle which we now call the Book of Genesis.
As the Earth's climate evolved, the major changes that happened are recorded as a 'Day'.
</p><p>
Each 'Day' is explainable by events during certain times in the past.
The sequence that they follow is a logical sequence when viewed in the light of climate change.
</p>
"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("bible")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "Day 1 Let there be Light ",
:body => "
<p>
One of the things that fascinated me about the Tunguska blast was the report of the bright sky at night in London allowed reading the newspaper.
An effect after the event that lasted 9 days.
This luminous effects is a result of ice crystals in the atmosphere and it is believed that it was similar to the display caused by the reentry of the space shuttle.
A similar effect on an significantly larger scale would have occurred at the Younger Dryas impact.
</p>
<p>
God spoke (the noise of the impact), and there was Light (the luminescent display by ice particles over the northern hemisphere).
</p>
<p>
Simplistic explanation?
Perhaps, but consider that Mankind at that time was dispersed over a large area of the globe.
Such an event  would be known by by those in the Eurasian continent with awe as a supernatural event.
Unlike the peoples of the new world for which the event was catastrophe, most of the Old world was awed into the beginnings of awareness of a single Creator of events.
</p>
",
:slug => "PmuXEs21JY",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Day 1 Let there be Light ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Day 1 Let there be Light ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "vHQkmvGCuX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Day 1 Let there be Light ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @global,
:slug => "vHQkmvGCuX",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Younger Dryas Impact Event ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "p9JXB9gy57",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "p9JXB9gy57",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@biblical_timeline.holocene_events << result unless @biblical_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Day 2 Dividing the Waters ",
:body => "
<p>
The end of the Younger Dryas started the thawing of the ice across the contents of world.
This would especially affect anyone living on the plains around the Euxine Sea (ancient Black Sea).
Moulins would release random amounts of water at random times of the warm season (summer).  
Such conditions are not conducive to any activities.
Hunting be based on following herds as they transverse the tundra below the ice fields as the retreat north.
</p>
<p>
During such a period of sudden flooding, the question of where is the normal flow of water coming from would be a primary need.
Rivers would swell with sudden influxes of water and streams that seem to have a permanence would disappear as the ice moves north.
By the end of the period most major rivers had formed.
Their wandering over their ancient beds would continue, but their jumping over vast areas would have subsided.
</p>
",
:slug => "66d6bgaFg4",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "PLbwc10DeT",
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
:slug => "PLbwc10DeT",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "WXyJamFnMm",
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
:slug => "WXyJamFnMm",
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
:body => "
<p>
During the thawing of the great ice sheets over the Eurasian continent, flooding was a constant feature along a wide area.
Any area below an ice field would have been subject to flash floods when a drain hole opens from a surface lake on the ice.
</p>
<p>
This constant flooding made life difficult for more than just man.
Plants and nesting animals would have little change of survival in such floods.
Humans adapted by either retreating to the hills above such flood areas or fortified their towns with stone towers to act as a water break allowing the flood waters to go around a town.
Jericho had such a stone tower giving the community the shape of a foot.
Part of the ancient traditions in Judaism refer to worship of the 'foot' similar structures that acquired a purely religious function when the flooding finally subsided.
</p>
<p>
This Day's end effect was the creation of the herbs, grasses and fruit trees.
Plants could finally establish permanent residence on the plains and mankind began planting grains.
</p>
",
:slug => "EvPsHZsgfk",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "mdp6VZ2p9k",
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
:slug => "mdp6VZ2p9k",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "8Jb3mM0vrj",
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
:slug => "8Jb3mM0vrj",
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
:body => "
<p>
Volcanic explosions rendered much of the 8th millennia with darken skies and subsequently cold temperatures.
It is difficult to imagine a 1,000 years of darken skies, but the research on the Little Ice Age shows that isolated eruptions of volcanoes can accumulatively affect the globe.
The expression 'Lights in the Firmament' comes from the moon, planets and stars shining through the dust in the atmosphere.
</p>
",
:slug => "jJysJe7VBb",
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
:slug => "Pd2HptuABd",
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
:slug => "Pd2HptuABd",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "tDAwA817FE",
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
:slug => "tDAwA817FE",
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
:slug => "097C9jPc0g",
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
:slug => "097C9jPc0g",
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
:slug => "DUuajf3Q3f",
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
:slug => "DUuajf3Q3f",
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
:slug => "CWUVRPC6Br",
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
:slug => "CWUVRPC6Br",
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
result = HoloceneEvent.where(:name => "Lvinaya Past, Kamchatka Peninsula (Russia) VEI 6+ ", :start_year => -7480)
if result.length == 0
result = HoloceneEvent.create({:name => "Lvinaya Past, Kamchatka Peninsula (Russia) VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "56npKx5hym",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7480"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lvinaya Past, Kamchatka Peninsula (Russia) VEI 6+ ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "56npKx5hym",
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
:body => "
<p>
After such flooding caused by the ice melt, the rivers and streams would have been washed clean.
In the middle of the reestablishment of fisheries, the 8.2K Event happened.  
Colder, drier conditions last for two to four hundred years.  
The dryer conditions would force aquatic fowl into an area with proper conditions.  
The dryness would reduce conditions needed for fish to establish themselves in the rivers and streams.
Eventually, the dryness diminishes and the fish return to the streams along with the birds that feed on them.
</p>
",
:slug => "vMaT312SZS",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "2FBa1fcXHk",
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
:slug => "2FBa1fcXHk",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "Tkh4gJ5Qa4",
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
:slug => "Tkh4gJ5Qa4",
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
:body => "
<p>
Eventually, animals return to the land after the stabilization of the surface waters. 
With glaciers releasing water at random, animals would have no safety for reproduction or survival.
</p>
<p>
The domestication of animals has allowed man to expand in a manner never before seen in human history. 
As man's awareness has grown over time, the dependency on livestock for food and labor has grown as well.
</p>
",
:slug => "D2SukL9axS",
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
:slug => "sKkGxwm4vw",
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
:slug => "sKkGxwm4vw",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = Section.create({:name => "Day 7 The Lord Rested ",
:body => "
<p>What comes to mind is that after a duration of time an explosion happened somewhere where everyone heard it.
It was decided that during that period of time nothing happened so 'God Rested'.
Such events as isolated explosion would perhaps be dismissed as a local phenomena.
Explosions that are heard by large groups would be interpreted as God speaking.
</p>
",
:slug => "JjUx8ST8AK",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "mj7kF6EpP7",
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
:slug => "mj7kF6EpP7",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = Section.create({:name => "God Comes to visit ",
:body => "
<p>
What would really ancient person consider as a visit from God?  
A volcano exploding with enough force to generate a sound heard around the world?
An impact event would also qualify as a visit from God.  
First the bright streak across the sky.  
Then an explosion generating a massive sound. 
</p>
<p>
Two recent impacts were the Tunguska event and the Chelyabinsk meteor.  
Such an event is more a God smiting the wicked with the bang. 
It is similar to a volcano going boom but possibly without the climate changes associated with the volcano. 
</p>
<p>Another possibility for God coming to visit is a comet.  
A large comet which is visible for a long period would seem to be on a collision course with the Earth.  
That it does not hit would be a merciful visit from God.
</p>
",
:slug => "pVKqGMw3Th",
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
:slug => "cMWNKR6qy0",
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
:slug => "cMWNKR6qy0",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Crater Lake Caldera VEI 7 ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Crater Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @volcanic ] ,
:region => @northamerica,
:url => "",
:user_id => @user.id,
:slug => "Qt3gP10E8C",
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
:event_types => [ @volcanic ],
:region => @northamerica,
:slug => "Qt3gP10E8C",
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
result = Section.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:body => "
<p>
At that time the Black sea area was truly Eden.
Large fresh water lake with gentle rolling hills.
Four rivers flowing to the area proving a guide out of the area.
Having had several thousand years to adapt to the valley, it's loss would be a religious experience.
The Black Sea basin before the flooding by the sea was a paradise compared to other areas during the Holocene. 
Fresh water with four river running into it providing trails leading out. 
The plain would have been fertile with grass as well as marshes with birds, fish and other animals. 
</p>
<p>
Depending on the rate of rise of the wasters, one could find oneself at the edge of the new ocean with literally the cloths on ones back.
</p>
",
:slug => "L7MLf6KtMn",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Eve's Apple ",
:body => "
<p>
One of the questions that has always interested me is the question of Eve, the apple and the snake.  
Apple trees are an awesome source of food.
It can be dried.  
Imagine some women trying to harvest apples and running into snakes in the trees.  
Not a desirable work condition.
</p>
<p>
Imagine that to remedy this, they cut branches to skirt the tree pointing downward so that a snake would fall back to earth trying to climb the tree.
Now imagine some of the branches are apple and being stuck into the apple tree, they grew.
Not something that those who grow beards and know things knew about.
</p>
",
:slug => "a2cLXuSZ8w",
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
:slug => "mfu6EBDsBb",
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
:slug => "mfu6EBDsBb",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = Chapter.create({:name => "Noah's Flood ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "noah_flood",
:book => @book,
:body => "
<p>
When research conducted by William Ryan, Walter Pitman was first published in 1998, the Christian community was not very receiving.
First, the Biblical flood covered the whole world, while the flooding of the Black Sea basin was not global in nature.
</p>
<p>
Research done by Abbott, et la concerning specific types of chevron dunes along the coasts of various places lead to the discovery of the Buckle Crater.
This event would have been global with solid rain for several months.
</p>
<p>
This event is called the Piora Oscillation and lasted from 3250BC to 2900BC.
A Greenland GISP2 ice core sample shows a sulfate spike and methane trough about 3250 BC.
</p>
"
})
res = Aside.create({
:name => "It is Time.",
:body => "
<p>Nan knew what to do.<br/>  
The object had been growing steadily bigger and did not change from night to night.<br/>
He gathered his things and descended the mountain.<br/>
To look for the righteous who would know and listen.<br/>
The Wicked would perish, God was coming!
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Flood")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Flood",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("bible")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("niven1985")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("pitterson2017")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "The Cause - The Nephilim ",
:body => "
<p>'These were the heroes that were of old, warriors of renown.' Genesis 6:4
</p>
<p>The story of the Watchers/angles/sons of god mating with women of Men produced several problems.
</p>
<ul>
<li>Watchers who would want to settle down with a family ignoring their obligation to Humanity.</li>
<li>The issues of paternity of the children born to the women.</li>
<li>Not all smart people reproduce that intelligence.</li>
<li>Children born to Watcher would have their father's genetics and epigenetic history.</li>
</ul>
<p>The first issue is the issue of the Revolt.
Watchers would have found ways to have children without having to have a family.
</p>
<p>Which is the second issue - whose child is it?
In Greece, the issue became that of Demigods.
Zeus fathered many children.
Society benefited.
</p>
<p>When the child became violent in behavior then the father was really Hades disguised as Zeus.
</p>
<p>
</p>
",
:slug => "gPcbQVeT1y",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Warning - God or a Watcher ",
:body => "
<p>According to tradition, Noah was first informed of the impending flood by a Watcher and that Noah was fathered by a Watcher.
We can not know who Noah's real father was but it does show that during Noah's time, the Watchers where not celibate.
Nor was Noah the only one notified that something bad is about to happen.  
Many Watchers came down to tell people everywhere.
The 'various' Noah stories are not copies of a simple story but identical experiences in each culture.
Where a Watcher told people, someone listened.
</p>
",
:slug => "SGFBvxDBxY",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Impact ",
:body => "
<p>The location of the impact is in the Indian Ocean.
The best description of the events of what would follows from the impact come from a science fiction book 'Footfall' by Larry Niven and Jerry Pournelle.
The book describe the fall of a large rock into the southern Indian Ocean just as with the Noah Impact event.
</p>
<p>The impact point was near the equator and would have created billions of tons of evaporated salt water.
Rain would have fallen as a deluge in the beginning changing to steady rain for at least 40 days as per the Bible.
The rain would have continued for weeks afterwards.
</p>
<p>The tsunami would have affected Australia, India, Southeast Asia, East Africa, the Red Sea, the Persian Gulf.
It would have generated a wave that would have traveled around the world affecting all coastlines.
</p>
<p>
Around the Indian Ocean, all evidence of human existence would have disappeared.
</p>
",
:slug => "cpXFWvHnfk",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
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
:slug => "DgnXLqj2Lv",
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
:slug => "DgnXLqj2Lv",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Burckle Crater - Noah's Flood ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Burckle Crater - Noah's Flood ",
:end_year => "-2800",
:body => "",
:tag_list => [],
:event_types => [  @biblical,@impact ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8cAFYTdjeC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burckle Crater - Noah's Flood ",
:end_year => "-2800",
:body => "",
:tag_list => [],
:event_types => [ @biblical,@impact ],
:region => @global,
:slug => "8cAFYTdjeC",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
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
:slug => "FPk7bc6596",
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
:slug => "FPk7bc6596",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
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
:slug => "0cMX5JMCxy",
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
:slug => "0cMX5JMCxy",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Gilgamesh Flood Myth ", :start_year => -2100)
if result.length == 0
result = HoloceneEvent.create({:name => "The Gilgamesh Flood Myth ",
:end_year => "-2000",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "RMQHRaXjK4",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Gilgamesh Flood Myth ",
:end_year => "-2000",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "RMQHRaXjK4",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Atra-Hasis - Flood Myth ", :start_year => -1646)
if result.length == 0
result = HoloceneEvent.create({:name => "Atra-Hasis - Flood Myth ",
:end_year => "-1626",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "x1S9bw62m7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1646"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Atra-Hasis - Flood Myth ",
:end_year => "-1626",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "x1S9bw62m7",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1646"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
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
:slug => "mqsBcJPgX9",
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
:slug => "mqsBcJPgX9",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Survival - Arks, Boxes and Logs ",
:body => "
<p>One of the curious features of the Ark story is how it was on open waters for long period of time before the waters receded.  
Building the Ark in a depression large enough that when filled with water appears to have no shore.  
The accumulated rain waters with a slow clearing basin become an instant ocean.
</p><p>In Native American traditions, there is the story of 'Waynaboozhoo and the Great Flood' from the Ojibwe people.
In this story, Waynaboozhoo creates a raft from twigs and logs giving the animals a change to survive.
</p>
",
:slug => "4D6G7JsKnj",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Aftermath - Wine and Ham ",
:body => "
<p>Wine's effects on Noah and Ham's response to those effects is a curious thing.  
Having 'seen' his father's genitals, Ham does what?  Why would castration be an answer?
</p><p>
One thing to consider is that the Flood was a massive disaster.
No one and nothing was spared except in the Ark.
Rebuilding a life after such an experience is daunting.  
When survivors showed up and restarted civilization, the shock would have been even greater.
</p><p>
Wine showing up at this point in the Bible and Noah consuming to excess are indicative of Wine's effects in grieving and loss.  
People experiencing a loss of some soft frequently turn to alcohol to cope with the changes going on in their life and the majority return to a more normal consumption level.
</p>
",
:slug => "gpXU088d3z",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Scorpion I ", :start_year => -3200)
if result.length == 0
result = HoloceneEvent.create({:name => "Scorpion I ",
:end_year => "-3150",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xGJuLYsmQn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Scorpion I ",
:end_year => "-3150",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xGJuLYsmQn",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Wine in Egypt ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "smfr2ySYXm",
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
:event_types => [  ],
:region => @global,
:slug => "smfr2ySYXm",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Water damage at the Sphinx ",
:body => "
<p>
Part of the Orion Correlation Theory that we discussed in University in Stone chapter discusses the water damage to the Sphinx but does so in the assumption that they damage is due to the limited rainfall on the Giza plateau would take time to eventually wear down the stone around the Sphinx.
The downpour from Noah's impact would not create damage but the accumulated water from the surrounding area pouring into the complex would leave a trail.
Since the Giza plateau did not have the pyramids, it would act as drainage plain funneling the water towards the Nile and the desert.
Damage to the Sphinx itself would be limited to what is present.
The wind and sand would wear these signs down on both the Sphinx and its surrounding stone.
</p>
",
:slug => "eYhs8q18Dv",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Sphinx existed in Egypt ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Sphinx existed in Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Sx5ywc6Gxg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sphinx existed in Egypt ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Sx5ywc6Gxg",
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
@noah_flood_timeline.holocene_events << result unless @noah_flood_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Drought - the Mover of Civilizations ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "drought",
:book => @book,
:body => "
<p>Drought moves people like no other climate change.  
No water to drink means no life.  
People seek life.
</p>
"
})
res = Aside.create({
:name => "Dawn",
:body => "
<p>The King prayed all night.<br/>
In morning council, he would announce that his son would lead half the people away to relieve the famine in the land.<br/>
They would go south to the sea and build boats to sail to distant lands to seek a homeland.
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("k8538")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("baillie1999")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "K8538 - Message from the past ",
:body => "
<p>
The most interesting thing about the drought is what caused it was recorded on the K8538 tablet[[LHxs5qB5Kq]] .
This table was found in a library dated to around 660 BC.
It is a disk which is divided into 8 parts.
Each part describes an approaching comet and the aftermath of its impact on Earth.
The impact is dated to 2,193 BC using the data on the disk to recreate the night skies that the comet travelled through.
</p><p>
The impact created the Umm al Binni crater and created the Babylonian flood covering the cities of the lower Tigress and Euphrates rivers with mud.
It caused the destruction of two Sumerian cities.
This destruction caused people to create 'Mesopotamian city laments' clay tablet describing their grief.
</p>
",
:slug => "FNBU2Ub4ZX",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "LHxs5qB5Kq", :body => "K8538", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "K8538 - Sumerian Star Map ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "d9UvSBYHFg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "d9UvSBYHFg",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "4.2 Kiloyear Event",
:body => "
<p>
This event was the most severe aridification event in the Holocene.
It started the migration of peoples towards the Mediterranean Sea pressuring them to move south.  
Their environment dried up along with the rest of the Middle East and Asia. 
At the very least, a civilization would send out scouting parties to see how extensive the climate downturn has become and where was not affected.
</p>
<p>A 180-km-long wall, the 'Repeller of the Amorites', was built across central Mesopotamia to stem nomadic incursions to the south.
The northern plains of Mesopotamia were abandoned around 2,175 BC.
The northern plains of Mesopotamia were not resettled until around 1,900 BC.
</p>
",
:slug => "tPUQTCCvB3",
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
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "WEqkDvg1nX",
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
:slug => "WEqkDvg1nX",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Umm al Bini ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "6WT4wm6FyM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "6WT4wm6FyM",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "The Greeks ",
:body => "
<p>Who were the Greeks and how did the Sea People hide from history?
</p>
<p>
There are many theories about the appearance of the Sea People. 
One believes peoples from the various islands of the Mediterranean becomes seafaring enmass.
Indeed, archaeology from Sardinia has brought to light the existence of extensive ship building and usage from around the 18th century BC.
However, the islands of the Mediterranean can not account for the various groups of Sea People.
</p>
<p>
Texts at Medinet Habu indicate a large land movement of people.
A large group of people would have moved down the Levant from either Anatolia, the Armenian Highlands or the Caucasus.
</p>
",
:slug => "fbvZyLne5W",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Cycladic culture ", :start_year => -3200)
if result.length == 0
result = HoloceneEvent.create({:name => "Cycladic culture ",
:end_year => "-1050",
:body => "
<p>The first culture in the Aegean sea as a philosophical base.
</p>
<p>The culture essentially became Minoan around 2000 BC when the pottery especially became all Minoan in style.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "44xZAQbaDS",
:lat => "39",
:lng => "25",
:start_year_uncert => "",
:start_year => "-3200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cycladic culture ",
:end_year => "-1050",
:body => "
<p>The first culture in the Aegean sea as a philosophical base.
</p>
<p>The culture essentially became Minoan around 2000 BC when the pottery especially became all Minoan in style.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "44xZAQbaDS",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
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
:slug => "K0nPGWUL3Y",
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
:slug => "K0nPGWUL3Y",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mycenaean Greece ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenaean Greece ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "QK3MsCtWsC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenaean Greece ",
:end_year => "-1100",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "QK3MsCtWsC",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "The Sea People - Shadow Greeks ",
:body => "
<p>The 4.2K Event set in motion many people moving to better lands.
Collectively, the Sea People seem to be multiple groups of various cultures.
There was a similarity between the native Greeks and some of the Sea People since they seem to have shared a linguistic rooted language.
During the Santorini eruption of 1,628 BC, some groups of Sea People took advantage of the tsunami damage to Southern Greece and moved to supplement the local population.
This resettlement eventually lead to the 'Dorian' revolt around 1,260 BC.
</p>
",
:slug => "ULuce3PMvC",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
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
:slug => "mKeZWp9xZy",
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
:slug => "mKeZWp9xZy",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "zK858tQZns",
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
:slug => "zK858tQZns",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nuragic Civilization ", :start_year => -1700)
if result.length == 0
result = HoloceneEvent.create({:name => "Nuragic Civilization ",
:end_year => "-238",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "qn8BNbdA7W",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nuragic Civilization ",
:end_year => "-238",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "qn8BNbdA7W",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
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
:slug => "jtq3MZ4BAH",
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
:slug => "jtq3MZ4BAH",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Jason and the Argonauts ", :start_year => -1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Jason and the Argonauts ",
:end_year => "",
:body => "
<p>The classic tale defining a part of Greek culture.  There is discussion about the story being one of the 
descendants of a people who occupied parts of Greece going on a voyage back to their ancestral home land.
Some have suggested that their homeland was Bactria.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Argonauts",
:user_id => @user.id,
:slug => "HEsVJxfnAx",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jason and the Argonauts ",
:end_year => "",
:body => "
<p>The classic tale defining a part of Greek culture.  There is discussion about the story being one of the 
descendants of a people who occupied parts of Greece going on a voyage back to their ancestral home land.
Some have suggested that their homeland was Bactria.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "HEsVJxfnAx",
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
@drought_timeline.holocene_events << result unless @drought_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Inconvenient Dates ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "inconvient_dates",
:book => @book,
:body => "
<p>These events bring into question the begets of the Bible and when did a particular individual exist.
There are two issues when did the individuals of the bible live and how long did they do so.
</p>
"
})
res = Aside.create({
:name => "We must move!",
:body => "
<p>There is nothing to eat here.<br/>
There is nothing to eat north of us.<br/>
To the west is the sea and to the east the desert.<br/>
We must move to Egypt, to Joseph.
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "Working Backwards ",
:body => "
<p>We have to make a couple of assumptions about Joseph.
The first is his age when he goes to Egypt.
And second, when he died.
</p>
<div class='gtree'>
  <ul>
    <li>Terah 1,987 BC - 1,782 BC
      <ul>
        <li>Abraham 1,917 BC - 1,742 BC
          <ul>
            <li>Issac 1,817 BC - 1,637 BC
              <ul>
                <li>Jacob 1,757 BC - 1,610 BC
                <ul>
                  <li>Joseph 1,662 BC - 1,552 BC</li>
                </ul>
              </li></ul>
          </li></ul>
        </li>
        <li> <ul>
           <li>Lot 1,827 BC - 1,622 BC
        </li></ul>
        </li>
      </ul>
    </li>
  </ul>
</div>
<div class='page-break'></div>
<p>The inconvenience of dates is this:
</p>
<ul>
<li>Terah is 70 when Abraham is born.</li>
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
<li>Abraham had died and Lot was alive at the time of the destruction of Sodom and Gomorrah.</li>
</ul>
<p>The result is a 290 year sequence between the birth of Abraham and the eruption of Santorini.  
The 290 year figure would also make sense in light of the 4.2 Kiloyear event.
</p>
<p>But not for the destruction of Sodom and Gomorrah.  
Indeed, it appears that the story of Sodom and Gomorrah was dropped into the story of Abraham and Lot's adventures in Canaan and Egypt and there after.  
The story of Lot's capture and Abraham's response sounds real.
</p>
<p>Abraham's meeting with the three men.  
The going to Sodom by two of the 'men', the conversation with the local people, the fleeting of the city all seem to have a difference feel in cadence.  
I believe that the story of the destruction of Sodom and Gomorrah sound real as well.  
Just not the people.
</p>  
<p>The 4.2K event drove many people from their lands.  One such family was to eventually create the Great Patriarchs.
</p>
",
:slug => "KJEAqQ5V0F",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Joseph and the Egyptians ",
:body => "
<p>The man who saved two civilizations.
As Vizier, Joseph had many powers.
His interpretation of the Pharaoh's dream helped him to create a buffer between the good years and the disaster that Santorini caused the globe when it erupted.
The settlement of the Semitic population from the Levant allowed Joseph to create warehouses of grain and other food supplies.
When the famine hit, at least part of Egypt have supplied to aid others including those from outside the Nile valley.
</p>
",
:slug => "Zpw8jbHcEA",
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
:body => "
<p>Lived 205 years.</p>
",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "4qhjefGTFe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1987"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Terah ",
:end_year => "-1782",
:body => "
<p>Lived 205 years.</p>
",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "4qhjefGTFe",
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
@inconvient_dates_timeline.holocene_events << result unless @inconvient_dates_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Abraham ", :start_year => -1917)
if result.length == 0
result = HoloceneEvent.create({:name => "Abraham ",
:end_year => "-1742",
:body => "
<p>Lived 175 years.</p>
",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "c3pbnS4Lff",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1917"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Abraham ",
:end_year => "-1742",
:body => "
<p>Lived 175 years.</p>
",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "c3pbnS4Lff",
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
@inconvient_dates_timeline.holocene_events << result unless @inconvient_dates_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Issac ", :start_year => -1817)
if result.length == 0
result = HoloceneEvent.create({:name => "Issac ",
:end_year => "-1637",
:body => "
<p>Lived 180 years.</p>
",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "2u4wHQv6P6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1817"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Issac ",
:end_year => "-1637",
:body => "
<p>Lived 180 years.</p>
",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "2u4wHQv6P6",
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
@inconvient_dates_timeline.holocene_events << result unless @inconvient_dates_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Jacob ", :start_year => -1757)
if result.length == 0
result = HoloceneEvent.create({:name => "Jacob ",
:end_year => "-1610",
:body => "
<p>Lived 147 years. Dies in Egypt after being there for 18 years.</p>
",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "hXgsPHF9NE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1757"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jacob ",
:end_year => "-1610",
:body => "
<p>Lived 147 years. Dies in Egypt after being there for 18 years.</p>
",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "hXgsPHF9NE",
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
@inconvient_dates_timeline.holocene_events << result unless @inconvient_dates_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Joseph ", :start_year => -1662)
if result.length == 0
result = HoloceneEvent.create({:name => "Joseph ",
:end_year => "-1552",
:body => "
<p>Lived 110 years.</p>
",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "htCt0n3NSP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1662"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joseph ",
:end_year => "-1552",
:body => "
<p>Lived 110 years.</p>
",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "htCt0n3NSP",
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
@inconvient_dates_timeline.holocene_events << result unless @inconvient_dates_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "1,628 BC - Santorini - an Inconvenient Event ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "santorini",
:book => @book,
:body => "
<p>This single event has influenced history and religion than any other.  
The explosion that came when Santorini/Thera finally blew.  
During the set of eruptions, the eruption plumb was towards the northeast.
</p>
<p>The second set of eruptions was toward the southeast over the Dead sea and Egypt.  
</p>
<ul>
<li>The 10 Plagues of Egypt are in fact events resulting from the explosion. </li>
<li>The destruction of Sodom and Gomorrah by a pyrolytic bomb spit out by the eruption.</li>
<li>The occupation of mainland Greece by the Ekwesh Sea Peoples in 1,600 BC replacing those peoples destroyed by the tsunamis from Santorini.</li>
</ul>
<p>These events bring into question the begets of the Bible and when did a particular individual exist.  
The 10 Plagues set in motion the Exodus according to the Bible, yet research is pointing to Moses being born after the Plagues and before the Exodus occurs.
It is not clear as to when the Israelites left Egypt after the Plagues.  
The first objective event after the wandering in Desert is the Battle of Jerico after the Exodus.
This event again proves inconvenient.  
It has been dated to between 1,600 BC and 1,500 BC while the best date I can find for Moses is 1,572 BC - 1,451 BC.  
</p>
"
})
res = Aside.create({
:name => "Cousins!",
:body => "
<p>They came in after the tsunamis.<br/>
The people in boats.<br/>
They spoke like our language and brought wine and water.
</p>
<p>They took over as lord and master.<br/>
They didn't ask if we wanted that.
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("bible")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("winchester2003")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("savino2007")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("stothers1999")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("stommel1983")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => ["Atlantis"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "NXPUCEyNv1",
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
:tag_list => ["Atlantis"],
:event_types => [ @place ],
:region => @europe,
:slug => "NXPUCEyNv1",
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
rsl = GlossaryTerm.where(:name => "Atlantis")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Atlantis",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ipuwer Papyrus ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Ipuwer Papyrus ",
:end_year => "-1450",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Ipuwer_Papyrus",
:user_id => @user.id,
:slug => "axMB3cetX2",
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
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "axMB3cetX2",
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
:slug => "T9y8p6W7Pb",
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
:slug => "T9y8p6W7Pb",
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
result = Section.create({:name => "The 10 Plagues of Egypt ",
:body => "
<p>Plague 1 - Water turned into blood, fish died</p>
<p>
The redness in the Nile was caused by volcanic ash from Santorini/Thera which is found in the Nile region. 
The silt would have make the Nile turn blood red, and would also render it undrinkable. 
Heavy rains in the red-soiled area of Lake Victoria could have caused reddened water to wash downstream.
</p>
<p>Plague 2 - Frogs</p>
<p>
Any blight on the water that killed fish also would have caused frogs to leave the river and probably die.
</p>
<p>Plagues 3 and 4 - Biting insects and flies</p>
<p>
The lack of frogs in the river would have let insect populations, normally kept in check by the frogs, increase massively.
</p>
<p>Plagues 5 and 6 - Livestock disease and boils</p>
<p>
There are biting flies in the region which transmit livestock diseases; a sudden increase in their number could spark epidemics.
</p>
<p>Plague 7 - Fiery hail</p>
<p>
Volcanic activity not only brings with it ash, but brimstone, and also alters the weather system, occasionally producing hail. 
Hail could also have occurred as a completely independent natural weather event, with accompanying lightning as the 'fire'.
</p>
<p>Plague 8 - Locusts</p>
<p>
The weight of hail will destroy most crops, leaving several insects and other animals without a normal food source. 
The remaining crops therefore would become targeted heavily, and thus be destroyed by swarms of locusts which would otherwise be distributed rather thinly. 
Or the locusts could have increased because of a lack of predators. 
Even without these explanations, swarms of locusts are not uncommon today.
</p>
<p>Plague 9 - Darkness</p>
<p>
There could be several causes for unusual darkness: a solar eclipse, a sandstorm, volcanic ash, or simply swarms of locusts large enough to block out the sun.
</p>
<p>Plague 10 - Death of the firstborn</p>
<p>
If the last plague indeed selectively tended to affect the firstborn, it could be due to food polluted during the time of darkness, either by locusts or by the black mold Cladosporium. 
When people emerged after the darkness, the firstborn would be given priority, as was usual, and would consequently be more likely to be affected by any toxin or disease carried by the food. 
Meanwhile, the Israelites ate food prepared and eaten very quickly which would have made it less likely to be infected.
</p>
",
:slug => "DPpLZBaPTH",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "10 Plagues")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "10 Plagues",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "0YH8x1qNZd",
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
:slug => "0YH8x1qNZd",
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
:slug => "9Rr7S37Y5w",
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
:slug => "9Rr7S37Y5w",
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
result = Section.create({:name => "A group of Sea People takes over part of Greece ",
:body => "
<p>The repeated earthquakes and tsunamis from Santorini would have reduces the livability of the isles and land west of Santorini.  
After the eruption of Santorini, the availability of the lands of Greece affected by the tsunamis would increase phenomenally.  
There would be a pause before the invasion/rehabitation due to the uncertainty of another tsunami.  
Then a group of Sea People could move in with organized people and supplies.
Eventually, people migrating would have begun filling the gaps in the islands and landscapes.  
This event sets up for the 'Dorian Invasion' during the Bronze Age Collapse.
</p> 
",
:slug => "VFjBhs8ask",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "A group of Sea People takes over part of Greece ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "A group of Sea People takes over part of Greece ",
:end_year => "-1600",
:body => "
<p>The tsunamis from Santorini would have wiped part of Greece of its infrastructure and people.
</p>
",
:tag_list => ["SeaPeople"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "D4Tuqv4kJM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "A group of Sea People takes over part of Greece ",
:end_year => "-1600",
:body => "
<p>The tsunamis from Santorini would have wiped part of Greece of its infrastructure and people.
</p>
",
:tag_list => ["SeaPeople"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "D4Tuqv4kJM",
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
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = Chapter.create({:name => "Destruction of Sodom and Gomorrah ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "sodom",
:book => @book,
:body => "
<p>Santorini/Thera had two minor eruptions before exploding.  The first eruption cast a plume trace to the northeast of the 
Mediterranean.  Traces of the plume have been found in Turkey and parts of Lebanon.  The second eruption was towards the
south east over the land of Israel.  Abraham  in the plains of Mamre would have seen the first eruption as something 
divine and safe as no fallout from the plume reached his location.  The intervening months between the first and second
eruptions would have allowed time for news of the destruction caused by the fallout of the first explosion to filter to 
Abraham.
</p>
<p>When the second eruption occurred and the plume came overhead, Abraham was visited by people who survived the first plume.
These survivors were surely angles having survived by being on God's side.  They sought to warm Lot, his family and friends
that the fallout from the plume could destroy them.  Who or what the angles sent to Lot in Sodom is unknowable.
There effect on the crowd at Sodom seems real enough.  If something or someone is brought to the city with knowledge
of what is happening with the eruption plume overhead would be very sought after. Unless that city is one where they chop
you to pieces if you speak bad of the city.  Predicting Doom would be bad so Lot tired to protect them.
</p>
<p>
Steven Collins' work at Tall el-Hammam in Jordon has shown that the city he found matches the description of Sodom
as defined in the Bible.  During the work of excavation, large quantities of glass where found that resemble Trinitite
indicating a very hot explosion.  That the glass was located in a area covering Tall el-Hammam suggests to me a 
volcanic cinder bomb not cooling correctly as it comes down resulting in a superheated explosion on a limited scale.
</p>
"
})
res = Aside.create({
:name => "Inconsiderate!",
:body => "
<p>We wanted to talk with the Watchers.  
Lot's visitors were Watchers.
All could see that.
They had their man-purse-star-maps.
</p>
<p>For Lot to cloister them in his house without letting them speak to us.
</p><p>
Then offering his daughters as substitutes.
What do they know?
They only know what we all do anyway.
</p><p>
And to be gone before dawn.  
So inconsiderate!
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("bible")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "The Issue of Glass ",
:body => "
<p>Dr. Collins found large quantities of glass in the area surrounding the Tell.  
Specifically, trinitite type glass.  
This type of glass is created during the explosion of an atomic bomb.
The first atomic explosion was called Trinity. 
When the area was examined after the explosion, the glass was discovered.
</p>
<p>
There are several possible explanation for the glass.
</p>
<ul>
<li>Someone dropped an atomic bomb on Sodom.</li>
<li>An atmospheric explosion of a meteor or comet.</li>
<li>Ancient aliens!</li>
<li>A pyrolytic bomb from Santorini exploded over the area.</li>
</ul>
",
:slug => "8aXXPgWxFG",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Issue of Hospitality ",
:body => "
<p>The behavior of the men in Sodom in the Bible is geared towards the Sodom was a place of Sin.
This assertion may have been an addition to justify God's actions.
Given that the 'Angles' that arrived to talk with Lot where Watchers, it is understandable that the men of the town would want to talk with then about the world.
This desire for more information may have been based on the observation of the fall out from Santorini.
</p>
<p>
The curious thing about this exchange is that there does not appear to be a king present.  
Indeed the men act as Athenians newly minted with Democracy supporting the removal/collapse of the king when Lot was kidnapped.
</p>
",
:slug => "CGZjtkZRSr",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Timing ",
:body => "
<p>
This is an interesting event since it involves both Abraham and Lot.  
The support for Lot's existence at the time of the event is clear from the genealogy that I have created above.
Abraham's involvement seems to be a back write to generate justification for the event.  
It is curious that in the conversations with the three visitors that Abraham is not awed by them.
</p>
<p>For the Watchers to have been in the Levant and went to Sodom to warn Lot indicates that either the Watchers were there all along and had communications with the Watchers in Anatolia.
With the initial eruption of Santorini, the fallout fell in Anatolia.
It would be natural for the Watchers to observe the function of a volcano since they have at this point at least 6 to 8 thousand years of experience with volcano in the Middle East and Europe.
</p>
",
:slug => "xsgS6Kstjw",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Lot ", :start_year => -1827)
if result.length == 0
result = HoloceneEvent.create({:name => "Lot ",
:end_year => "-1622",
:body => "
<p>Lived 205 years.</p>
",
:tag_list => [],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "ZEhQAc7Bu7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1827"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lot ",
:end_year => "-1622",
:body => "
<p>Lived 205 years.</p>
",
:tag_list => [],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "ZEhQAc7Bu7",
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
@sodom_timeline.holocene_events << result unless @sodom_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Genesis 19:24 - 'rained down burning sulfur...' ",
:body => "
<p>The fallout from the explosion of Santorini fell directionally in an arc downwind from the volcano.
The fall out would contain volcanic gases and sulfur would be a major component.
Lot's wife being turned to salt could be a result of the intensity of the explosion.
</p>
<p>One question of does the chemical signature of the glass found at Tall el-Hammam match the chemical signature of Santorini/Thera.
The soil should hold a match to Santorini from the fallout. 
The glass should also hold the same elements.
If not then the explosion that created it happened at a different time.
</p>
",
:slug => "K3e9aqVPJ2",
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
:slug => "y1zpjVGTbb",
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
:slug => "y1zpjVGTbb",
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
@sodom_timeline.holocene_events << result unless @sodom_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Exodus and the Plague - Survivors and Cleansing ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "first_plague",
:book => @book,
:body => "
<p>Research on DNA traces of epidemics identified a epidemic that struck Europe about 1,500BC.
Curiously, it did not affect the population of the Middle East.
If a disease followed the same pattern of out of Africa via the Red Sea as in the Justian Plague, first to be infected would be the port
of call in the Red Sea.  
From there by land it would travel to Egypt and the Levant, by sea the Minoans would have taken it back to Crete and from there to its colonies in Greece and Anatolia.
With a naive population, the reduction of the Minoan population by 90% would reduce any culture to rubble.
</p>
<p>That plague is non-discriminatory towards status, the loss of leaders in any given group would lead to contests to
determine leadership.  It is possible that much of the violence that Graham Phillips attributes to a comet is 
possibly related to the unrestrained mass of people faced with collapsed leadership and organized food production.
</p>
"
})
res = Aside.create({
:name => "Necessity",
:body => "
<p>The cooling waters, I surrendered into them.<br/>
The children... As longs as I live, the children...
</p><p>
We waited to see if the evil that infected Jerico had infected us.<br/>
Long after everything had been cleansed, long enough to know...
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Bubonic Plague")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bubonic Plague",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("bible")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1530)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "",
:body => "
<p>The 'Battle' of Jerico and it subsequent destruction of all living souls is a curious event in the history of Moses and the tribes.
The elaborate cleansing ritual for the aftermath of the battle seems to be more of a contamination cleanse than calming the soul so as 
to not murder your wife and children after killing everyone in Jerico.
</p>
<p>That this battle was a cleansing of Bubonic Plague from Ancient Canna seems to fit the event and its description of the cleansing ritual after the battle.  That no living thing
was left alive was based on the fear of contagion.  In this case a bacterial plague.  This event seemed to influence Joshua's obsession with purity of the people as well.
</p>
<p>1530 BC: Joshua 6:17 - Destruction of Jerico (radiocarbon dating range)
</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [  @biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "ZbeGaXF9u3",
:lat => "31.871",
:lng => "35.444",
:start_year_uncert => "43",
:start_year => "-1530"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "",
:body => "
<p>The 'Battle' of Jerico and it subsequent destruction of all living souls is a curious event in the history of Moses and the tribes.
The elaborate cleansing ritual for the aftermath of the battle seems to be more of a contamination cleanse than calming the soul so as 
to not murder your wife and children after killing everyone in Jerico.
</p>
<p>That this battle was a cleansing of Bubonic Plague from Ancient Canna seems to fit the event and its description of the cleansing ritual after the battle.  That no living thing
was left alive was based on the fear of contagion.  In this case a bacterial plague.  This event seemed to influence Joshua's obsession with purity of the people as well.
</p>
<p>1530 BC: Joshua 6:17 - Destruction of Jerico (radiocarbon dating range)
</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [ @biblical ],
:region => @middleeast,
:slug => "ZbeGaXF9u3",
:lat => "31.871",
:lng => "35.444",
:url => "",
:user_id => @user.id,
:start_year_uncert => "43",
:start_year => "-1530"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Bubonic Plague first appearance at Jerico ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Bubonic Plague first appearance at Jerico ",
:end_year => "-1530",
:body => "
<p>Genetic research into heart disease arrived at the conclusion that Bubonic plage appeared in Europe around 1,500 BC.
The cleansing ritual at the destruction of Jerico shows that Bubonic plague was already present in the Middle East around 1,530 BC.
This epidemic possibly reduced the population by 90%.  Parts of the British isles being the exception since the next plague, the Justinian, reduces parts of Cornwall to 10% after exposure.
</p>
",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "shjdaH2NbQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bubonic Plague first appearance at Jerico ",
:end_year => "-1530",
:body => "
<p>Genetic research into heart disease arrived at the conclusion that Bubonic plage appeared in Europe around 1,500 BC.
The cleansing ritual at the destruction of Jerico shows that Bubonic plague was already present in the Middle East around 1,530 BC.
This epidemic possibly reduced the population by 90%.  Parts of the British isles being the exception since the next plague, the Justinian, reduces parts of Cornwall to 10% after exposure.
</p>
",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "shjdaH2NbQ",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Bubonic Plague")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bubonic Plague",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "gzL3TvxXUE",
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
:slug => "gzL3TvxXUE",
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
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Bubonic Plague")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bubonic Plague",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "kJHHw5zdGh",
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
:slug => "kJHHw5zdGh",
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
result = HoloceneEvent.where(:name => "Hyksos conquer Canaanites and Egyptian Dynasties ", :start_year => -1650)
if result.length == 0
result = HoloceneEvent.create({:name => "Hyksos conquer Canaanites and Egyptian Dynasties ",
:end_year => "-1550",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "GK5GEgVBbP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hyksos conquer Canaanites and Egyptian Dynasties ",
:end_year => "-1550",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "GK5GEgVBbP",
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
:slug => "ZH5zg1U2NX",
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
:slug => "ZH5zg1U2NX",
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
:body => "
<p>
Research has shown that there were two Exodus episodes.  
The first due to the plagues of Egypt eruption of Santorini and the second during the expulsion of the Hyksos in the 1200's BC..
</p>
<p>When the plague showed up in the Middle East, it appears to have followed what happened during the Justian plague 
and that is infect the Middle East first.  Specifically the communities closest to the Red Sea.  Jericho being among those cities affected.
</p>
<p>The fact of the infection of Jericho and what would have been the smoke from the Kaali Meteor Impact bring a 'Three Day of Darkness' effect towards the end of the 10 Plagues of Egypt, Moses started the first Exodus.
</p>
<p>This Exodus occurred with in the background of the expulsion of the Hyksos from Egypt which occurred around 1,550 BC.  
This Exodus was uneventful, a direct wandering towards Jerico and the plague.
</p>
<p>The 'Battle of Jericho' can be viewed as a cleansing of disease, specifically the plague.  
By the killing of every man, woman and child, the human vector of a disease dies.  
The elaborate cleanse after the battle is more in line with self-quarantine with the cleaning and waiting for a disease vector to take effect.
</p>
<p>This event also brings up dates of inconvenience.  
Moses living to 120 year old had the experience and readiness of Joshua who lived to 110 years old.  
They were together during the Exodus and afterward in the desert.
</p>
<p>Yet, they had to cleanse Jerico. 
</p> 
",
:slug => "uDLRuu5FJU",
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
:slug => "h8aUN5txe9",
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
:slug => "h8aUN5txe9",
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
:slug => "yuFbEeez94",
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
:slug => "yuFbEeez94",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = Section.create({:name => "1349 BC – 1336 BC:Akhenaten ",
:body => "",
:slug => "PED8Lgk2TH",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
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
:slug => "XbpUc6SaEp",
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
:slug => "XbpUc6SaEp",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Moses ", :start_year => -1592)
if result.length == 0
result = HoloceneEvent.create({:name => "Moses ",
:end_year => "-1472",
:body => "
<p>Lived 120 years.</p>
",
:tag_list => ["BiblicalEvent", "BiblicalEvent"],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "GPKyc3Knjt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1592"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Moses ",
:end_year => "-1472",
:body => "
<p>Lived 120 years.</p>
",
:tag_list => ["BiblicalEvent", "BiblicalEvent"],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "GPKyc3Knjt",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Joshua ", :start_year => -1565)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua ",
:end_year => "-1455",
:body => "
<p>Lived 110 years.</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [  @person,@biblical ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "H5maW1Rn1v",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1565"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua ",
:end_year => "-1455",
:body => "
<p>Lived 110 years.</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [ @person,@biblical ],
:region => @middleeast,
:slug => "H5maW1Rn1v",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Joshua 6:17 - Destruction of Jerico ", :start_year => -1530)
if result.length == 0
result = HoloceneEvent.create({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ZW3UXaZ0pj",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1530"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Joshua 6:17 - Destruction of Jerico ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "ZW3UXaZ0pj",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1530"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@first_plague_timeline.holocene_events << result unless @first_plague_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Period of the Judges ",
:body => "
<p>The period of the Judges is important for defining a age guestimate for Joshua.  
His passing of the torch to the Judges sets the time period for his death.
</p>
<p>The ending of the period of the Judges is murky but seems to be defined by the establishment of the nation-states in the Levant by the Egypt.
On the defeat of the Sea People, the Pharaoh could not ignore that the number of people involved was greater than what Egypt could handle.
</p>
",
:slug => "75DQxdqypZ",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Period of the Judges ", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Period of the Judges ",
:end_year => "-1100",
:body => "
<p>The Period of the Judges is one that has better stability of evidence.  From the passing of the torch from Joshua to the judges,
the textual analysis is stronger for the reality of the stories.
</p>
<p>1382 BC - 1063 BC - Period of the Judges - alternate dates
</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [  @cultural,@biblical ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Biblical_judges",
:user_id => @user.id,
:slug => "xq9TVj8YF4",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Period of the Judges ",
:end_year => "-1100",
:body => "
<p>The Period of the Judges is one that has better stability of evidence.  From the passing of the torch from Joshua to the judges,
the textual analysis is stronger for the reality of the stories.
</p>
<p>1382 BC - 1063 BC - Period of the Judges - alternate dates
</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [ @cultural,@biblical ],
:region => @middleeast,
:slug => "xq9TVj8YF4",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Biblical_judges",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "R8zDA3PGP2",
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
:slug => "R8zDA3PGP2",
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
:body => "
<p>
' [the Hebrew people] shalt not sow their field with mingled seed... '(King James Bible)
</p>
<p>
Some scholars believe the phrase mingled seeds includes grafting, although this interpretation remains contentious among scholars as some have taken this phrase to mean purity of race as well.  
In reality, it seems to include things which waste time or resources.  Trying to crossbreed animals that are not compatible wastes time and effort.  
Wearing cloths of two or more fabrics is both a was of time and resources.  If a field is planted with two different seeds how can they be properly harvested?
</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [  @cultural,@biblical ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "k3ZDYk4cnU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Leviticus 19:19 ",
:end_year => "",
:body => "
<p>
' [the Hebrew people] shalt not sow their field with mingled seed... '(King James Bible)
</p>
<p>
Some scholars believe the phrase mingled seeds includes grafting, although this interpretation remains contentious among scholars as some have taken this phrase to mean purity of race as well.  
In reality, it seems to include things which waste time or resources.  Trying to crossbreed animals that are not compatible wastes time and effort.  
Wearing cloths of two or more fabrics is both a was of time and resources.  If a field is planted with two different seeds how can they be properly harvested?
</p>
",
:tag_list => ["BiblicalEvent"],
:event_types => [ @cultural,@biblical ],
:region => @global,
:slug => "k3ZDYk4cnU",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = Chapter.create({:name => "Bronze Age Collapse ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "bronze_age",
:book => @book,
:body => "
<p>A great question in history has always been the collapse of the Prototypical Manorial societies in the Macedonian and Greek areas.  
</p>
<p>
An event in 1,159 BC produced an 18 year substandard harvest resulting in a trans-generational famine with people facing genocide due to the weather.   
People searching for substance flooded south into any area that had any food without care as to those there already.  
</p>
"
})
res = Aside.create({
:name => "Lost, Everything Lost!",
:body => "
<p>The came from the ocean, a force like no other.<br/>
They burned the masters' place and the city too.<br/>
Everything lost!
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Section.create({:name => "Trojan War ",
:body => "
<p>One of the questions of Bronze Age Collapse is the motives the Trojans and their allies in abducting/supporting Helen.
I find it interesting that date range for this event borders the Mycenae sacking of the places.
I wonder if the real reason for the Trojan was was that Troy was the force that sacked various sites in Greece.
Not all at once as the sites in Greece show a dispersion of date of destruction.
</p>
<p>
Apollo his association with mice and their carrying of plague was noted in the Iliad.  
That such an association should be stated so clearly indicated along standing understanding of causes of disease.
</p>
<p>
</p>
",
:slug => "UtAb461emx",
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
:slug => "5hq2RyrtW7",
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
:slug => "5hq2RyrtW7",
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
result = Section.create({:name => "Mycenae ",
:body => "
<p>The sacking of the palaces in 1,260 BC was an event that could either be an uprising by the Greeks who where there before the group of Sea
People took over around 1,600 BC or another group such as the Trojans.  
</p>
<p>
A second sacking was initiated by external forces and taken advantage of by the 'Dorian' people.
Being already present as the underclass of Mycenae, the 'Dorian' Greeks rose up and retook their lands.
This was made possible by the devastation caused by the Trojan war.
</p>
",
:slug => "1sP6VBQBZp",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Mycenae - Earthquake ", :start_year => -1240)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenae - Earthquake ",
:end_year => "",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "eve9adAXXn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1240"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenae - Earthquake ",
:end_year => "",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "eve9adAXXn",
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
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Mycenae - Earthquakes ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenae - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "Tkf8fY8eDp",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenae - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "Tkf8fY8eDp",
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
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "5jxD1zyqbJ",
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
:slug => "5jxD1zyqbJ",
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
:slug => "7aTYgmWfWy",
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
:slug => "7aTYgmWfWy",
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
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
result = Section.create({:name => "The Sea People ",
:body => "
<p>
The Sea People are believed to be from the various islands of the Mediterranean.  
Another possibility is that they came from the areas of the Black sea and possibly further.  
This could explain the fact that they all seemed to have some form of Greek-ness. 
</p>
<p>The story of Jason and the Argonauts seems to be a tale of people who came from another area trying to revisit their homelands.
The classical explanation of this story is that they went voyaging into the waterway of the Balkan states.
Suggestions have been made that this voyage went into the Caspian sea by portage between the rivers that feed both seas.
</p>
<table>
<tr>
  <th>Sea People</th>
  <th>First Appeared</th>
  <th>Disposition</th>
  <th>Origin</th>
  <th>Alt. Name</th>
</tr>
<tr><td>Denyen</td>   <td>1150 BC</td><td>Canaan</td><td/><td>Tribe of Dan</td></tr>
<tr><td>Ekwesh</td>   <td>1200 BC</td><td/><td/><td>Mycenaean Greeks</td></tr>
<tr><td>Lukka</td>    <td>2000/1700 BC</td><td/><td/><td>Lydian Greeks</td></tr>
<tr><td>Peleset</td>  <td>1150 BC</td><td>Canaan</td><td/><td>Philistines</td></tr>
<tr>
  <td>Shekelesh</td>
  <td>1200 BC</td>
  <td>Sicels</td>
  <td/>
  <td/>
</tr>
<tr><td>Sherden</td>  <td>1210 BC</td><td>Canaan</td><td>Sardinia</td><td>Sardinians</td></tr>
<tr><td>Teresh</td>   <td>1200 BC</td><td>Italy</td><td>Lydian Greeks</td><td>Tyrrhenians</td></tr>
<tr><td>Tjeker</td>   <td>1150 BC</td><td>Canaan</td><td/><td/></tr>
<tr><td>Weshesh</td>  <td>1150 BC</td><td>Canaan</td><td/><td>Tribe of Ash</td></tr>
</table>
",
:slug => "qnrXnjvG0a",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Jason and the Argonauts ", :start_year => -1300)
if result.length == 0
result = HoloceneEvent.create({:name => "Jason and the Argonauts ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "chtC772yzU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jason and the Argonauts ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "chtC772yzU",
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
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sea People at the Nile Delta ", :start_year => -1188)
if result.length == 0
result = HoloceneEvent.create({:name => "Sea People at the Nile Delta ",
:end_year => "-1177",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "bshwFjTZ9q",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1188"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sea People at the Nile Delta ",
:end_year => "-1177",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "bshwFjTZ9q",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1188"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Canaan impacted by the Sea People ", :start_year => -1185)
if result.length == 0
result = HoloceneEvent.create({:name => "Canaan impacted by the Sea People ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "tRsHRMrtxN",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1185"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Canaan impacted by the Sea People ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "tRsHRMrtxN",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1185"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Destruction of Ugarit ", :start_year => -1192)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Ugarit ",
:end_year => "-1175",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "x5WmgjHN8w",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1192"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Ugarit ",
:end_year => "-1175",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "x5WmgjHN8w",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1192"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Destruction of Mycenae ", :start_year => -1210)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Mycenae ",
:end_year => "-1200",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xwLm9vtysw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1210"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Mycenae ",
:end_year => "-1200",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "xwLm9vtysw",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1210"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Onomasticon of Amenope ", :start_year => -1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Onomasticon of Amenope ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mKFUaGqEBM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Onomasticon of Amenope ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "mKFUaGqEBM",
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
result = HoloceneEvent.where(:name => "Ramesses III narrative ", :start_year => -1150)
if result.length == 0
result = HoloceneEvent.create({:name => "Ramesses III narrative ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JaPuTTTFjr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ramesses III narrative ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "JaPuTTTFjr",
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
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Merneptah narrative on the Sea People ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Merneptah narrative on the Sea People ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Q9LPTxz1ed",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Merneptah narrative on the Sea People ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Q9LPTxz1ed",
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
result = HoloceneEvent.where(:name => "Ramesses II Narrative on the Sea People ", :start_year => -2100)
if result.length == 0
result = HoloceneEvent.create({:name => "Ramesses II Narrative on the Sea People ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Jcgs2XrKnR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ramesses II Narrative on the Sea People ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Jcgs2XrKnR",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@bronze_age_timeline.holocene_events << result unless @bronze_age_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Greek Dark Ages ",
:body => "
<p>After sacking Troy, the Greeks went journeying across the eastern Mediterranean.
They acted a hired muscle for both the Hittites and the Egyptians.
Such exploits became part of the collective folk lore of Greece and Homer eventually put it all together in the Iliad and Odyssey.
</p>
<p>Perhaps the more important thing that happened is the environmental downturn that happened between 1,159 BC and 1,141 BC.
This downturn would have significantly impacted people due to the prolonged shortage of food.
This is the type of famine which begins to equate to an epidemic.
</p>
",
:slug => "GL5WVcCGFQ",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
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
:slug => "LHyzTw3WHk",
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
:slug => "LHyzTw3WHk",
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
:slug => "UcqUP0SUfs",
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
:slug => "UcqUP0SUfs",
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
:slug => "2JDvtvAAMd",
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
:slug => "2JDvtvAAMd",
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
:body => "
<p>Solar minimum.
</p>
",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "VjhTZ52x4H",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Homeric Minimum ",
:end_year => "-800",
:body => "
<p>Solar minimum.
</p>
",
:tag_list => [],
:event_types => [ @earth ],
:region => @global,
:slug => "VjhTZ52x4H",
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
:slug => "9ymnmxSGva",
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
:slug => "9ymnmxSGva",
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
:slug => "BFzeN6aqPu",
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
:slug => "BFzeN6aqPu",
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
result = Chapter.create({:name => "Mystery Plays and the Revival of Ancient Religions ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "religions",
:book => @book,
:body => "
<p>
The Mystery Plays of the Greeks are a major ethical and religious stream of consciousness in the Western Civilization.
Yet the origin of these plays are a mystery.
They have no prior works in Greece that hold any pattern to what was written during the 6th century BC.
It has been argued that Greece's philosophical heritage came from Egypt during the 7th century BC.
Indeed Plato's ancestor Solon went to Egypt and returned with the story of Atlantis.
</p>
"
})
res = Aside.create({
:name => "The Meeting of Minds",
:body => "
<p>What are we to do?
The People must be instructed in the Lord's Law and Word, yet we have no written script.
Only stories and scraps of stories.
</p>
<p>We met and combined the stories which lead to the freedom of the People into one book: Genesis.
We wove stories together and created books based on Leaders.
We added text to justify God's punishment of peoples.
</p>
<p>We must show God is Just!
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("morrow2015")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "The Cult of Orpheus",
:body => "
<p>
The Cult of Orpheus harkens back to the Pyramid texts found in Egypt.
Orpheus is believed to have studied in Egypt.
</p>
",
:slug => "nsd9N3kfXX",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "Egyptian Pyramid Texts ",
:body => "
<p>
The texts are located in the pyramids of the Fourth and Fifth dynasties of Egypt.
They present Egyptian heaven as a marsh land and reflect the soul of the departed into the night's sky over such a heaven.
Susan Brind Morrow[[dGgKUsXtCP]]  in 'The Dawning Moon of the Mind: Unlocking the Pyramid Texts' presents the texts as 
religious poem reflecting the beginning of Egyptian thought and religion.
Many of the passages of the story harken to a place such as Nabta Playa where the eastern horizon is unencumbered by obstacles.
</p>
",
:slug => "uWDLUVSnQ5",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
biblio = nil
Footnote.create(:slug => "dGgKUsXtCP", :body => "morrow2015", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = Chapter.create({:name => "Enoch - Fall of the Watchers ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "enoch",
:book => @book,
:body => "
<p>With the advancing of time, the size of the Watchers grew accordingly.  
It is natural for very intelligent people to want the sameness of others.
</p>
<p>
That this event could be real is supported by several facts.  
</p>
<ul>
<li>The sudden explosion of Enoch material in the 3rd century BC</li>
<li>The astronomy sections of the Book of Enoch</li>
<li>The rapid development of several forms of mathematics in Greece after the Greek Dark Ages</li>
<li>The appearance of astronomy as part of the Mayan system of life</li>
</ul>
"
})
res = Aside.create({
:name => "Hurry!",
:body => "
<p>The Fools!<br/>
Did they think publishing a story about an event that happened long ago would not have consequences?<br/>
We must hurry before they reveal anymore.<br/>
We must find a new home.<br/>
Take everything, copy it all onto parchment or papyrus.<br/>
But hurry!
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("bible")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("lumpkin2011")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("lumpkin2014")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "The Rebellion ",
:body => "
<p>The difficulty is determining when the rebellion occurred.
Indeed Noah's flood was to end all the decedents of the Watchers and human women.
Yet, the flood did not kill and the descendants of the Watchers.
At least one survived.
</p><p>
Given that the rebellion lists more that a dozen angles, I am incline to say Sumar was the recipient of their knowledge.
The root culture of Sumer seems to come from India and would not have had the baggage that other cultures in the Middle East would have had towards the Watchers. 
It is of course possible that this rebellion happened more than one time with the story of Enoch simply an amalgamation of various stories into one as the Bible writers were want to do.
</p><p>
Curiously, there is a tradition that Mount Hermon on the border between Lebanon and Syria that the oath that the fallen watchers was sworn.
The highest temple in the ancient world known as Qasr Antar had a limestone stele that was translated to say 'According to the command of the greatest a(nd) Holy God, those who take an oath (proceed) from here.'.
Such a statement using the phrase 'greatest a(nd) Holy God' does not seem like the oath that the watchers would have used.
It does raise questions as to who and what oath is mentioned especially in light of the nickname for the mountain as the 'mountain of oath'
Perhaps it was here that newly christened watchers took their oath and began their journey to where they would serve.
</p>
",
:slug => "zANssQus6z",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Issue of Numbers ",
:body => "
<p>Increasing population had brought a significant number of men for the Watch.
Enoch's story of the Watchers/angles/sons of god was just that a rebellion of individuals who traditionally were solitary due to lack of population.  
As population increased, the Watchers moved into the towns to work by creating a building with high wall that lean outwards to reflect the light from fires upward.
The building had two large platforms at the bottom and no roof.
With this development, a Watcher could live anywhere after an initial instruction in what to do and how.
I believe that the first buildings created by the Watchers where the towers in town such as Jerico.
</p>
",
:slug => "L96d42MKAT",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Fall of Greece ",
:body => "
<p>With the fall of the city-states in Greece, the places where a free exchange of ideas fell as well.
Greece standing at the crossroads between Europe and Asia Minor has a history of transitory people. 
From the people with Aegean roots with Anatolian farming techniques in 6,000 BC to the waves of people coming down from Europe during droughts, Greece has been a country of change.
</p><p>
Greece is interesting because of the story of Olympus where the Gods reside.
The legions of the demi-gods which sounds like the Nephilim.
The story of Hercules illustrates the dangers of the Watchers and their offspring.
</p>
",
:slug => "qvBdQaHQm8",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Threat of Rome ",
:body => "
<p>Rome had a way of making everything Roman.  
The threat of the possible take over of the Watchers would have caused them to seeks lands where their ability to discuss and associate freely were unimpaired.
Rome had been controlling not only who could be citizens but who could visit as well.
When Rome destroyed the second temple in Jerusalem, the diaspora that they created carried the Watchers along with the rest of the people as they had been embedded in society by using special buildings.
This diaspora would have spread the Watchers world-wide.
</p>
",
:slug => "SqWMFvhFdx",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = Section.create({:name => "The Transfer of Knowledge ",
:body => "
<p>Around 300 BC, Mayan cultural exploded with written script, astronomy and architecture.
This explosion was based on the Mayan's base 20 math system.
</p>
<p>The Watchers would have known of the existence of the Americas from the exploration crews sent out over the millennia.
Each wave of Watchers exploring the world would have gone to an edge and then returned with their knowledge.
This slow collection would have enabled then to plan for future expansion and if necessary, escape to freer lands.
</p>
",
:slug => "gg0xU2H1M3",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Book of Enoch ", :start_year => -300)
if result.length == 0
result = HoloceneEvent.create({:name => "Book of Enoch ",
:end_year => "-200",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "56ujPTgb6v",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Book of Enoch ",
:end_year => "-200",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "56ujPTgb6v",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@enoch_timeline.holocene_events << result unless @enoch_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "The Last Watcher ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "last_watcher",
:book => @book,
:body => "
<p>Who was the last Watcher?<br/>
One of the questions that came up in writing this book is when did the Watchers end or did they?
The curious name for the Watchers as Sons of God brought up the point that in the New Testament, Jesus is referred to as the Son of God.
What if this concept is based on the idea that Jesus went to the Watchers sometime after the arguing in the temple with the priests.
</p><p>
What if as a Watcher Jesus either decided to betray his oath to the order or was on a mission to do what he did?
If he was a Watcher who betrayed his oath, then the reaction of the Pharisees is understandable in light of the Book of Enoch.
If he was a Watcher on a mission to bring certain concept to the world then who is the last Watcher?
</p><p>
Are they still working, watching the skies as Skywatch?
</p>
"
})
res = Aside.create({
:name => "Alive!",
:body => "
<p>My master told me to prepare the herbs and set the last part of his mission in play.<br/>
We waited.  Praying that we could give him the herbs which would simulate death before he really died.<br/>
Mary gave it to him in the fluid of a sponge.<br/>
He lives!
</p>
",
:chapter_id => result.id
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Chapter.create({:name => "Conclusion ",
:position =>chapter_index,
:show_events => true,
:always_display_events => false,
:slug => "conclusion",
:book => @book,
:body => "
<p>Something.
</p>
"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
result = Chapter.create({:name => "Cultural Events ",
:position =>chapter_index,
:show_events => true,
:always_display_events => true,
:slug => "cultural",
:book => @book,
:body => "
<p>Events caused by Mankind or happened to Mankind.
These events include the towns created, historical landmarks such as wheeled transport, the domestication of plants and animals and other events which show that Man made a change in their perception of the universe.
</p>
"
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
biblio = Biblioentry.find_by_xreflabel("usselo2007")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("foxsay")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("gobeklicult")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("k8538")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = HoloceneEvent.where(:name => "Akhenaten  ", :start_year => -1336)
if result.length == 0
result = HoloceneEvent.create({:name => "Akhenaten  ",
:end_year => "",
:body => "
<p>Akhenaten abandoned polytheism for the worship of Aten or monotheism.
On his death, there was a backlash against Aten worship and monotheism in general.
It is possible this caused the second Exodus of the Israelites from Egypt.
The dates are of his reign as pharaoh.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Akhenaten",
:user_id => @user.id,
:slug => "c3Brt4xqSj",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1336"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Akhenaten  ",
:end_year => "",
:body => "
<p>Akhenaten abandoned polytheism for the worship of Aten or monotheism.
On his death, there was a backlash against Aten worship and monotheism in general.
It is possible this caused the second Exodus of the Israelites from Egypt.
The dates are of his reign as pharaoh.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "c3Brt4xqSj",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Akhenaten",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1336"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Gebel Ramlah ", :start_year => -6500)
if result.length == 0
result = HoloceneEvent.create({:name => "Gebel Ramlah ",
:end_year => "-3600",
:body => "
<p>This site 20 kilometers from Nabta Playa is itself a playa or lake.
It has the oldest known infant cemetery in the world.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Gebel_Ramlah",
:user_id => @user.id,
:slug => "mDgpHm8fd0",
:lat => "22.710278",
:lng => "30.504722",
:start_year_uncert => "",
:start_year => "-6500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gebel Ramlah ",
:end_year => "-3600",
:body => "
<p>This site 20 kilometers from Nabta Playa is itself a playa or lake.
It has the oldest known infant cemetery in the world.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "mDgpHm8fd0",
:lat => "22.710278",
:lng => "30.504722",
:url => "https://en.wikipedia.org/wiki/Gebel_Ramlah",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nekhen ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Nekhen ",
:end_year => "-3200",
:body => "
<p>Nekhen is the city of the Cult of Horus.
It has the earliest temple which was made of wood and the earliest tomb with painted decoration on a plaster wall.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nekhen",
:user_id => @user.id,
:slug => "81EkyAsNPf",
:lat => "25.097222",
:lng => "32.779444",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nekhen ",
:end_year => "-3200",
:body => "
<p>Nekhen is the city of the Cult of Horus.
It has the earliest temple which was made of wood and the earliest tomb with painted decoration on a plaster wall.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "81EkyAsNPf",
:lat => "25.097222",
:lng => "32.779444",
:url => "https://en.wikipedia.org/wiki/Nekhen",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Moscow Mathematical Papyrus ", :start_year => -1850)
if result.length == 0
result = HoloceneEvent.create({:name => "Moscow Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Moscow_Mathematical_Papyrus",
:user_id => @user.id,
:slug => "B2NSCY5TTY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1850"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Moscow Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "B2NSCY5TTY",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Moscow_Mathematical_Papyrus",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1850"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Rhind Mathematical Papyrus ", :start_year => -1542)
if result.length == 0
result = HoloceneEvent.create({:name => "Rhind Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Rhind_Mathematical_Papyrus",
:user_id => @user.id,
:slug => "ZacHAf5BaW",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1542"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rhind Mathematical Papyrus ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "ZacHAf5BaW",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Rhind_Mathematical_Papyrus",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1542"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Lahun Mathematical Papyri ", :start_year => -1825)
if result.length == 0
result = HoloceneEvent.create({:name => "Lahun Mathematical Papyri ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Lahun_Mathematical_Papyri",
:user_id => @user.id,
:slug => "kcKsWXzKjv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1825"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lahun Mathematical Papyri ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "kcKsWXzKjv",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Lahun_Mathematical_Papyri",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1825"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Egyptian Mathematical Leather Roll ", :start_year => -1650)
if result.length == 0
result = HoloceneEvent.create({:name => "Egyptian Mathematical Leather Roll ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Egyptian_Mathematical_Leather_Roll",
:user_id => @user.id,
:slug => "p9CSNN9g24",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Egyptian Mathematical Leather Roll ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "p9CSNN9g24",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Egyptian_Mathematical_Leather_Roll",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1650"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nuragic Civilization ", :start_year => -1700)
if result.length == 0
result = HoloceneEvent.create({:name => "Nuragic Civilization ",
:end_year => "-238",
:body => "
<p>Sardinia may have hosted one of the Sea Peoples.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Nuragic_civilization",
:user_id => @user.id,
:slug => "K18CPZk4uY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nuragic Civilization ",
:end_year => "-238",
:body => "
<p>Sardinia may have hosted one of the Sea Peoples.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "K18CPZk4uY",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Nuragic_civilization",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kokino ", :start_year => -1800)
if result.length == 0
result = HoloceneEvent.create({:name => "Kokino ",
:end_year => "-600",
:body => "
<p>Emphasis is on the Pleiades.
It has stone seats to observe the solstices.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Kokino",
:user_id => @user.id,
:slug => "HSn6W48FeY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kokino ",
:end_year => "-600",
:body => "
<p>Emphasis is on the Pleiades.
It has stone seats to observe the solstices.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "HSn6W48FeY",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Kokino",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "The Gilgamesh Flood Myth ", :start_year => -2100)
if result.length == 0
result = HoloceneEvent.create({:name => "The Gilgamesh Flood Myth ",
:end_year => "-2000",
:body => "
<p>Some say that this poem is where the Biblical text came from for the story of Noah.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Gilgamesh_flood_myth",
:user_id => @user.id,
:slug => "FAy9jypG8T",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Gilgamesh Flood Myth ",
:end_year => "-2000",
:body => "
<p>Some say that this poem is where the Biblical text came from for the story of Noah.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "FAy9jypG8T",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Gilgamesh_flood_myth",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Atra-Hasis - Flood Myth ", :start_year => -1646)
if result.length == 0
result = HoloceneEvent.create({:name => "Atra-Hasis - Flood Myth ",
:end_year => "-1626",
:body => "
<p>The oldest of the Flood Myth scripts.
Poem is older than the dates notes, they are scribe marks noting the reign in which the copy was written.
</p>
",
:tag_list => [""],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Atra-Hasis",
:user_id => @user.id,
:slug => "YabdYk2SSq",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1646"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Atra-Hasis - Flood Myth ",
:end_year => "-1626",
:body => "
<p>The oldest of the Flood Myth scripts.
Poem is older than the dates notes, they are scribe marks noting the reign in which the copy was written.
</p>
",
:tag_list => [""],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "YabdYk2SSq",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Atra-Hasis",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1646"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Period of the Judges ", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Period of the Judges ",
:end_year => "-1100",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dwRxy0bWcZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Period of the Judges ",
:end_year => "-1100",
:body => "",
:tag_list => ["BiblicalEvent"],
:event_types => [  ],
:region => @global,
:slug => "dwRxy0bWcZ",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Alignment of belt stones to Orion ", :start_year => -6400)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Alignment of belt stones to Orion ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "jD7f7xZLPY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Alignment of belt stones to Orion ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "jD7f7xZLPY",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Irrigation at Choga Mami, Sumeria ", :start_year => -4700)
if result.length == 0
result = HoloceneEvent.create({:name => "First Irrigation at Choga Mami, Sumeria ",
:end_year => "-4600",
:body => "
<p>First canal irrigation supporting livestock and arable agriculture.</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Choga_Mami",
:user_id => @user.id,
:slug => "GJ8JcA2ZQs",
:lat => "33.88333",
:lng => "45.44999",
:start_year_uncert => "",
:start_year => "-4700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Irrigation at Choga Mami, Sumeria ",
:end_year => "-4600",
:body => "
<p>First canal irrigation supporting livestock and arable agriculture.</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "GJ8JcA2ZQs",
:lat => "33.88333",
:lng => "45.44999",
:url => "https://en.wikipedia.org/wiki/Choga_Mami",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-4700"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Drought causes change of Occupants ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Drought causes change of Occupants ",
:end_year => "",
:body => "
<p>They had a more complex social structure.  
They constructed the calendar and other stone features associated with Astronomy.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html",
:user_id => @user.id,
:slug => "KYn1auPaqF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Drought causes change of Occupants ",
:end_year => "",
:body => "
<p>They had a more complex social structure.  
They constructed the calendar and other stone features associated with Astronomy.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "KYn1auPaqF",
:lat => "",
:lng => "",
:url => "https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Goats and Sheep Introduced ", :start_year => -6100)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Goats and Sheep Introduced ",
:end_year => "",
:body => "
<p>No new huts or houses accompanied their introduction.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html",
:user_id => @user.id,
:slug => "sGtCUaCGJw",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Goats and Sheep Introduced ",
:end_year => "",
:body => "
<p>No new huts or houses accompanied their introduction.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "sGtCUaCGJw",
:lat => "",
:lng => "",
:url => "https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Potter being made ", :start_year => -6800)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Potter being made ",
:end_year => "",
:body => "
<p>Pottery decorated with a comb in a rocking motion.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html",
:user_id => @user.id,
:slug => "tRPyhsaqdc",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Potter being made ",
:end_year => "",
:body => "
<p>Pottery decorated with a comb in a rocking motion.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "tRPyhsaqdc",
:lat => "",
:lng => "",
:url => "https://web.archive.org/web/20110806140123/http://www.comp-archaeology.org/WendorfSAA98.html",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6800"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Archaeological Evidence of Cheese in Kujawy, Poland ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Archaeological Evidence of Cheese in Kujawy, Poland ",
:end_year => "",
:body => "
<p>Strainers with milk-fat coating found.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Cheese",
:user_id => @user.id,
:slug => "h2Sr9VH3hk",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Archaeological Evidence of Cheese in Kujawy, Poland ",
:end_year => "",
:body => "
<p>Strainers with milk-fat coating found.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "h2Sr9VH3hk",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Cheese",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Proposed Date for Cheese Making ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Proposed Date for Cheese Making ",
:end_year => "",
:body => "
<p>Cheese has been proposed to have been made with the domestication of Sheep.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Cheese",
:user_id => @user.id,
:slug => "ncs3MsTYg7",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Proposed Date for Cheese Making ",
:end_year => "",
:body => "
<p>Cheese has been proposed to have been made with the domestication of Sheep.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @global,
:slug => "ncs3MsTYg7",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Cheese",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "The Great Plague ", :start_year => 1665)
if result.length == 0
result = HoloceneEvent.create({:name => "The Great Plague ",
:end_year => "",
:body => "
<p>Plague strikes London.  30% reduction in the population.
</p>
",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "me7eynA8B1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1665"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Great Plague ",
:end_year => "",
:body => "
<p>Plague strikes London.  30% reduction in the population.
</p>
",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "me7eynA8B1",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Historical")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Historical",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Bubonic Plague")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bubonic Plague",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Year of Darkness - global winter ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "qwpxGtfgpy",
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
:event_types => [ @climate ],
:region => @global,
:slug => "qwpxGtfgpy",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "Gmjd20CjBw",
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
:event_types => [ @cultural ],
:region => @europe,
:slug => "Gmjd20CjBw",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 539)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "GRNHn1Kt0z",
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
:event_types => [ @cultural ],
:region => @europe,
:slug => "GRNHn1Kt0z",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Failure of Bread ", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Failure of Bread ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "dCttU5jNXY",
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
:event_types => [ @cultural ],
:region => @europe,
:slug => "dCttU5jNXY",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Canaanites arrive in eastern Nile Delta starting the Fourteenth Dynasty ", :start_year => -1800)
if result.length == 0
result = HoloceneEvent.create({:name => "Canaanites arrive in eastern Nile Delta starting the Fourteenth Dynasty ",
:end_year => "-1650",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "S14uWet8G1",
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
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "S14uWet8G1",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Hyksos conquer Canaanites and Egyptian Dynasties ", :start_year => -1650)
if result.length == 0
result = HoloceneEvent.create({:name => "Hyksos conquer Canaanites and Egyptian Dynasties ",
:end_year => "-1550",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "hq7RBJ5QF6",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1650"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hyksos conquer Canaanites and Egyptian Dynasties ",
:end_year => "-1550",
:body => "",
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "hq7RBJ5QF6",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Hyksos expelled by Egyptian Dynasties ", :start_year => -1550)
if result.length == 0
result = HoloceneEvent.create({:name => "Hyksos expelled by Egyptian Dynasties ",
:end_year => "",
:body => "",
:tag_list => ["Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "uPEFyaRuU5",
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
:tag_list => ["Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "uPEFyaRuU5",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Bell Beaker people replace builders of Stonehenge ", :start_year => -2500)
if result.length == 0
result = HoloceneEvent.create({:name => "Bell Beaker people replace builders of Stonehenge ",
:end_year => "",
:body => "
<p>There was a population replacement.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "pC5h5xS1qF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bell Beaker people replace builders of Stonehenge ",
:end_year => "",
:body => "
<p>There was a population replacement.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "pC5h5xS1qF",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Builders of Stonehenge migrate to England ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Builders of Stonehenge migrate to England ",
:end_year => "-4000",
:body => "
<p>They had Aegean ancestry with Anatolian farming techniques.
They moved through Iberia before going north.
There was a population replacement.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "0B8EzaFzXj",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Builders of Stonehenge migrate to England ",
:end_year => "-4000",
:body => "
<p>They had Aegean ancestry with Anatolian farming techniques.
They moved through Iberia before going north.
There was a population replacement.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "0B8EzaFzXj",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Sea People at the Nile Delta ", :start_year => -1188)
if result.length == 0
result = HoloceneEvent.create({:name => "Sea People at the Nile Delta ",
:end_year => "-1177",
:body => "
<p>They came by land.
</p>
",
:tag_list => ["Egypt", "SeaPeople", "SeaPeople"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "usVvrBkX2u",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1188"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sea People at the Nile Delta ",
:end_year => "-1177",
:body => "
<p>They came by land.
</p>
",
:tag_list => ["Egypt", "SeaPeople", "SeaPeople"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "usVvrBkX2u",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1188"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Canaan impacted by the Sea People ", :start_year => -1185)
if result.length == 0
result = HoloceneEvent.create({:name => "Canaan impacted by the Sea People ",
:end_year => "",
:body => "
<p>They came by land.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "Apbfu0YmyV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1185"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Canaan impacted by the Sea People ",
:end_year => "",
:body => "
<p>They came by land.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "Apbfu0YmyV",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1185"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Onomasticon of Amenope ", :start_year => -1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Onomasticon of Amenope ",
:end_year => "",
:body => "
<p>Egyptian document which lists peoples and places.  It lists about 7 groups of Sea People.
It gives credence to the idea that the Egyptians settled the Sea People in Canaan.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople", "Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "y12VYwtjt3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Onomasticon of Amenope ",
:end_year => "",
:body => "
<p>Egyptian document which lists peoples and places.  It lists about 7 groups of Sea People.
It gives credence to the idea that the Egyptians settled the Sea People in Canaan.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople", "Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "y12VYwtjt3",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Destruction of Ugarit ", :start_year => -1192)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Ugarit ",
:end_year => "-1175",
:body => "
<p>Clay tablets describe part of the Sea People.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "H0w89sU5LL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1192"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Ugarit ",
:end_year => "-1175",
:body => "
<p>Clay tablets describe part of the Sea People.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "H0w89sU5LL",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1192"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Destruction of Mycenae ", :start_year => -1210)
if result.length == 0
result = HoloceneEvent.create({:name => "Destruction of Mycenae ",
:end_year => "-1200",
:body => "
<p>This event included both the Palaces and city attached as well. 
</p>
",
:tag_list => ["SeaPeople", "SeaPeople"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "aW3Rp4gbEc",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1210"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Mycenae ",
:end_year => "-1200",
:body => "
<p>This event included both the Palaces and city attached as well. 
</p>
",
:tag_list => ["SeaPeople", "SeaPeople"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "aW3Rp4gbEc",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1210"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ramesses III narrative ", :start_year => -1150)
if result.length == 0
result = HoloceneEvent.create({:name => "Ramesses III narrative ",
:end_year => "",
:body => "
<p>Ramesses III fought the Sea People several times.  Each group had brought their families along and Ramesses III eventually settled each group in Canaan.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople", "Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Sea_Peoples",
:user_id => @user.id,
:slug => "cvFg5ERUrt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ramesses III narrative ",
:end_year => "",
:body => "
<p>Ramesses III fought the Sea People several times.  Each group had brought their families along and Ramesses III eventually settled each group in Canaan.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople", "Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "cvFg5ERUrt",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Sea_Peoples",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1150"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Merneptah narrative on the Sea People ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Merneptah narrative on the Sea People ",
:end_year => "",
:body => "
<p>This narrative speaks of the groups that attacked brought their wives and children.  
Additionally, their count of the dead reveal that the Ekwesh were circumcised.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople", "Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Sea_Peoples",
:user_id => @user.id,
:slug => "W924wQyPbX",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Merneptah narrative on the Sea People ",
:end_year => "",
:body => "
<p>This narrative speaks of the groups that attacked brought their wives and children.  
Additionally, their count of the dead reveal that the Ekwesh were circumcised.
</p>
",
:tag_list => ["SeaPeople", "SeaPeople", "Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "W924wQyPbX",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Sea_Peoples",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ramesses II Narrative on the Sea People ", :start_year => -2100)
if result.length == 0
result = HoloceneEvent.create({:name => "Ramesses II Narrative on the Sea People ",
:end_year => "",
:body => "
<p>Ramesses II fights the Sherden and captures them.
They are incorporated into the Army and fight at the Battle of Kedesh.
</p>
",
:tag_list => ["SeaPeople", "Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Sea_Peoples",
:user_id => @user.id,
:slug => "st21gxvfvy",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ramesses II Narrative on the Sea People ",
:end_year => "",
:body => "
<p>Ramesses II fights the Sherden and captures them.
They are incorporated into the Army and fight at the Battle of Kedesh.
</p>
",
:tag_list => ["SeaPeople", "Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "st21gxvfvy",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Sea_Peoples",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-2100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sea People")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sea People",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Neolithic settlements in Greece ", :start_year => -7000)
if result.length == 0
result = HoloceneEvent.create({:name => "Neolithic settlements in Greece ",
:end_year => "-6000",
:body => "
<p>Oldest neolithic structures in Europe by several centuries.</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Greece",
:user_id => @user.id,
:slug => "yhuUcPP8gM",
:lat => "37.966667",
:lng => "23.716667",
:start_year_uncert => "",
:start_year => "-7000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Neolithic settlements in Greece ",
:end_year => "-6000",
:body => "
<p>Oldest neolithic structures in Europe by several centuries.</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "yhuUcPP8gM",
:lat => "37.966667",
:lng => "23.716667",
:url => "https://en.wikipedia.org/wiki/Greece",
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
result = HoloceneEvent.where(:name => "The Battle of Kedesh ", :start_year => -1274)
if result.length == 0
result = HoloceneEvent.create({:name => "The Battle of Kedesh ",
:end_year => "",
:body => "
<p>The draw created by the Battle of Kedesh created militaristic companies which would lead to the final collapse of the Bronze Age.
</p>
",
:tag_list => ["Egypt", "Hittites"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Battle_of_Kadesh",
:user_id => @user.id,
:slug => "NrD9FzZQZH",
:lat => "34.55781",
:lng => "36.5196",
:start_year_uncert => "",
:start_year => "-1274"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Battle of Kedesh ",
:end_year => "",
:body => "
<p>The draw created by the Battle of Kedesh created militaristic companies which would lead to the final collapse of the Bronze Age.
</p>
",
:tag_list => ["Egypt", "Hittites"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "NrD9FzZQZH",
:lat => "34.55781",
:lng => "36.5196",
:url => "https://en.wikipedia.org/wiki/Battle_of_Kadesh",
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
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Hittites")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Hittites",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Peace Treaty for the Battle of Kedesh ", :start_year => -1258)
if result.length == 0
result = HoloceneEvent.create({:name => "Peace Treaty for the Battle of Kedesh ",
:end_year => "",
:body => "
<p>Peace treaty between Egypt and the Hittites signed 15 years after the battle of Kedesh. A replica of one of the silver tables is on display at the U.N.
</p>
",
:tag_list => ["Egypt", "Hittites"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Battle_of_Kadesh",
:user_id => @user.id,
:slug => "4L2LScTDbN",
:lat => "34.55781",
:lng => "36.5196",
:start_year_uncert => "",
:start_year => "-1258"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Peace Treaty for the Battle of Kedesh ",
:end_year => "",
:body => "
<p>Peace treaty between Egypt and the Hittites signed 15 years after the battle of Kedesh. A replica of one of the silver tables is on display at the U.N.
</p>
",
:tag_list => ["Egypt", "Hittites"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "4L2LScTDbN",
:lat => "34.55781",
:lng => "36.5196",
:url => "https://en.wikipedia.org/wiki/Battle_of_Kadesh",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1258"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Hittites")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Hittites",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Blick Mead ", :start_year => -10000)
if result.length == 0
result = HoloceneEvent.create({:name => "Blick Mead ",
:end_year => "-6000",
:body => "
<p>Home of the builders of Stonehenge.  Britian's first city.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Blick_Mead",
:user_id => @user.id,
:slug => "wLmvxdk8Ba",
:lat => "51.1774",
:lng => "1.7878",
:start_year_uncert => "",
:start_year => "-10000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blick Mead ",
:end_year => "-6000",
:body => "
<p>Home of the builders of Stonehenge.  Britian's first city.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "wLmvxdk8Ba",
:lat => "51.1774",
:lng => "1.7878",
:url => "https://en.wikipedia.org/wiki/Blick_Mead",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Goloring ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Goloring ",
:end_year => "-800",
:body => "
<p>It is located near Koblenz, Germany.</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Goloring",
:user_id => @user.id,
:slug => "JQgBgJ32tB",
:lat => "50.339167",
:lng => "7.439722",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Goloring ",
:end_year => "-800",
:body => "
<p>It is located near Koblenz, Germany.</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "JQgBgJ32tB",
:lat => "50.339167",
:lng => "7.439722",
:url => "https://en.wikipedia.org/wiki/Goloring",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ziusudra ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Ziusudra ",
:end_year => "",
:body => "
<p>Ziusudra was the Sumerian King during Noah's Flood.</p>
",
:tag_list => ["Sumerian"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Ziusudra",
:user_id => @user.id,
:slug => "tPpUMrVfDK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ziusudra ",
:end_year => "",
:body => "
<p>Ziusudra was the Sumerian King during Noah's Flood.</p>
",
:tag_list => ["Sumerian"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "tPpUMrVfDK",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Ziusudra",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Sumerian")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Sumerian",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Kortik Tepe ", :start_year => -10400)
if result.length == 0
result = HoloceneEvent.create({:name => "Kortik Tepe ",
:end_year => "-9700",
:body => "
<p>Established during the Younger Dryas.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "UzeMFtPTMR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kortik Tepe ",
:end_year => "-9700",
:body => "
<p>Established during the Younger Dryas.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @neareast,
:slug => "UzeMFtPTMR",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10400"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Book of Enoch ", :start_year => -300)
if result.length == 0
result = HoloceneEvent.create({:name => "Book of Enoch ",
:end_year => "-200",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Book_of_Enoch",
:user_id => @user.id,
:slug => "rn86naGKmQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Book of Enoch ",
:end_year => "-200",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "rn86naGKmQ",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Book_of_Enoch",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-300"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Warren Field - oldest calendar ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Warren Field - oldest calendar ",
:end_year => "",
:body => "
<p>First known calendar.  It tracked the moon as well as having a pit and prominence aligning with the midwinter solstice.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Warren_Field",
:user_id => @user.id,
:slug => "Jd6sAGdbWA",
:lat => "57.061295",
:lng => "2.430772",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Warren Field - oldest calendar ",
:end_year => "",
:body => "
<p>First known calendar.  It tracked the moon as well as having a pit and prominence aligning with the midwinter solstice.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "Jd6sAGdbWA",
:lat => "57.061295",
:lng => "2.430772",
:url => "https://en.wikipedia.org/wiki/Warren_Field",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Start of Cuneiform writing", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Start of Cuneiform writing",
:end_year => "-3000",
:body => "
<p>Sumerian city of Uruk</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:slug => "E2egfZUrDP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Start of Cuneiform writing",
:end_year => "-3000",
:body => "
<p>Sumerian city of Uruk</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "E2egfZUrDP",
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
result = HoloceneEvent.where(:name => "Cuneiform writing conveys concepts as well i.e. honour vs an honourable man", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Cuneiform writing conveys concepts as well i.e. honour vs an honourable man",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient.eu/cuneiform/",
:user_id => @user.id,
:slug => "HQLd2ZyfWh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cuneiform writing conveys concepts as well i.e. honour vs an honourable man",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "HQLd2ZyfWh",
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
:slug => "EkPWvrRdbQ",
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
:slug => "EkPWvrRdbQ",
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
:body => "
<p>Tablet describes calculating the orbit of Jupiter.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "qtESJV1GuH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Babylonian Table describing rudimentary form of integral calculus ",
:end_year => "-50",
:body => "
<p>Tablet describes calculating the orbit of Jupiter.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "qtESJV1GuH",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "K8538 - Sumerian Star Map ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "
<p>A 1,500 year old copy when the library that it was in was destroyed preserving the disk.
It is an eight section description of an impact event which created Umm al Binni[[q7kd078mgG]] .
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "9jGCV7Pumu",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "K8538 - Sumerian Star Map ",
:end_year => "",
:body => "
<p>A 1,500 year old copy when the library that it was in was destroyed preserving the disk.
It is an eight section description of an impact event which created Umm al Binni[[q7kd078mgG]] .
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "9jGCV7Pumu",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "q7kd078mgG", :body => "K8538", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Wine-like drink developed in China ", :start_year => -7000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine-like drink developed in China ",
:end_year => "",
:body => "
<p>A grape-based fermented drink was found.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @fareast,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "sDexCPaqGk",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wine-like drink developed in China ",
:end_year => "",
:body => "
<p>A grape-based fermented drink was found.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @fareast,
:slug => "sDexCPaqGk",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "7Y0Mpu305b",
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
:slug => "7Y0Mpu305b",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Wine in Georgia ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Georgia ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "nEJub9huj8",
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
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "nEJub9huj8",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Wine in Iran ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Iran ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "wdT5KNyxZ9",
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
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "wdT5KNyxZ9",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Wine in Greece ", :start_year => -4500)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Greece ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "hC536qbBSK",
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
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "hC536qbBSK",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Wine in Egypt ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication", "Egypt"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "hTPN9qfp8d",
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
:tag_list => ["Domestication", "Egypt"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "hTPN9qfp8d",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Wine in Sicily ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Wine in Sicily ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "wbvVKWHtDm",
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
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "wbvVKWHtDm",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Oldest Winery in Armenia ", :start_year => -4100)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest Winery in Armenia ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/History_of_wine",
:user_id => @user.id,
:slug => "Jt0tW2dZRY",
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
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @eastasia,
:slug => "Jt0tW2dZRY",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ka ", :start_year => -3150)
if result.length == 0
result = HoloceneEvent.create({:name => "Ka ",
:end_year => "-3100",
:body => "
<p>He is the earliest known Egyptian king with a serekh inscribed on a number of artifacts.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Ka_(pharaoh)",
:user_id => @user.id,
:slug => "epKv7ZeHJM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ka ",
:end_year => "-3100",
:body => "
<p>He is the earliest known Egyptian king with a serekh inscribed on a number of artifacts.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "epKv7ZeHJM",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Ka_(pharaoh)",
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
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Scorpion I ", :start_year => -3200)
if result.length == 0
result = HoloceneEvent.create({:name => "Scorpion I ",
:end_year => "-3150",
:body => "
<p>Scorpion I seems to have started Egypt towards written language.  
Evidence found in his tomb suggests writing was developed to record tribute from conquered cities.  
He was buried with imported grape wine laced with medicinal herbs as well as wine, dried grapes, grape seed and skins.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "crgc19GZCK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Scorpion I ",
:end_year => "-3150",
:body => "
<p>Scorpion I seems to have started Egypt towards written language.  
Evidence found in his tomb suggests writing was developed to record tribute from conquered cities.  
He was buried with imported grape wine laced with medicinal herbs as well as wine, dried grapes, grape seed and skins.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "crgc19GZCK",
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
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Gilgal", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "Gilgal",
:end_year => "",
:body => "
<p>Carbonized figs from a variant which can only be propagated by hand found dated to 9,400 BC.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "AKrEFCLJrG",
:lat => "32.032778",
:lng => "35.475556",
:start_year_uncert => "",
:start_year => "-9500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gilgal",
:end_year => "",
:body => "
<p>Carbonized figs from a variant which can only be propagated by hand found dated to 9,400 BC.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "AKrEFCLJrG",
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
result = HoloceneEvent.where(:name => "Scorpion II ", :start_year => -3100)
if result.length == 0
result = HoloceneEvent.create({:name => "Scorpion II ",
:end_year => "-3100",
:body => "
<p>Starts conquest of Lower Egypt to unify Egypt. 
Scorpion II could have been killed early on in the battle to unite Egypt.  
So we hear about the start of the war but not the victory.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "gfPpkF3PXW",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Scorpion II ",
:end_year => "-3100",
:body => "
<p>Starts conquest of Lower Egypt to unify Egypt. 
Scorpion II could have been killed early on in the battle to unite Egypt.  
So we hear about the start of the war but not the victory.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "gfPpkF3PXW",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Narmer ", :start_year => -3100)
if result.length == 0
result = HoloceneEvent.create({:name => "Narmer ",
:end_year => "-3050",
:body => "
<p>Finishes conquest of Lower Egypt to unify Egypt started by/with Scorpion II.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "kzD8W8wbJG",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Narmer ",
:end_year => "-3050",
:body => "
<p>Finishes conquest of Lower Egypt to unify Egypt started by/with Scorpion II.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "kzD8W8wbJG",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3100"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Megalith period  ", :start_year => -3600)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Megalith period  ",
:end_year => "",
:body => "
<p>Alignment of megalith stones to Sirius, Arcturus, Alpha Centauri and the Belt of Orion.
</p>
<p>By 3,600 BC Nabta Playa was abandoned due to lack of water.  No rail fall meant the well dried up.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "dBXvEzAb96",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-3600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Megalith period  ",
:end_year => "",
:body => "
<p>Alignment of megalith stones to Sirius, Arcturus, Alpha Centauri and the Belt of Orion.
</p>
<p>By 3,600 BC Nabta Playa was abandoned due to lack of water.  No rail fall meant the well dried up.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "dBXvEzAb96",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3600"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Beginning occupation ", :start_year => -10000)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Beginning occupation ",
:end_year => "-8000",
:body => "
<p>Around 10,000 BC the region around Nabta Playa started receiving more rainfall.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "ggAFHNbg2m",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-10000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Beginning occupation ",
:end_year => "-8000",
:body => "
<p>Around 10,000 BC the region around Nabta Playa started receiving more rainfall.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "ggAFHNbg2m",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Large scale occupation ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Large scale occupation ",
:end_year => "-7000",
:body => "
<p>Water came from deep wells.  
Sustenance included fruit, legumes, millets, sorghum and tubers.  
Goats and sheep were imported.
They had organized villages with small huts in straight rows.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "uhvRwwTqzH",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Large scale occupation ",
:end_year => "-7000",
:body => "
<p>Water came from deep wells.  
Sustenance included fruit, legumes, millets, sorghum and tubers.  
Goats and sheep were imported.
They had organized villages with small huts in straight rows.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "uhvRwwTqzH",
:lat => "22.51",
:lng => "30.73",
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Construction of stone calendar ", :start_year => -4800)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Construction of stone calendar ",
:end_year => "",
:body => "
<p>This was the creation of a smaller stone circle inside those set earlier.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "Ph02PPw1vC",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-4800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Construction of stone calendar ",
:end_year => "",
:body => "
<p>This was the creation of a smaller stone circle inside those set earlier.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "Ph02PPw1vC",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Nabta Playa, Egypt - Alignment of megalithic stones ", :start_year => -6270)
if result.length == 0
result = HoloceneEvent.create({:name => "Nabta Playa, Egypt - Alignment of megalithic stones ",
:end_year => "",
:body => "
<p>Megalithic stones set to Orion's Belt and other stars.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Nabta_Playa",
:user_id => @user.id,
:slug => "ay2JJ1Xv1c",
:lat => "22.51",
:lng => "30.73",
:start_year_uncert => "",
:start_year => "-6270"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nabta Playa, Egypt - Alignment of megalithic stones ",
:end_year => "",
:body => "
<p>Megalithic stones set to Orion's Belt and other stars.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "ay2JJ1Xv1c",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge before the monument ", :start_year => -8000)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge before the monument ",
:end_year => "",
:body => "
<p>Four or possibly five post hole were found aligned in an East-West axis dated to 8,000 BC.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "eCaVKWcRaU",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge before the monument ",
:end_year => "",
:body => "
<p>Four or possibly five post hole were found aligned in an East-West axis dated to 8,000 BC.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "eCaVKWcRaU",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 1 ", :start_year => -3100)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 1 ",
:end_year => "",
:body => "
<p>A circular bank and ditch enclosure with a large opening to northeast and a smaller one to the south.  In side the enclosure are the 56
Aubery stones.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "KcETGSZEE3",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-3100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 1 ",
:end_year => "",
:body => "
<p>A circular bank and ditch enclosure with a large opening to northeast and a smaller one to the south.  In side the enclosure are the 56
Aubery stones.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "KcETGSZEE3",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 2 ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 2 ",
:end_year => "",
:body => "
<p>Structures built within the enclosure.  Aubery holes being used as cremation urns.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "ymwLWCy3Mm",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 2 ",
:end_year => "",
:body => "
<p>Structures built within the enclosure.  Aubery holes being used as cremation urns.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "ymwLWCy3Mm",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 3 I ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 I ",
:end_year => "",
:body => "
<p>Timber abandoned in favour of stone.  Standing stones in two inner circles setup.  80 stones in total.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "zY2JPHMGCD",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 I ",
:end_year => "",
:body => "
<p>Timber abandoned in favour of stone.  Standing stones in two inner circles setup.  80 stones in total.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "zY2JPHMGCD",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 3 II ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 II ",
:end_year => "-2400",
:body => "
<p>Sarsen stones erected.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "gTnDFpfMve",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 II ",
:end_year => "-2400",
:body => "
<p>Sarsen stones erected.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "gTnDFpfMve",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 3 III ", :start_year => -2400)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 III ",
:end_year => "-2280",
:body => "
<p>Blue stones re-erected.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "3VM0ByVuKz",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 III ",
:end_year => "-2280",
:body => "
<p>Blue stones re-erected.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "3VM0ByVuKz",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 3 IV ", :start_year => -2280)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 IV ",
:end_year => "-1930",
:body => "
<p>Arrangement of the Blue stones in a circle between the two Sarsen stone rings.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "EQ5KL69ecK",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-2280"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 IV ",
:end_year => "-1930",
:body => "
<p>Arrangement of the Blue stones in a circle between the two Sarsen stone rings.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "EQ5KL69ecK",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge 3 V ", :start_year => -1930)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge 3 V ",
:end_year => "-1600",
:body => "
<p>Removal of Blue stone to form horseshoe-shaped setting as now seen at Stonehenge.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "K0nEvTwZuG",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-1930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge 3 V ",
:end_year => "-1600",
:body => "
<p>Removal of Blue stone to form horseshoe-shaped setting as now seen at Stonehenge.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "K0nEvTwZuG",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Stonehenge - Post construction ", :start_year => -1600)
if result.length == 0
result = HoloceneEvent.create({:name => "Stonehenge - Post construction ",
:end_year => "",
:body => "
<p>Y and Z wholes are the last items added to the monument.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "sWgk06YtgM",
:lat => "51.178889",
:lng => "-1.826111",
:start_year_uncert => "",
:start_year => "-1600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Stonehenge - Post construction ",
:end_year => "",
:body => "
<p>Y and Z wholes are the last items added to the monument.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "sWgk06YtgM",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Almendres Cromlech I ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "Almendres Cromlech I ",
:end_year => "",
:body => "
<p>Construction of two rings using standing stones.  None are as large as Stonehenge.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Almendres_Cromlech",
:user_id => @user.id,
:slug => "fWbstAJxxZ",
:lat => "38.557475",
:lng => "-8.061119",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Almendres Cromlech I ",
:end_year => "",
:body => "
<p>Construction of two rings using standing stones.  None are as large as Stonehenge.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "fWbstAJxxZ",
:lat => "38.557475",
:lng => "-8.061119",
:url => "https://en.wikipedia.org/wiki/Almendres_Cromlech",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Almendres Cromlech II ", :start_year => -5000)
if result.length == 0
result = HoloceneEvent.create({:name => "Almendres Cromlech II ",
:end_year => "",
:body => "
<p>Two oblong rings added to west of circles.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Almendres_Cromlech",
:user_id => @user.id,
:slug => "s4T3q4p31d",
:lat => "38.557475",
:lng => "-8.061119",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Almendres Cromlech II ",
:end_year => "",
:body => "
<p>Two oblong rings added to west of circles.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "s4T3q4p31d",
:lat => "38.557475",
:lng => "-8.061119",
:url => "https://en.wikipedia.org/wiki/Almendres_Cromlech",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Almendres Cromlech III ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Almendres Cromlech III ",
:end_year => "",
:body => "
<p>Modification of the stone groupings many assoicated with the Equinoxs.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Almendres_Cromlech",
:user_id => @user.id,
:slug => "J8EPj0vceq",
:lat => "38.557475",
:lng => "-8.061119",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Almendres Cromlech III ",
:end_year => "",
:body => "
<p>Modification of the stone groupings many assoicated with the Equinoxs.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "J8EPj0vceq",
:lat => "38.557475",
:lng => "-8.061119",
:url => "https://en.wikipedia.org/wiki/Almendres_Cromlech",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Gesher", :start_year => -10459)
if result.length == 0
result = HoloceneEvent.create({:name => "Gesher",
:end_year => "",
:body => "
<p>Possible center of Neolithic Revolution.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Gesher_(archaeological_site)",
:user_id => @user.id,
:slug => "VcELE9ZLqH",
:lat => "32.602778",
:lng => "35.555556",
:start_year_uncert => "348",
:start_year => "-10459"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gesher",
:end_year => "",
:body => "
<p>Possible center of Neolithic Revolution.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "VcELE9ZLqH",
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
result = HoloceneEvent.where(:name => "Sippy cup appears in pottery ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Sippy cup appears in pottery ",
:end_year => "",
:body => "
<p>Sippy cup used to feed children found in excavations.</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient-origins.net/news-history-archaeology/baby-bottles-0012631",
:user_id => @user.id,
:slug => "zpmVtReXh1",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sippy cup appears in pottery ",
:end_year => "",
:body => "
<p>Sippy cup used to feed children found in excavations.</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "zpmVtReXh1",
:lat => "",
:lng => "",
:url => "https://www.ancient-origins.net/news-history-archaeology/baby-bottles-0012631",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-5500"
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
:slug => "td6mC2BSQp",
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
:slug => "td6mC2BSQp",
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
result = HoloceneEvent.where(:name => "Bread is made ", :start_year => -12500)
if result.length == 0
result = HoloceneEvent.create({:name => "Bread is made ",
:end_year => "",
:body => "
<p>Wild wheat and barley mixed with crushed tubers such as Rushes.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Natufian_culture",
:user_id => @user.id,
:slug => "Zc16GrfhqB",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bread is made ",
:end_year => "",
:body => "
<p>Wild wheat and barley mixed with crushed tubers such as Rushes.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "Zc16GrfhqB",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Natufian_culture",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-12500"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Gobekli Tepe - Beer ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - Beer ",
:end_year => "-8000",
:body => "
<p>Beer residue found in troughs[[ShLHch0MwY]] .
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "HmHmMBEUFv",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - Beer ",
:end_year => "-8000",
:body => "
<p>Beer residue found in troughs[[ShLHch0MwY]] .
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "HmHmMBEUFv",
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
biblio = nil
Footnote.create(:slug => "ShLHch0MwY", :body => "GobekliCult", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Beer", :start_year => -11000)
if result.length == 0
result = HoloceneEvent.create({:name => "Beer",
:end_year => "",
:body => "
<p>Had the consistency of gruel.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "5EY8jHftMg",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-11000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Beer",
:end_year => "",
:body => "
<p>Had the consistency of gruel.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "5EY8jHftMg",
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
:slug => "JdbEhAKfxw",
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
:slug => "JdbEhAKfxw",
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
:body => "
<p>Oldest wheel found.  Wheel was for a pushcart.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "WEZ0HTpV86",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ljubljana Marshes Wheel",
:end_year => "",
:body => "
<p>Oldest wheel found.  Wheel was for a pushcart.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "WEZ0HTpV86",
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
:slug => "VPRqyx9ue7",
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
:slug => "VPRqyx9ue7",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Propagation of Fig trees at Gilgal ", :start_year => -9400)
if result.length == 0
result = HoloceneEvent.create({:name => "Propagation of Fig trees at Gilgal ",
:end_year => "",
:body => "
<p>Variant can only be propagated by hand.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "XT0nvLDFP9",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Propagation of Fig trees at Gilgal ",
:end_year => "",
:body => "
<p>Variant can only be propagated by hand.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "XT0nvLDFP9",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "00pZXaEgB2",
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
:slug => "00pZXaEgB2",
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
result = HoloceneEvent.where(:name => "Woodhenge created ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Woodhenge created ",
:end_year => "-2400",
:body => "
<p>Wood ring structure with parts similar to Stonehenge.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Woodhenge",
:user_id => @user.id,
:slug => "rGDbUD39Du",
:lat => "51.1894",
:lng => "1.78576",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Woodhenge created ",
:end_year => "-2400",
:body => "
<p>Wood ring structure with parts similar to Stonehenge.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "rGDbUD39Du",
:lat => "51.1894",
:lng => "1.78576",
:url => "https://en.wikipedia.org/wiki/Woodhenge",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Wood circle created at Durrington Walls ", :start_year => -2600)
if result.length == 0
result = HoloceneEvent.create({:name => "Wood circle created at Durrington Walls ",
:end_year => "",
:body => "
<p>Four circles with an opening to the southeast for midwinter solstice.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Durrington_Walls",
:user_id => @user.id,
:slug => "UcFCfFGsAz",
:lat => "51.1925",
:lng => "1.786667",
:start_year_uncert => "",
:start_year => "-2600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Wood circle created at Durrington Walls ",
:end_year => "",
:body => "
<p>Four circles with an opening to the southeast for midwinter solstice.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "UcFCfFGsAz",
:lat => "51.1925",
:lng => "1.786667",
:url => "https://en.wikipedia.org/wiki/Durrington_Walls",
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
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Work started on The Cursus at Stonehenge ", :start_year => -3630)
if result.length == 0
result = HoloceneEvent.create({:name => "Work started on The Cursus at Stonehenge ",
:end_year => "-3375",
:body => "
<p>The Cursus is aligned on the equinox sunrise which rises over the eastern long barrow.  Two artificial pits at either end of the Cursus aligns
with the sunrise and sunset at mid-summer to a point in Stonehenge.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Stonehenge_Cursus",
:user_id => @user.id,
:slug => "M73ZbBymxb",
:lat => "51.186",
:lng => "1.826",
:start_year_uncert => "",
:start_year => "-3630"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Work started on The Cursus at Stonehenge ",
:end_year => "-3375",
:body => "
<p>The Cursus is aligned on the equinox sunrise which rises over the eastern long barrow.  Two artificial pits at either end of the Cursus aligns
with the sunrise and sunset at mid-summer to a point in Stonehenge.
</p>
",
:tag_list => ["Stonehenge", "Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @europe,
:slug => "M73ZbBymxb",
:lat => "51.186",
:lng => "1.826",
:url => "https://en.wikipedia.org/wiki/Stonehenge_Cursus",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3630"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Stonehenge")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Stonehenge",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Gesher", :start_year => -10459)
if result.length == 0
result = HoloceneEvent.create({:name => "Gesher",
:end_year => "",
:body => "
<p>Possible center of Neolithic Revolution.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Gesher_(archaeological_site)",
:user_id => @user.id,
:slug => "pWZ2Jjehr9",
:lat => "32.602778",
:lng => "35.555556",
:start_year_uncert => "348",
:start_year => "-10459"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gesher",
:end_year => "",
:body => "
<p>Possible center of Neolithic Revolution.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "pWZ2Jjehr9",
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
result = HoloceneEvent.where(:name => "Zorats Karer(Carahunge) ", :start_year => -5500)
if result.length == 0
result = HoloceneEvent.create({:name => "Zorats Karer(Carahunge) ",
:end_year => "",
:body => "
<p>The 'Armenian Stonehenge'.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "G53RR2BzWn",
:lat => "39.5507",
:lng => "46.0286",
:start_year_uncert => "",
:start_year => "-5500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zorats Karer(Carahunge) ",
:end_year => "",
:body => "
<p>The 'Armenian Stonehenge'.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @eurasia,
:slug => "G53RR2BzWn",
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
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "k4YVW9JqNQ",
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
:slug => "k4YVW9JqNQ",
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
:slug => "J9B3NHNARJ",
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
:slug => "J9B3NHNARJ",
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
:slug => "Nrf1qs55qB",
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
:slug => "Nrf1qs55qB",
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
:slug => "5vu9bUqB1D",
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
:slug => "5vu9bUqB1D",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "JzS2xjhHun",
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
:slug => "JzS2xjhHun",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
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
:slug => "DW03CMgtLU",
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
:slug => "DW03CMgtLU",
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
:slug => "uaKzJYb5JL",
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
:slug => "uaKzJYb5JL",
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
:body => "
<p>Initial habitation was intermittent due to the droughts and cold of the Younger Dryas time period.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Jericho",
:user_id => @user.id,
:slug => "s5FN4jHDaJ",
:lat => "31.871111",
:lng => "35.444167",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Jericho is founded ",
:end_year => "",
:body => "
<p>Initial habitation was intermittent due to the droughts and cold of the Younger Dryas time period.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "s5FN4jHDaJ",
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
:body => "
<p>The tower seems to have been created as an anti-flooding system.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tower_of_Jericho",
:user_id => @user.id,
:slug => "HzQzF8Hszm",
:lat => "31.871111",
:lng => "35.444167",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "
<p>The tower seems to have been created as an anti-flooding system.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "HzQzF8Hszm",
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
:body => "
<p>The tower seems to have been created as an anti-flooding system.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tower_of_Jericho",
:user_id => @user.id,
:slug => "KFp0Py4MMT",
:lat => "31.871111",
:lng => "35.444167",
:start_year_uncert => "",
:start_year => "-8300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tower of Jericho is completed ",
:end_year => "",
:body => "
<p>The tower seems to have been created as an anti-flooding system.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "KFp0Py4MMT",
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
:body => "
<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>
",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [  @person ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "wsyqYTqC0R",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1322"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Suppiluliuma I died in the plague which spread across the region ",
:end_year => "",
:body => "
<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>
",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_types => [ @person ],
:region => @middleeast,
:slug => "wsyqYTqC0R",
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
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Bubonic Plague")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bubonic Plague",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "K1BKscg7fr",
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
:slug => "K1BKscg7fr",
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
result = HoloceneEvent.where(:name => "Sweet Track in Britain ", :start_year => -3807)
if result.length == 0
result = HoloceneEvent.create({:name => "Sweet Track in Britain ",
:end_year => "",
:body => "
<p>Trackway built over older trackway from 3838 BC.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Sweet_Track",
:user_id => @user.id,
:slug => "KQ3XBLwNLX",
:lat => "51.164167",
:lng => "-2.826389",
:start_year_uncert => "",
:start_year => "-3807"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sweet Track in Britain ",
:end_year => "",
:body => "
<p>Trackway built over older trackway from 3838 BC.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "KQ3XBLwNLX",
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
:body => "
<p>Doctor during the Antonine Plague.
</p>
",
:tag_list => [],
:event_types => [  @person ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pjawg4FQbQ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "216"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Galen ",
:end_year => "",
:body => "
<p>Doctor during the Antonine Plague.
</p>
",
:tag_list => [],
:event_types => [ @person ],
:region => @global,
:slug => "pjawg4FQbQ",
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
result = HoloceneEvent.where(:name => "Antonine Plague - First appearance of Smallpox ", :start_year => 165)
if result.length == 0
result = HoloceneEvent.create({:name => "Antonine Plague - First appearance of Smallpox ",
:end_year => "180",
:body => "",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "ZKHLTQwLE0",
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
:event_types => [ @epidemic ],
:region => @europe,
:slug => "ZKHLTQwLE0",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Plague of Cyprian - Second appearance of Smallpox ", :start_year => 251)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Cyprian - Second appearance of Smallpox ",
:end_year => "270",
:body => "",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "sBHSQ7k0Fq",
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
:event_types => [ @epidemic ],
:region => @europe,
:slug => "sBHSQ7k0Fq",
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
result = HoloceneEvent.where(:name => "Goseck Circle ", :start_year => -4900)
if result.length == 0
result = HoloceneEvent.create({:name => "Goseck Circle ",
:end_year => "-4700",
:body => "
<p>Sunrise and sunset on Mid-Winter solstice with smaller entrances for the sunrise and sunset of the Mid-Summer solstice.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Goseck_circle",
:user_id => @user.id,
:slug => "xDDn31ZNAq",
:lat => "51.198333",
:lng => "11.864722",
:start_year_uncert => "",
:start_year => "-4900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Goseck Circle ",
:end_year => "-4700",
:body => "
<p>Sunrise and sunset on Mid-Winter solstice with smaller entrances for the sunrise and sunset of the Mid-Summer solstice.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @europe,
:slug => "xDDn31ZNAq",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Measles emerges as an infectious disease ", :start_year => 500)
if result.length == 0
result = HoloceneEvent.create({:name => "Measles emerges as an infectious disease ",
:end_year => "900",
:body => "",
:tag_list => ["Disease"],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "1rDb6qz116",
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
:event_types => [ @epidemic ],
:region => @europe,
:slug => "1rDb6qz116",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Persian physician Rhazes 860–932 ", :start_year => 932)
if result.length == 0
result = HoloceneEvent.create({:name => "Persian physician Rhazes 860–932 ",
:end_year => "",
:body => "
<p>The first systematic description of measles, and its distinction from smallpox and chickenpox, in 'The Book of Smallpox and Measles'.
</p>
",
:tag_list => ["Disease"],
:event_types => [  @person ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "hyXZhwykgS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "932"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Persian physician Rhazes 860–932 ",
:end_year => "",
:body => "
<p>The first systematic description of measles, and its distinction from smallpox and chickenpox, in 'The Book of Smallpox and Measles'.
</p>
",
:tag_list => ["Disease"],
:event_types => [ @person ],
:region => @fareast,
:slug => "hyXZhwykgS",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Flood of Ogyges ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Ogyges ",
:end_year => "",
:body => "
<p>Plato, Laws, Book III.
</p>
",
:tag_list => ["Earth", "Flood"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "9tn4VmkrwC",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Ogyges ",
:end_year => "",
:body => "
<p>Plato, Laws, Book III.
</p>
",
:tag_list => ["Earth", "Flood"],
:event_types => [ @earth ],
:region => @europe,
:slug => "9tn4VmkrwC",
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
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Flood")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Flood",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "SRTJqfSk5F",
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
:slug => "SRTJqfSk5F",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "57bkBUvvPF",
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
:slug => "57bkBUvvPF",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Chickens reached Egypt ", :start_year => -1400)
if result.length == 0
result = HoloceneEvent.create({:name => "Chickens reached Egypt ",
:end_year => "",
:body => "",
:tag_list => ["Domestication", "Egypt"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "3Ta0LTDDs6",
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
:tag_list => ["Domestication", "Egypt"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "3Ta0LTDDs6",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "zZtGAp17DD",
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
:slug => "zZtGAp17DD",
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
:body => "
<p>Acquired from domesticated animals</p>
",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ns9CC89SuD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Signs of Tuberculosis in humans ",
:end_year => "",
:body => "
<p>Acquired from domesticated animals</p>
",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @global,
:slug => "ns9CC89SuD",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Tubercular decay in the spines of Egyptian mummies ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Tubercular decay in the spines of Egyptian mummies ",
:end_year => "-2400",
:body => "",
:tag_list => ["Egypt", "Disease"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "QE8SWeCAZA",
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
:tag_list => ["Egypt", "Disease"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "QE8SWeCAZA",
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
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "1rh0u9XRV6",
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
:slug => "1rh0u9XRV6",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Oldest skeletal evidence for Leprosy ", :start_year => -2000)
if result.length == 0
result = HoloceneEvent.create({:name => "Oldest skeletal evidence for Leprosy ",
:end_year => "",
:body => "
<p>Found in human remains from the archaeological sites of Balathal in India and Harappa in Pakistan</p>
",
:tag_list => ["Disease"],
:event_types => [  @cultural ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "bE7MSrg509",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Oldest skeletal evidence for Leprosy ",
:end_year => "",
:body => "
<p>Found in human remains from the archaeological sites of Balathal in India and Harappa in Pakistan</p>
",
:tag_list => ["Disease"],
:event_types => [ @cultural ],
:region => @eurasia,
:slug => "bE7MSrg509",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "qYqGHDfCJR",
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
:slug => "qYqGHDfCJR",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "FYG5xUSE4a",
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
:slug => "FYG5xUSE4a",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "HHTwa41PrB",
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
:slug => "HHTwa41PrB",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "QB14jtRzPy",
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
:slug => "QB14jtRzPy",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Domestication of Donkeys ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Donkeys ",
:end_year => "",
:body => "
<p>
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Donkey",
:user_id => @user.id,
:slug => "GU4g3DkzDZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Donkeys ",
:end_year => "",
:body => "
<p>
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "GU4g3DkzDZ",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Donkey",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Dog buried inside of human dwelling ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Dog buried inside of human dwelling ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "zXEuzz84ba",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dog buried inside of human dwelling ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @eurasia,
:slug => "zXEuzz84ba",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Two distinct dog branches - East and West ", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Two distinct dog branches - East and West ",
:end_year => "-4400",
:body => "
<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "ERv4My65ba",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Two distinct dog branches - East and West ",
:end_year => "-4400",
:body => "
<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @eurasia,
:slug => "ERv4My65ba",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Domestication of Sheep ", :start_year => -11000)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Sheep ",
:end_year => "-9000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "8RBbTPZQfv",
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
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "8RBbTPZQfv",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "nrjwun80pN",
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
:slug => "nrjwun80pN",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "vyZk3dPkba",
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
:slug => "vyZk3dPkba",
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
:slug => "hYXqj6J6ZJ",
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
:slug => "hYXqj6J6ZJ",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Hunter/Gatherer Agriculture ", :start_year => -12000)
if result.length == 0
result = HoloceneEvent.create({:name => "Hunter/Gatherer Agriculture ",
:end_year => "-10950",
:body => "
<p>The first agriculture or selection of plants for food to carry started with wild grains as the groups moved across the landscape.
</p>
<p>This ended with the Younger Dryas Impact.  The Younger Dryas pushed the growing zones for grain more southward.  Starvation and the 
abandonment of settlements as the people moved around to find food.  Their movement and attempts to find grain caused them to try to grow
it where conditions seemed right creating true agriculture.
</p>
",
:tag_list => [],
:event_types => [  @husbandry ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "fQPLn9mMdE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hunter/Gatherer Agriculture ",
:end_year => "-10950",
:body => "
<p>The first agriculture or selection of plants for food to carry started with wild grains as the groups moved across the landscape.
</p>
<p>This ended with the Younger Dryas Impact.  The Younger Dryas pushed the growing zones for grain more southward.  Starvation and the 
abandonment of settlements as the people moved around to find food.  Their movement and attempts to find grain caused them to try to grow
it where conditions seemed right creating true agriculture.
</p>
",
:tag_list => [],
:event_types => [ @husbandry ],
:region => @eurasia,
:slug => "fQPLn9mMdE",
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
:body => "
<p> The crops were the first to be domesticated: emmer and einkorn wheat, hulled barley, peas, lentils, bitter vetch, chick peas and flax.
The first cultivation was in the Levant.
</p>
",
:tag_list => [],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "9G5x5K8p0Q",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The eight Neolithic founder crops ",
:end_year => "",
:body => "
<p> The crops were the first to be domesticated: emmer and einkorn wheat, hulled barley, peas, lentils, bitter vetch, chick peas and flax.
The first cultivation was in the Levant.
</p>
",
:tag_list => [],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "9G5x5K8p0Q",
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
result = HoloceneEvent.where(:name => "Atlantis sinks beneath the waves ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Atlantis sinks beneath the waves ",
:end_year => "",
:body => "
<p>Gobekli Tepe gives credence of an advanced civilization which sank beneath the wave of the sea.
The date is from Solon's conversation with a high priest of Egypt.
The description of the events of the Greeks at the time of Atlantis seems to rule out the 9,600 BC date since there is no evidence of the Greeks being organized enough to engage in warfare with anyone.
</p>
",
:tag_list => ["Atlantis"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Atlantis",
:user_id => @user.id,
:slug => "BfYmMLC8xA",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Atlantis sinks beneath the waves ",
:end_year => "",
:body => "
<p>Gobekli Tepe gives credence of an advanced civilization which sank beneath the wave of the sea.
The date is from Solon's conversation with a high priest of Egypt.
The description of the events of the Greeks at the time of Atlantis seems to rule out the 9,600 BC date since there is no evidence of the Greeks being organized enough to engage in warfare with anyone.
</p>
",
:tag_list => ["Atlantis"],
:event_types => [ @place ],
:region => @europe,
:slug => "BfYmMLC8xA",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Atlantis",
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
rsl = GlossaryTerm.where(:name => "Atlantis")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Atlantis",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "tvdbE1JgDG",
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
:slug => "tvdbE1JgDG",
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
result = HoloceneEvent.where(:name => "Younger Dryas Impact Event ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "rXRM9tm6FU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "rXRM9tm6FU",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
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
:body => "
<p>The Vulture stone is a star map pin pointing the Holocene Impact Event at 10,950 BC[[G0wrhvCmHm]] .  
Markers on the stone show that the stone was carved around 9,600 BC since the Sun rose in Scorpius at the summer solstice at that time.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @cultural ] ,
:region => @middleeast,
:url => "https://www.ancient-origins.net/editorials/vulture-stone-gobekli-tepe-world-s-first-pictogram-004348",
:user_id => @user.id,
:slug => "4BT9jzSKTU",
:lat => "",
:lng => "",
:start_year_uncert => "250",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Vulture stone at Gobekli Tepe dated by star map ",
:end_year => "",
:body => "
<p>The Vulture stone is a star map pin pointing the Holocene Impact Event at 10,950 BC[[G0wrhvCmHm]] .  
Markers on the stone show that the stone was carved around 9,600 BC since the Sun rose in Scorpius at the summer solstice at that time.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @cultural ],
:region => @middleeast,
:slug => "4BT9jzSKTU",
:lat => "",
:lng => "",
:url => "https://www.ancient-origins.net/editorials/vulture-stone-gobekli-tepe-world-s-first-pictogram-004348",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "G0wrhvCmHm", :body => "FoxSay", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Gobekli Tepe - level III ", :start_year => -9600)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level III ",
:end_year => "-8800",
:body => "
<p>A circular structure 10 to 30 meters in diameter with two 'T' shaped stone pillars.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "C67XdXVjyP",
:lat => "37.223056",
:lng => "38.9225",
:start_year_uncert => "",
:start_year => "-9600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level III ",
:end_year => "-8800",
:body => "
<p>A circular structure 10 to 30 meters in diameter with two 'T' shaped stone pillars.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "C67XdXVjyP",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "nd4jE0AbKZ",
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
:slug => "nd4jE0AbKZ",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Gobekli Tepe - level II ", :start_year => -8800)
if result.length == 0
result = HoloceneEvent.create({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "
<p>Circular structure gives way to rectangular rooms still having the 'T' shaped stone pillars.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "AMJnAz3gbJ",
:lat => "37.223056",
:lng => "38.9225",
:start_year_uncert => "",
:start_year => "-8800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "
<p>Circular structure gives way to rectangular rooms still having the 'T' shaped stone pillars.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "AMJnAz3gbJ",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Flood of Dardanus ", :start_year => -8500)
if result.length == 0
result = HoloceneEvent.create({:name => "Flood of Dardanus ",
:end_year => "",
:body => "
<p>The story of the flood of Dardanus states that Dardanus survived on the mountain which became Samothraki island in the Aegean sea.  
The date for the flooding of the Samothraki plateau is about 8,500 BC.</p>
",
:tag_list => ["Earth", "Flood"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "WEqrK4LVQn",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-8500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flood of Dardanus ",
:end_year => "",
:body => "
<p>The story of the flood of Dardanus states that Dardanus survived on the mountain which became Samothraki island in the Aegean sea.  
The date for the flooding of the Samothraki plateau is about 8,500 BC.</p>
",
:tag_list => ["Earth", "Flood"],
:event_types => [ @earth ],
:region => @europe,
:slug => "WEqrK4LVQn",
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
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Flood")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Flood",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "psy3BQPzTv",
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
:slug => "psy3BQPzTv",
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
:body => "
<p>Site is back-filled with soil and stone.  By 7,900 BC the site was being used for agriculture.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "9ULXpyRZY0",
:lat => "37.223056",
:lng => "38.9225",
:start_year_uncert => "",
:start_year => "-8000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "
<p>Site is back-filled with soil and stone.  By 7,900 BC the site was being used for agriculture.
</p>
",
:tag_list => ["Archaeoastronomy"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "9ULXpyRZY0",
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
rsl = GlossaryTerm.where(:name => "Archaeoastronomy")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Archaeoastronomy",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Monolith worked on at submerged site south of Sicily ", :start_year => -7350)
if result.length == 0
result = HoloceneEvent.create({:name => "Monolith worked on at submerged site south of Sicily ",
:end_year => "",
:body => "
<p>Pantelleria Vecchia Bank</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "R37hf39Lqh",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Monolith worked on at submerged site south of Sicily ",
:end_year => "",
:body => "
<p>Pantelleria Vecchia Bank</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "R37hf39Lqh",
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
:body => "
<p>The site is known for having some of the world's oldest known temples and monumental sculpture. 
Together with the earlier site of Göbekli Tepe, it has revolutionised scientific understanding of the Eurasian Neolithic period. 
The oldest domesticated Einkorn wheat was found there
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Neval%C4%B1_%C3%87ori",
:user_id => @user.id,
:slug => "wbSUhnGKRA",
:lat => "37.518333",
:lng => "38.605556",
:start_year_uncert => "",
:start_year => "-8400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Nevali Cori ",
:end_year => "-8100",
:body => "
<p>The site is known for having some of the world's oldest known temples and monumental sculpture. 
Together with the earlier site of Göbekli Tepe, it has revolutionised scientific understanding of the Eurasian Neolithic period. 
The oldest domesticated Einkorn wheat was found there
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "wbSUhnGKRA",
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
result = HoloceneEvent.where(:name => "Sphinx created at Kortik Tepe ", :start_year => -9500)
if result.length == 0
result = HoloceneEvent.create({:name => "Sphinx created at Kortik Tepe ",
:end_year => "",
:body => "
<p></p>
",
:tag_list => [""],
:event_types => [  @cultural ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "Q5sRe2RP6D",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sphinx created at Kortik Tepe ",
:end_year => "",
:body => "
<p></p>
",
:tag_list => [""],
:event_types => [ @cultural ],
:region => @neareast,
:slug => "Q5sRe2RP6D",
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
rsl = GlossaryTerm.where(:name => "")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Plague of Emmaus ", :start_year => 639)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Emmaus ",
:end_year => "",
:body => "
<p>Bubonic Plague struck after conquest by the Rashidun Caliphate who setup a military camp.
</p>
",
:tag_list => [],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "bzgpybQ9NK",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "639"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Emmaus ",
:end_year => "",
:body => "
<p>Bubonic Plague struck after conquest by the Rashidun Caliphate who setup a military camp.
</p>
",
:tag_list => [],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "bzgpybQ9NK",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sphinx existed in Egypt ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Sphinx existed in Egypt ",
:end_year => "",
:body => "
<p>
Water damage at the Sphinx complex perhaps pushed the date of creation back before 3.125 BC when Noah's flood occurred.
This is the Sphinx water erosion hypothesis.
The objections are that not enough rain falls in Egypt to do the damage that is cited as evidence of flood and second there was
no population in Egypt before 3,000 BC.
</p>
",
:tag_list => ["Egypt"],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Great_Sphinx_of_Giza",
:user_id => @user.id,
:slug => "y7mfMCn1FY",
:lat => "29.975278",
:lng => "31.137778",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sphinx existed in Egypt ",
:end_year => "",
:body => "
<p>
Water damage at the Sphinx complex perhaps pushed the date of creation back before 3.125 BC when Noah's flood occurred.
This is the Sphinx water erosion hypothesis.
The objections are that not enough rain falls in Egypt to do the damage that is cited as evidence of flood and second there was
no population in Egypt before 3,000 BC.
</p>
",
:tag_list => ["Egypt"],
:event_types => [ @place ],
:region => @middleeast,
:slug => "y7mfMCn1FY",
:lat => "29.975278",
:lng => "31.137778",
:url => "https://en.wikipedia.org/wiki/Great_Sphinx_of_Giza",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-3125"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Egypt")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Egypt",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Possible water damage to the sphinx with impact from Burckle Crater ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Possible water damage to the sphinx with impact from Burckle Crater ",
:end_year => "",
:body => "
<p>The Water erosion hypothesis says that they is evidence of water erosion in the quarry from which the Sphinx was created.  
It gives no date for the water fall. 
It would seem that Noah's flood is the most likely cause of the erosion.
</p>
",
:tag_list => [],
:event_types => [  @cultural,@place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "RtbVZ8byqU",
:lat => "29.975278",
:lng => "31.137778",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Possible water damage to the sphinx with impact from Burckle Crater ",
:end_year => "",
:body => "
<p>The Water erosion hypothesis says that they is evidence of water erosion in the quarry from which the Sphinx was created.  
It gives no date for the water fall. 
It would seem that Noah's flood is the most likely cause of the erosion.
</p>
",
:tag_list => [],
:event_types => [ @cultural,@place ],
:region => @middleeast,
:slug => "RtbVZ8byqU",
:lat => "29.975278",
:lng => "31.137778",
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
@cultural_timeline.holocene_events << result unless @cultural_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "First Ocean going reed boats ", :start_year => -6000)
if result.length == 0
result = HoloceneEvent.create({:name => "First Ocean going reed boats ",
:end_year => "",
:body => "
<p>The first ocean going reed boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area.</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "v37JEcaTAt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "First Ocean going reed boats ",
:end_year => "",
:body => "
<p>The first ocean going reed boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area.</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @eurasia,
:slug => "v37JEcaTAt",
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
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "AFf9M3PDG9",
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
:event_types => [ @cultural ],
:region => @europe,
:slug => "AFf9M3PDG9",
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
:body => "
<p>
Rio Tinto is the oldest mine in use in the western hemisphere.  
It's importance in history has been over looked.  Perhaps due to it's remoteness with Spain itself, its story is reduced.
</p><p>
Rio Tinto was mined by Neolithic man starting at least 3,000 BC.  
A stone hoe was found at excavations at the site.</p>
",
:tag_list => ["RioTinto"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "Nf6AhpuWuG",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Copper Mining at Rio Tinto, Spain ",
:end_year => "",
:body => "
<p>
Rio Tinto is the oldest mine in use in the western hemisphere.  
It's importance in history has been over looked.  Perhaps due to it's remoteness with Spain itself, its story is reduced.
</p><p>
Rio Tinto was mined by Neolithic man starting at least 3,000 BC.  
A stone hoe was found at excavations at the site.</p>
",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "Nf6AhpuWuG",
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
rsl = GlossaryTerm.where(:name => "Rio Tinto")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Rio Tinto",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "a2gu3ThF9r",
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
:slug => "a2gu3ThF9r",
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
:body => "
<p>Mining stopped with  the exhaustion of the forests.</p>
",
:tag_list => ["RioTinto"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "ruCwmw2EJc",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-2475"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rio Tinto Smelting recorded in Ice Cores ",
:end_year => "-2275",
:body => "
<p>Mining stopped with  the exhaustion of the forests.</p>
",
:tag_list => ["RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "ruCwmw2EJc",
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
rsl = GlossaryTerm.where(:name => "Rio Tinto")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Rio Tinto",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "End of Rio Tinto Smelting - Deforestation ", :start_year => -2275)
if result.length == 0
result = HoloceneEvent.create({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "
<p>The end of the smelting at 
Rio Tinto
Rio Tinto was due to the deforestation of the surrounding areas.</p>
",
:tag_list => ["RioTinto", "RioTinto"],
:event_types => [  @place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "bc8SUN2pyN",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-2275"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "
<p>The end of the smelting at 
Rio Tinto
Rio Tinto was due to the deforestation of the surrounding areas.</p>
",
:tag_list => ["RioTinto", "RioTinto"],
:event_types => [ @place ],
:region => @europe,
:slug => "bc8SUN2pyN",
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
rsl = GlossaryTerm.where(:name => "Rio Tinto")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Rio Tinto",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Phoenicians arrive at Rio Tinto ", :start_year => -1100)
if result.length == 0
result = HoloceneEvent.create({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "
<p>Phoenicians begin trading with the Tartessians at Rio Tinto.</p>
",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "y0DRe7mJtP",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "
<p>Phoenicians begin trading with the Tartessians at Rio Tinto.</p>
",
:tag_list => ["RioTinto", "Tartessos"],
:event_types => [ @place ],
:region => @europe,
:slug => "y0DRe7mJtP",
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
rsl = GlossaryTerm.where(:name => "Rio Tinto")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Rio Tinto",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Tartessos")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tartessos",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "A94BWfpMEs",
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
:slug => "A94BWfpMEs",
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
:slug => "Q5tByam5CW",
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
:slug => "Q5tByam5CW",
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
rsl = GlossaryTerm.where(:name => "Rio Tinto")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Rio Tinto",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Tartessos")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tartessos",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Solon ", :start_year => -638)
if result.length == 0
result = HoloceneEvent.create({:name => "Solon ",
:end_year => "-558",
:body => "",
:tag_list => ["Atlantis"],
:event_types => [  @person ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "fYupH1DP9M",
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
:tag_list => ["Atlantis"],
:event_types => [ @person ],
:region => @europe,
:slug => "fYupH1DP9M",
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
rsl = GlossaryTerm.where(:name => "Atlantis")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Atlantis",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "66HukhYdCR",
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
:slug => "66HukhYdCR",
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
rsl = GlossaryTerm.where(:name => "Rio Tinto")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Rio Tinto",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Tartessos")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tartessos",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grafting practice for grapevines ", :start_year => -500)
if result.length == 0
result = HoloceneEvent.create({:name => "Grafting practice for grapevines ",
:end_year => "",
:body => "
<p>
The Mishna describes grafting as a commonplace technique used to grow grapevines.
</p>
",
:tag_list => ["Domestication"],
:event_types => [  @husbandry ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Grafting",
:user_id => @user.id,
:slug => "eUj1Ktsw4Q",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grafting practice for grapevines ",
:end_year => "",
:body => "
<p>
The Mishna describes grafting as a commonplace technique used to grow grapevines.
</p>
",
:tag_list => ["Domestication"],
:event_types => [ @husbandry ],
:region => @middleeast,
:slug => "eUj1Ktsw4Q",
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
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Plague of Athens ", :start_year => -430)
if result.length == 0
result = HoloceneEvent.create({:name => "Plague of Athens ",
:end_year => "",
:body => "
<p>
Typhus appears among the Athenians.</p>
",
:tag_list => ["Disease", "Epidemic", "Typhus"],
:event_types => [  @epidemic ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "k6tXDPpwZB",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-430"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Athens ",
:end_year => "",
:body => "
<p>
Typhus appears among the Athenians.</p>
",
:tag_list => ["Disease", "Epidemic", "Typhus"],
:event_types => [ @epidemic ],
:region => @europe,
:slug => "k6tXDPpwZB",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Typhus")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Typhus",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Skara Brae inundated", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Skara Brae inundated",
:end_year => "",
:body => "
<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  
It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  
It is possible that it was buried by a tsunami as well.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Skara_Brae",
:user_id => @user.id,
:slug => "rjcA0ZucX9",
:lat => "59.048611",
:lng => "-3.343056",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Skara Brae inundated",
:end_year => "",
:body => "
<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  
It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  
It is possible that it was buried by a tsunami as well.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @europe,
:slug => "rjcA0ZucX9",
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
:body => "
<p>Second appearance of Smallpox.
This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.
</p>
",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [  @epidemic,@cultural ] ,
:region => @africa,
:url => "",
:user_id => @user.id,
:slug => "S7DXWA7e30",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "251"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Plague of Cyprian ",
:end_year => "270",
:body => "
<p>Second appearance of Smallpox.
This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.
</p>
",
:tag_list => ["Disease", "Epidemic", "Smallpox"],
:event_types => [ @epidemic,@cultural ],
:region => @africa,
:slug => "S7DXWA7e30",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Smallpox")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Smallpox",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Final collapse of the Roman Empire ", :start_year => 600)
if result.length == 0
result = HoloceneEvent.create({:name => "Final collapse of the Roman Empire ",
:end_year => "",
:body => "
<p>
Lost of 'Noblest third' of population.
Loss of complexity.
</p>
",
:tag_list => [],
:event_types => [  @cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "HpwDnPp2C4",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Final collapse of the Roman Empire ",
:end_year => "",
:body => "
<p>
Lost of 'Noblest third' of population.
Loss of complexity.
</p>
",
:tag_list => [],
:event_types => [ @cultural ],
:region => @europe,
:slug => "HpwDnPp2C4",
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
:slug => "XcE5LHaDsX",
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
:slug => "XcE5LHaDsX",
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
:slug => "b4LjfqvLT8",
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
:slug => "b4LjfqvLT8",
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
rsl = GlossaryTerm.where(:name => "Historical")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Historical",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Famine")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Famine",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Black Death - The third occurrence of Plague in Europe", :start_year => 1347)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Death - The third occurrence of Plague in Europe",
:end_year => "1351",
:body => "
<p>Third Occurrence of Plague in Europe.  Estimated 50% reduction in the population.
</p>
",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [  @epidemic,@cultural ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "qD7nSGuAY3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1347"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Death - The third occurrence of Plague in Europe",
:end_year => "1351",
:body => "
<p>Third Occurrence of Plague in Europe.  Estimated 50% reduction in the population.
</p>
",
:tag_list => ["Disease", "Historical", "Epidemic", "BubonicPlague"],
:event_types => [ @epidemic,@cultural ],
:region => @europe,
:slug => "qD7nSGuAY3",
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
rsl = GlossaryTerm.where(:name => "Disease")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Disease",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Historical")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Historical",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Epidemic")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Epidemic",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Bubonic Plague")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bubonic Plague",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("cantor2001")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("ziegler1969")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = HoloceneEvent.where(:name => "Tell Qaramel ", :start_year => -10898)
if result.length == 0
result = HoloceneEvent.create({:name => "Tell Qaramel ",
:end_year => "-9300",
:body => "
<p>Known for five tower structures.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Qaramel",
:user_id => @user.id,
:slug => "5qbZM03txv",
:lat => "36.3778",
:lng => "37.2751",
:start_year_uncert => "",
:start_year => "-10898"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Qaramel ",
:end_year => "-9300",
:body => "
<p>Known for five tower structures.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "5qbZM03txv",
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
:body => "
<p>Pre-dates Jericho by two millennia.
</p>
",
:tag_list => [],
:event_types => [  @place ] ,
:region => @middleeast,
:url => "https://en.wikipedia.org/wiki/Tell_Qaramel",
:user_id => @user.id,
:slug => "JPS39BWHHE",
:lat => "36.3778",
:lng => "37.2751",
:start_year_uncert => "",
:start_year => "-10898"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tell Qaramel - Oldest tower in a settlement ",
:end_year => "-9670",
:body => "
<p>Pre-dates Jericho by two millennia.
</p>
",
:tag_list => [],
:event_types => [ @place ],
:region => @middleeast,
:slug => "JPS39BWHHE",
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
:show_events => true,
:always_display_events => true,
:slug => "timeline",
:book => @book,
:body => "
<p>Earth related events such as volcanic eruptions, earthquakes, tsunamis, impact events, etc.
Additionally, climate changes are included.
</p>
"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("stommel1983")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("nur2008")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = Biblioentry.find_by_xreflabel("baillie1999")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = HoloceneEvent.where(:name => "Cotopaxi, Ecuador VEI 5+ ", :start_year => -5820)
if result.length == 0
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+ ",
:end_year => "",
:body => "
<p>
[[nbQKgFg91m]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Cotopaxi",
:user_id => @user.id,
:slug => "rFepmCrWw7",
:lat => "-0.680556",
:lng => "-78.437778",
:start_year_uncert => "75",
:start_year => "-5820"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cotopaxi, Ecuador VEI 5+ ",
:end_year => "",
:body => "
<p>
[[nbQKgFg91m]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "rFepmCrWw7",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 5")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 5",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "nbQKgFg91m", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Cotopaxi, Ecuador VEI 5+ ", :start_year => -3880)
if result.length == 0
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+ ",
:end_year => "",
:body => "
<p>
[[JekYG6vpkH]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Cotopaxi",
:user_id => @user.id,
:slug => "uexK9HCkKf",
:lat => "-0.680556",
:lng => "-78.437778",
:start_year_uncert => "75",
:start_year => "-3880"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Cotopaxi, Ecuador VEI 5+ ",
:end_year => "",
:body => "
<p>
[[JekYG6vpkH]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "uexK9HCkKf",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 5")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 5",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "JekYG6vpkH", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 5+ ", :start_year => 1030)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 5+ ",
:end_year => "",
:body => "
<p>
[[6bLUDpL6hN]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Billy_Mitchell_(volcano)",
:user_id => @user.id,
:slug => "e4vPqMpK0S",
:lat => "-6.092",
:lng => "155.225",
:start_year_uncert => "25",
:start_year => "1030"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 5+ ",
:end_year => "",
:body => "
<p>
[[6bLUDpL6hN]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "e4vPqMpK0S",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 5")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 5",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "6bLUDpL6hN", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Masaya, Nicaragua VEI 5+ ", :start_year => 150)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 5+ ",
:end_year => "",
:body => "
<p>
[[QTVHNKe8py]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Masaya_Volcano",
:user_id => @user.id,
:slug => "XFjE5gafan",
:lat => "11.982778",
:lng => "-86.161944",
:start_year_uncert => "",
:start_year => "150"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua VEI 5+ ",
:end_year => "",
:body => "
<p>
[[QTVHNKe8py]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI5"],
:event_types => [  ],
:region => @global,
:slug => "XFjE5gafan",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 5")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 5",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "QTVHNKe8py", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Usselo Horizon ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Usselo Horizon ",
:end_year => "",
:body => "
<p>The Usselo Horizon is a layer of charcoal found in Europe and North America.
</p>
",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Usselo",
:user_id => @user.id,
:slug => "0d1xYPS822",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Usselo Horizon ",
:end_year => "",
:body => "
<p>The Usselo Horizon is a layer of charcoal found in Europe and North America.
</p>
",
:tag_list => [],
:event_types => [ @earth ],
:region => @global,
:slug => "0d1xYPS822",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Usselo",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Meltwater Pulse 1A ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Meltwater Pulse 1A ",
:end_year => "-11500",
:body => "
<p>Global in nature.
This event is the most widely recognized and least disputed of the named, postglacial meltwater pulses.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Meltwater_pulse_1A",
:user_id => @user.id,
:slug => "LTuAWeS0WY",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Meltwater Pulse 1A ",
:end_year => "-11500",
:body => "
<p>Global in nature.
This event is the most widely recognized and least disputed of the named, postglacial meltwater pulses.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "LTuAWeS0WY",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Meltwater_pulse_1A",
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
:slug => "1j6trpRcB5",
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
:slug => "1j6trpRcB5",
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
:body => "
<p>The Bølling-Allerød Warming was a warm moist period that started with the end of the Older Dryas and ended with
the start of the Younger Dryas.  Hunter-gatherers moved into the northern lands challenging the Megafauna causing their extinction.
It is during this period that humanity starts to experiment with use and domesticate emmer and two-row barley.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Bølling-Allerød_warming",
:user_id => @user.id,
:slug => "fKp6YmpynV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bølling-Allerød Warming",
:end_year => "-10700",
:body => "
<p>The Bølling-Allerød Warming was a warm moist period that started with the end of the Older Dryas and ended with
the start of the Younger Dryas.  Hunter-gatherers moved into the northern lands challenging the Megafauna causing their extinction.
It is during this period that humanity starts to experiment with use and domesticate emmer and two-row barley.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "fKp6YmpynV",
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
:body => "
<p>Humans enter forests hunting megafauna.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Aller%C3%B8d_oscillation",
:user_id => @user.id,
:slug => "Jg74L2Qr6y",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bølling oscillation",
:end_year => "-12100",
:body => "
<p>Humans enter forests hunting megafauna.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "Jg74L2Qr6y",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Aller%C3%B8d_oscillation",
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
:body => "
<p>Humans begin to exploit wild cereals.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "pk6mQUU9jE",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-12000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Allerød oscillation",
:end_year => "-11000",
:body => "
<p>Humans begin to exploit wild cereals.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "pk6mQUU9jE",
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
:slug => "NtG2nNsYVX",
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
:slug => "NtG2nNsYVX",
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
rsl = GlossaryTerm.where(:name => "Magnetic Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Magnetic Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "5uYs5Tk5qE",
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
:slug => "5uYs5Tk5qE",
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
rsl = GlossaryTerm.where(:name => "Magnetic Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Magnetic Event",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
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
:slug => "8C6FY4FKZ4",
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
:slug => "8C6FY4FKZ4",
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
rsl = GlossaryTerm.where(:name => "Magnetic Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Magnetic Event",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
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
:slug => "bzkXdUXgwJ",
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
:slug => "bzkXdUXgwJ",
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
rsl = GlossaryTerm.where(:name => "Magnetic Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Magnetic Event",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("o_hare2019")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = HoloceneEvent.where(:name => "Flooding of the Persian Gulf ", :start_year => -16000)
if result.length == 0
result = HoloceneEvent.create({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "
<p>Kicked out of Eden the first time.
</p>
",
:tag_list => [],
:event_types => [  @earth ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "0bauDNgwCc",
:lat => "26",
:lng => "52",
:start_year_uncert => "",
:start_year => "-16000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Flooding of the Persian Gulf ",
:end_year => "-4000",
:body => "
<p>Kicked out of Eden the first time.
</p>
",
:tag_list => [],
:event_types => [ @earth ],
:region => @middleeast,
:slug => "0bauDNgwCc",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "x7kk5pyGyZ",
:lat => "39.163333",
:lng => "22.708889",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zerelia West ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "x7kk5pyGyZ",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "7bXAC0NATd",
:lat => "39.161944",
:lng => "22.714167",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Zerelia East ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "7bXAC0NATd",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "ffv3D8pMvh",
:lat => "-22.616667",
:lng => "135.2",
:start_year_uncert => "",
:start_year => "-3400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Boxhole ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "ffv3D8pMvh",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "8Z9MREcnRu",
:lat => "23.704722",
:lng => "69.260278",
:start_year_uncert => "",
:start_year => "-2000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kachchh (Luna) ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "8Z9MREcnRu",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "dgtKveTByN",
:lat => "56.819",
:lng => "45.093",
:start_year_uncert => "",
:start_year => "-600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Svetloyar lake ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "dgtKveTByN",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @northamerica,
:url => "",
:user_id => @user.id,
:slug => "axtS447NJ8",
:lat => "58.04",
:lng => "-64.05",
:start_year_uncert => "",
:start_year => "1100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Merewether ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @northamerica,
:slug => "axtS447NJ8",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @eurasia,
:url => "",
:user_id => @user.id,
:slug => "3ySj3GxfKu",
:lat => "38.094028",
:lng => "74.282778",
:start_year_uncert => "",
:start_year => "1700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ak-Bura (Murgab) ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @eurasia,
:slug => "3ySj3GxfKu",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "PU9DbmHpny",
:lat => "60.964",
:lng => "101.86",
:start_year_uncert => "",
:start_year => "1908"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lake Cheko ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @fareast,
:slug => "PU9DbmHpny",
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
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @southamerica,
:url => "",
:user_id => @user.id,
:slug => "Z3RtxapZzW",
:lat => "-5.183333",
:lng => "-71.633333",
:start_year_uncert => "",
:start_year => "1930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Curuçá astrobleme ",
:end_year => "",
:body => "
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @southamerica,
:slug => "Z3RtxapZzW",
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
:slug => "r73pZycQ87",
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
:slug => "r73pZycQ87",
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
rsl = GlossaryTerm.where(:name => "Tartessos")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tartessos",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Tsunami")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tsunami",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Sirente Italy ", :start_year => 312)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Italy ",
:end_year => "",
:body => "
<p>This event may be the cause of Roman emperor Constantine's vision at Milvian Bridge.
</p>
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "V1mAf42Pme",
:lat => "42.177222",
:lng => "13.595833",
:start_year_uncert => "90",
:start_year => "312"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Italy ",
:end_year => "",
:body => "
<p>This event may be the cause of Roman emperor Constantine's vision at Milvian Bridge.
</p>
<p>Unconfirmed</p>
",
:tag_list => [],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "V1mAf42Pme",
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
result = HoloceneEvent.where(:name => "Younger Dryas Impact Event ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [  @climate,@impact ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Younger_Dryas_impact_hypothesis",
:user_id => @user.id,
:slug => "KPe5rU8dHe",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_types => [ @climate,@impact ],
:region => @global,
:slug => "KPe5rU8dHe",
:lat => "",
:lng => "",
:url => "https://en.wikipedia.org/wiki/Younger_Dryas_impact_hypothesis",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "wag7WzmfsP",
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
:slug => "wag7WzmfsP",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "AtErwm3mx9",
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
:slug => "AtErwm3mx9",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "y3gRN4yaaG",
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
:slug => "y3gRN4yaaG",
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
:slug => "YCeLBKdXNW",
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
:slug => "YCeLBKdXNW",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "v9LpGJyTfH",
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
:slug => "v9LpGJyTfH",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "znDAMjK6pX",
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
:slug => "znDAMjK6pX",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "XTtLBKpd7M",
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
:slug => "XTtLBKpd7M",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Morasko Meteorite Nature Reserve ", :start_year => -3000)
if result.length == 0
result = HoloceneEvent.create({:name => "Morasko Meteorite Nature Reserve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Morasko_Meteorite_Nature_Reserve",
:user_id => @user.id,
:slug => "2H5rudkDJ4",
:lat => "52.483333",
:lng => "16.9",
:start_year_uncert => "",
:start_year => "-3000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Morasko Meteorite Nature Reserve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @europe,
:slug => "2H5rudkDJ4",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "gw2Baght6y",
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
:slug => "gw2Baght6y",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "sVE8q2nJZa",
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
:slug => "sVE8q2nJZa",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "857jKEJfq2",
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
:slug => "857jKEJfq2",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "cLYTHbckYE",
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
:slug => "cLYTHbckYE",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "Rrc7gbzmcU",
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
:slug => "Rrc7gbzmcU",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "RKp8L3p0yD",
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
:slug => "RKp8L3p0yD",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "CxDj8MUADb",
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
:slug => "CxDj8MUADb",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Younger Dryas ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "
<p>This event was a 1,300 year cold event as waters from the ice plateau covering North America flowed into the Atlantic basin shutting down the Gulf stream.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "rKPWV4EZeu",
:lat => "",
:lng => "",
:start_year_uncert => "70",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas ",
:end_year => "-9700",
:body => "
<p>This event was a 1,300 year cold event as waters from the ice plateau covering North America flowed into the Atlantic basin shutting down the Gulf stream.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "rKPWV4EZeu",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "70",
:start_year => "-10950"
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
:body => "
<p>Series of seven massive volcanic eruptions give volcanic skies and lowered temperatures(ending 7090 BC).
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "aeKSQM3fnP",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-7901"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Seven massive volcanic eruptions shown in ice cores ",
:end_year => "-7090",
:body => "
<p>Series of seven massive volcanic eruptions give volcanic skies and lowered temperatures(ending 7090 BC).
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "aeKSQM3fnP",
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
:slug => "UpWk55r1Pe",
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
:slug => "UpWk55r1Pe",
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
:body => "
<p>High point in sea levels during the Holocene.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "EJHGdM5L4P",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Older Peron ",
:end_year => "-4100",
:body => "
<p>High point in sea levels during the Holocene.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "EJHGdM5L4P",
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
:body => "
<p>Second highest point in sea levels during the Holocene.
</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ajNzzRs1an",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "
<p>Second highest point in sea levels during the Holocene.
</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "ajNzzRs1an",
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
result = HoloceneEvent.where(:name => "Bond 8 - End of Younger Dryas ", :start_year => -9100)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "
<p>The Gulf Stream resumes.</p>
",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "YRCfJS2nLV",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-9100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "
<p>The Gulf Stream resumes.</p>
",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "YRCfJS2nLV",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Lvinaya Past, Kamchatka Peninsula (Russia) VEI 6+ ", :start_year => -7480)
if result.length == 0
result = HoloceneEvent.create({:name => "Lvinaya Past, Kamchatka Peninsula (Russia) VEI 6+ ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[TxxAVftJaS]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Lvinaya_Past",
:user_id => @user.id,
:slug => "QTRADrbAYA",
:lat => "44.608",
:lng => "146.994",
:start_year_uncert => "50",
:start_year => "-7480"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Lvinaya Past, Kamchatka Peninsula (Russia) VEI 6+ ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[TxxAVftJaS]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "QTRADrbAYA",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "TxxAVftJaS", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "3hMVZ6dfEn",
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
:slug => "3hMVZ6dfEn",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "vQXWxpsph8",
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
:slug => "vQXWxpsph8",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Sakura-Jima, Kyushu (Japan) VEI 6+ ", :start_year => -6200)
if result.length == 0
result = HoloceneEvent.create({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+ ",
:end_year => "",
:body => "
<p>[[0BGqbZBSqE]] </p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @fareast,
:url => "https://en.wikipedia.org/wiki/Sakurajima",
:user_id => @user.id,
:slug => "6wGehXUucS",
:lat => "31.580",
:lng => "130.658",
:start_year_uncert => "1000",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+ ",
:end_year => "",
:body => "
<p>[[0BGqbZBSqE]] </p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @fareast,
:slug => "6wGehXUucS",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "0BGqbZBSqE", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "Nv6Q3PFQz9",
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
:slug => "Nv6Q3PFQz9",
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
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => 1991)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
Lower north flank and summit</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "MFFjRnC7JK",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "",
:start_year => "1991"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
Lower north flank and summit</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "MFFjRnC7JK",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "MuCXgnUyQh", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Novarupta ", :start_year => 1912)
if result.length == 0
result = HoloceneEvent.create({:name => "Novarupta ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Novarupta",
:user_id => @user.id,
:slug => "nHefqxyjdu",
:lat => "58.270",
:lng => "-155.157",
:start_year_uncert => "",
:start_year => "1912"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Novarupta ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "nHefqxyjdu",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Santa Maria VEI 6 ", :start_year => 1902)
if result.length == 0
result = HoloceneEvent.create({:name => "Santa Maria VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
SW flank</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Santa_Mar%C3%ADa_(volcano)",
:user_id => @user.id,
:slug => "fG0cxZTDtn",
:lat => "14.756",
:lng => "-91.552",
:start_year_uncert => "",
:start_year => "1902"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santa Maria VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
SW flank</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "fG0cxZTDtn",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Krakatau, Indonesia VEI 6 ", :start_year => 1883)
if result.length == 0
result = HoloceneEvent.create({:name => "Krakatau, Indonesia VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Krakatoa",
:user_id => @user.id,
:slug => "1jjBR6QPeq",
:lat => "-6.102",
:lng => "105.423",
:start_year_uncert => "",
:start_year => "1883"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Krakatau, Indonesia VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "1jjBR6QPeq",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "Wz5LMFcApb", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 continuous eruptions until explosion in 1815 ", :start_year => 1812)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 continuous eruptions until explosion in 1815 ",
:end_year => "1815",
:body => "
<p>Continuous eruptions until Tambora exploded in 1815.[[9fk7xHvsAZ]] [[gf4bryK5tC]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Tambora",
:user_id => @user.id,
:slug => "QJJYQZ5sUr",
:lat => "-8.250",
:lng => "118.000",
:start_year_uncert => "",
:start_year => "1812"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 continuous eruptions until explosion in 1815 ",
:end_year => "1815",
:body => "
<p>Continuous eruptions until Tambora exploded in 1815.[[9fk7xHvsAZ]] [[gf4bryK5tC]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "QJJYQZ5sUr",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("stommel1983")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = nil
Footnote.create(:slug => "9fk7xHvsAZ", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "gf4bryK5tC", :body => "", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 ", :start_year => 1815)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
[[CQ3jaLkpPn]] 
</p>
<p>This was the first eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book[[0Zduuy6mst]]  provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
 of 1816.</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Tambora",
:user_id => @user.id,
:slug => "vqqvZYr5Nj",
:lat => "-8.250",
:lng => "118.000",
:start_year_uncert => "",
:start_year => "1815"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
[[CQ3jaLkpPn]] 
</p>
<p>This was the first eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book[[0Zduuy6mst]]  provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
 of 1816.</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "vqqvZYr5Nj",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("stommel1983")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
biblio = nil
Footnote.create(:slug => "CQ3jaLkpPn", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
biblio = Biblioentry.find_by_xreflabel("stommel1983")
Footnote.create(:slug => "0Zduuy6mst", :body => "Volcano Weather: the story of 1816, the year without a summer", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Unknown Source VEI 6 ", :start_year => 1808)
if result.length == 0
result = HoloceneEvent.create({:name => "Unknown Source VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @unknown,
:url => "",
:user_id => @user.id,
:slug => "2jxzxS2dV8",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1808"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Unknown Source VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @unknown,
:slug => "2jxzxS2dV8",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6 ", :start_year => 1660)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[9KDLD5RYLB]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Long_Island_(Papua_New_Guinea)",
:user_id => @user.id,
:slug => "N317BFWmmR",
:lat => "-5.358",
:lng => "147.120",
:start_year_uncert => "20",
:start_year => "1660"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[9KDLD5RYLB]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "N317BFWmmR",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "9KDLD5RYLB", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Huaynaputina, Peru VEI 6 ", :start_year => 1601)
if result.length == 0
result = HoloceneEvent.create({:name => "Huaynaputina, Peru VEI 6 ",
:end_year => "1603",
:body => "
<p>Confirmed Eruption |
Historical Observations
Summit and south flank</p>[[r5TmcauKt4]] 
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Huaynaputina",
:user_id => @user.id,
:slug => "aUe4ph8ThN",
:lat => "-16.608",
:lng => "-70.850",
:start_year_uncert => "",
:start_year => "1601"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Huaynaputina, Peru VEI 6 ",
:end_year => "1603",
:body => "
<p>Confirmed Eruption |
Historical Observations
Summit and south flank</p>[[r5TmcauKt4]] 
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "aUe4ph8ThN",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "r5TmcauKt4", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Billy Mitchell, Bougainville Island VEI 6 ", :start_year => 1580)
if result.length == 0
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[mGH7r6JEFj]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Billy_Mitchell_(volcano)",
:user_id => @user.id,
:slug => "NADkvAjvPQ",
:lat => "-6.092",
:lng => "155.225",
:start_year_uncert => "20",
:start_year => "1580"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Billy Mitchell, Bougainville Island VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[mGH7r6JEFj]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "NADkvAjvPQ",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "mGH7r6JEFj", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Bardarbunga, Northeastern Iceland VEI 6 ", :start_year => 1477)
if result.length == 0
result = HoloceneEvent.create({:name => "Bardarbunga, Northeastern Iceland VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations[[NwhvS5zKPR]] 
Veidivötn (Veidivatnahraun)
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @icelandandarcticocean,
:url => "",
:user_id => @user.id,
:slug => "zcD9Pc4c6Y",
:lat => "64.633",
:lng => "-17.516",
:start_year_uncert => "",
:start_year => "1477"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bardarbunga, Northeastern Iceland VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Historical Observations[[NwhvS5zKPR]] 
Veidivötn (Veidivatnahraun)
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @icelandandarcticocean,
:slug => "zcD9Pc4c6Y",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "NwhvS5zKPR", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Quilotoa, Ecuador VEI 6 ", :start_year => 1280)
if result.length == 0
result = HoloceneEvent.create({:name => "Quilotoa, Ecuador VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "",
:user_id => @user.id,
:slug => "7HLtmMpSr6",
:lat => "-0.850",
:lng => "-78.900",
:start_year_uncert => "",
:start_year => "1280"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Quilotoa, Ecuador VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "7HLtmMpSr6",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "X66SAPQhRX", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Rinjani VEI 7 ", :start_year => 1257)
if result.length == 0
result = HoloceneEvent.create({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Ice Core
Samalas Eruption</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "",
:user_id => @user.id,
:slug => "eyJVENHQL0",
:lat => "-8.420",
:lng => "116.470",
:start_year_uncert => "",
:start_year => "1257"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rinjani VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Ice Core
Samalas Eruption</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "eyJVENHQL0",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Changbaishan VEI 7 ", :start_year => 942)
if result.length == 0
result = HoloceneEvent.create({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "",
:user_id => @user.id,
:slug => "SgEXMHFYh0",
:lat => "41.980",
:lng => "128.080",
:start_year_uncert => "4",
:start_year => "942"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Changbaishan VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "SgEXMHFYh0",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ceboruco, Mexico VEI 6 ", :start_year => 930)
if result.length == 0
result = HoloceneEvent.create({:name => "Ceboruco, Mexico VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[q4zVBxsZ1s]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "",
:user_id => @user.id,
:slug => "gwtL8h9HLQ",
:lat => "21.125",
:lng => "-104.508",
:start_year_uncert => "200",
:start_year => "930"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ceboruco, Mexico VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[q4zVBxsZ1s]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "gwtL8h9HLQ",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "q4zVBxsZ1s", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Churchill VEI 6 ", :start_year => 847)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Tephrochronology
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:slug => "PWaVm1exaK",
:lat => "61.380",
:lng => "-141.750",
:start_year_uncert => "1",
:start_year => "847"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Tephrochronology
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "PWaVm1exaK",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Witori VEI 6 ", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "tkB1EfH2Tg",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "75",
:start_year => "710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "tkB1EfH2Tg",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Rabaul, New Britain VEI 6 ", :start_year => 683)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabaul, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Rabaul_caldera",
:user_id => @user.id,
:slug => "yYUZZYT2Mn",
:lat => "-4.271",
:lng => "152.203",
:start_year_uncert => "2",
:start_year => "683"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabaul, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "yYUZZYT2Mn",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Dakataua VEI 6 ", :start_year => 653)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Dakataua",
:user_id => @user.id,
:slug => "WAmj3UTFs9",
:lat => "-5.094",
:lng => "150.094",
:start_year_uncert => "18",
:start_year => "653"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "WAmj3UTFs9",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ilopango, El Salvador VEI 7 ", :start_year => 535)
if result.length == 0
result = HoloceneEvent.create({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
[[MS8Rnf7f1d]] 
Ilopango</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Lake_Ilopango",
:user_id => @user.id,
:slug => "yQvsqJRbUE",
:lat => "13.672",
:lng => "-89.053",
:start_year_uncert => "",
:start_year => "535"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ilopango, El Salvador VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
[[MS8Rnf7f1d]] 
Ilopango</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "yQvsqJRbUE",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "MS8Rnf7f1d", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Ksudach VEI 6 ", :start_year => 240)
if result.length == 0
result = HoloceneEvent.create({:name => "Ksudach VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected) |
Ksudach V caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "",
:user_id => @user.id,
:slug => "pCt7c5ZspP",
:lat => "51.844",
:lng => "157.572",
:start_year_uncert => "100",
:start_year => "240"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ksudach VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected) |
Ksudach V caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "pCt7c5ZspP",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Taupo VEI 6 ", :start_year => 233)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected) |
Horomatangi Reefs area</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:slug => "cecAFSm64N",
:lat => "-38.820",
:lng => "176.000",
:start_year_uncert => "13",
:start_year => "233"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected) |
Horomatangi Reefs area</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "cecAFSm64N",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Churchill VEI 6 ", :start_year => 60)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:slug => "CWfjr3S8jx",
:lat => "61.380",
:lng => "-141.750",
:start_year_uncert => "200",
:start_year => "60"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "CWfjr3S8jx",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ambrym, Vanuatu VEI 6+ ", :start_year => 50)
if result.length == 0
result = HoloceneEvent.create({:name => "Ambrym, Vanuatu VEI 6+ ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[SDXC7JBHX4]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "ybFMFjrsDL",
:lat => "-16.250",
:lng => "168.120",
:start_year_uncert => "100",
:start_year => "50"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ambrym, Vanuatu VEI 6+ ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[SDXC7JBHX4]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "ybFMFjrsDL",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "SDXC7JBHX4", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Apoyeque, Nicaragua VEI 6 ", :start_year => -50)
if result.length == 0
result = HoloceneEvent.create({:name => "Apoyeque, Nicaragua VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption[[vZkcNDhsWk]]  |
Tephrochronology
Apoyeque</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "",
:user_id => @user.id,
:slug => "3wcnw9aEv5",
:lat => "12.242",
:lng => "-86.342",
:start_year_uncert => "100",
:start_year => "-50"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Apoyeque, Nicaragua VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption[[vZkcNDhsWk]]  |
Tephrochronology
Apoyeque</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "3wcnw9aEv5",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "vZkcNDhsWk", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Okmok, Aleutian Islands VEI 6 ", :start_year => -100)
if result.length == 0
result = HoloceneEvent.create({:name => "Okmok, Aleutian Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[9fx8mttdzU]]  |
Okmok II caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "",
:user_id => @user.id,
:slug => "CEH7m4vECY",
:lat => "53.430",
:lng => "-168.130",
:start_year_uncert => "50",
:start_year => "-100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Okmok, Aleutian Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[9fx8mttdzU]]  |
Okmok II caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "CEH7m4vECY",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "9fx8mttdzU", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -1050)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[6WZ9Md0RU1]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "keu4tZq2VR",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "500",
:start_year => "-1050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[6WZ9Md0RU1]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "keu4tZq2VR",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "6WZ9Md0RU1", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Witori VEI 6 ", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "egGD3UH17R",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "160",
:start_year => "-1370"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "egGD3UH17R",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Aniakchak VEI 6 ", :start_year => -1645)
if result.length == 0
result = HoloceneEvent.create({:name => "Aniakchak VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Ice Core
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Aniakchak",
:user_id => @user.id,
:slug => "gK6eNhJPFB",
:lat => "56.880",
:lng => "-158.170",
:start_year_uncert => "10",
:start_year => "-1645"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aniakchak VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Ice Core
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "gK6eNhJPFB",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Veniaminof, Alaska Peninsula VEI 6 ", :start_year => -1750)
if result.length == 0
result = HoloceneEvent.create({:name => "Veniaminof, Alaska Peninsula VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[RjDbYVx8Hm]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Veniaminof",
:user_id => @user.id,
:slug => "u6SgxGXmwx",
:lat => "56.170",
:lng => "-159.380",
:start_year_uncert => "",
:start_year => "-1750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Veniaminof, Alaska Peninsula VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[RjDbYVx8Hm]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "u6SgxGXmwx",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "RjDbYVx8Hm", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "St. Helens, Washington, USA VEI 6 ", :start_year => -1860)
if result.length == 0
result = HoloceneEvent.create({:name => "St. Helens, Washington, USA VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[QexeTm5wZG]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_St._Helens",
:user_id => @user.id,
:slug => "yVr8WTxRJa",
:lat => "46.200",
:lng => "-122.180",
:start_year_uncert => "",
:start_year => "-1860"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "St. Helens, Washington, USA VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[QexeTm5wZG]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "yVr8WTxRJa",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "QexeTm5wZG", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Hudson, Cerro Southern Chile VEI 6 ", :start_year => -1890)
if result.length == 0
result = HoloceneEvent.create({:name => "Hudson, Cerro Southern Chile VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[zhfRxc2Yet]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Hudson",
:user_id => @user.id,
:slug => "eZpk98RhyV",
:lat => "-45.900",
:lng => "-72.970",
:start_year_uncert => "",
:start_year => "-1890"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hudson, Cerro Southern Chile VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[zhfRxc2Yet]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "eZpk98RhyV",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "zhfRxc2Yet", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Black Peak, Alaska VEI 6 ", :start_year => -1900)
if result.length == 0
result = HoloceneEvent.create({:name => "Black Peak, Alaska VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption[[tL7yL7ugNq]]  |
Tephrochronology
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Black_Peak_(Alaska)",
:user_id => @user.id,
:slug => "NpmSk54ypM",
:lat => "56.552",
:lng => "-158.785",
:start_year_uncert => "150",
:start_year => "-1900"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Black Peak, Alaska VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption[[tL7yL7ugNq]]  |
Tephrochronology
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "NpmSk54ypM",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "tL7yL7ugNq", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Long Island, Northeast of New Guinea VEI 6 ", :start_year => -2040)
if result.length == 0
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[2Ata0A7NyR]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Long_Island_(Papua_New_Guinea)",
:user_id => @user.id,
:slug => "wMC9EpMJ4Z",
:lat => "-5.358",
:lng => "147.120",
:start_year_uncert => "100",
:start_year => "-2040"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Long Island, Northeast of New Guinea VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[2Ata0A7NyR]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "wMC9EpMJ4Z",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "2Ata0A7NyR", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Blanco, Cerro VEI 7 ", :start_year => -2300)
if result.length == 0
result = HoloceneEvent.create({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Cerro_Blanco_(volcano)",
:user_id => @user.id,
:slug => "3gTU7xZu0X",
:lat => "-26.789",
:lng => "-67.765",
:start_year_uncert => "160",
:start_year => "-2300"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Blanco, Cerro VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "3gTU7xZu0X",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -3550)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[NXYmfYXjZa]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "Mbr9P4tQpt",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "",
:start_year => "-3550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[NXYmfYXjZa]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "Mbr9P4tQpt",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "NXYmfYXjZa", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Taal, Philippines VEI 6 ", :start_year => -3580)
if result.length == 0
result = HoloceneEvent.create({:name => "Taal, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[08Ff2g7bGZ]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Taal_Volcano",
:user_id => @user.id,
:slug => "UTn3Yuvw01",
:lat => "14.002",
:lng => "120.993",
:start_year_uncert => "200",
:start_year => "-3580"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taal, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[08Ff2g7bGZ]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "UTn3Yuvw01",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "08Ff2g7bGZ", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Witori Caldera VEI 6 ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Witori Caldera VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "vM4yKpEfJh",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "210",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Witori Caldera VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "vM4yKpEfJh",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Masaya, Nicaragua VEI 6 ", :start_year => -4050)
if result.length == 0
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Tephrochronology
NW of caldera</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @centralamerica,
:url => "https://en.wikipedia.org/wiki/Masaya_Volcano",
:user_id => @user.id,
:slug => "eud8ady7Ue",
:lat => "11.984",
:lng => "-86.161",
:start_year_uncert => "",
:start_year => "-4050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Masaya, Nicaragua VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Tephrochronology
NW of caldera</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @centralamerica,
:slug => "eud8ady7Ue",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ", :start_year => -4350)
if result.length == 0
result = HoloceneEvent.create({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
[[cMszZDhtu3]] 
Kikai caldera</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Kikai_Caldera",
:user_id => @user.id,
:slug => "qAHRTu5QGe",
:lat => "30.789",
:lng => "130.308",
:start_year_uncert => "",
:start_year => "-4350"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)
[[cMszZDhtu3]] 
Kikai caldera</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "qAHRTu5QGe",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "cMszZDhtu3", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Macauley Island, Kermadec Islands VEI 6 ", :start_year => -4360)
if result.length == 0
result = HoloceneEvent.create({:name => "Macauley Island, Kermadec Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[quKqabJ8Sv]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Macauley_Island",
:user_id => @user.id,
:slug => "a9rG4aA3q4",
:lat => "-30.210",
:lng => "-178.475",
:start_year_uncert => "200",
:start_year => "-4360"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Macauley Island, Kermadec Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[quKqabJ8Sv]] 
</p>
",
:tag_list => ["GlobalVolcano", "Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "a9rG4aA3q4",
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
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "quKqabJ8Sv", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Hudson, Cerro Southern Chile VEI 6 ", :start_year => -4750)
if result.length == 0
result = HoloceneEvent.create({:name => "Hudson, Cerro Southern Chile VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[0UCY4kLB4E]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Hudson",
:user_id => @user.id,
:slug => "GGWzQFzv9T",
:lat => "-45.900",
:lng => "-72.970",
:start_year_uncert => "",
:start_year => "-4750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Hudson, Cerro Southern Chile VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[0UCY4kLB4E]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "GGWzQFzv9T",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "0UCY4kLB4E", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Aniakchak, Alaska Peninsula VEI 6 ", :start_year => -5250)
if result.length == 0
result = HoloceneEvent.create({:name => "Aniakchak, Alaska Peninsula VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption[[Cm7P0zCfy5]]  |
Tephrochronology
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Aniakchak",
:user_id => @user.id,
:slug => "WUtWKDffLx",
:lat => "56.880",
:lng => "-158.170",
:start_year_uncert => "1000",
:start_year => "-5250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aniakchak, Alaska Peninsula VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption[[Cm7P0zCfy5]]  |
Tephrochronology
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "WUtWKDffLx",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "Cm7P0zCfy5", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6 ", :start_year => -5550)
if result.length == 0
result = HoloceneEvent.create({:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[d23mswm7Gt]]  |
Tao-Rusyr</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Tao-Rusyr_Caldera",
:user_id => @user.id,
:slug => "hqeCyVFUhz",
:lat => "49.350",
:lng => "154.700",
:start_year_uncert => "75",
:start_year => "-5550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[d23mswm7Gt]]  |
Tao-Rusyr</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "hqeCyVFUhz",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "d23mswm7Gt", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Mashu, Hokkaido (Japan) VEI 6 ", :start_year => -5550)
if result.length == 0
result = HoloceneEvent.create({:name => "Mashu, Hokkaido (Japan) VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[RBM9FWNjbU]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Lake_Mash%C5%AB",
:user_id => @user.id,
:slug => "UNCzyR0Wcb",
:lat => "43.572",
:lng => "144.561",
:start_year_uncert => "100",
:start_year => "-5550"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mashu, Hokkaido (Japan) VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[RBM9FWNjbU]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "UNCzyR0Wcb",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "RBM9FWNjbU", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Mt. Mizama (Crater Lake Caldera) VEI 7 ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Mt. Mizama (Crater Lake Caldera) VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption
[[fdjyKEZWDc]] 
Ice Core
Mt. Mazama summit and flank vents |
North flank (Llao Rock) |
This event is noted in native American legions about a battle of the Gods where one threw down the other.</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Crater_Lake",
:user_id => @user.id,
:slug => "EFuuaaR90r",
:lat => "42.930",
:lng => "-122.120",
:start_year_uncert => "150",
:start_year => "-5677"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mt. Mizama (Crater Lake Caldera) VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption
[[fdjyKEZWDc]] 
Ice Core
Mt. Mazama summit and flank vents |
North flank (Llao Rock) |
This event is noted in native American legions about a battle of the Gods where one threw down the other.</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "EFuuaaR90r",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "fdjyKEZWDc", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Khangar VEI 6 ", :start_year => -5700)
if result.length == 0
result = HoloceneEvent.create({:name => "Khangar VEI 6 ",
:end_year => "",
:body => "
<p>
Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Khangar",
:user_id => @user.id,
:slug => "U2b9hGKuvj",
:lat => "54.761",
:lng => "157.407",
:start_year_uncert => "16",
:start_year => "-5700"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Khangar VEI 6 ",
:end_year => "",
:body => "
<p>
Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "U2b9hGKuvj",
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
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Menenga, Eastern Africa VEI 6+ ", :start_year => -6050)
if result.length == 0
result = HoloceneEvent.create({:name => "Menenga, Eastern Africa VEI 6+ ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[VeatL22JUz]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @africa,
:url => "https://en.wikipedia.org/wiki/Menengai",
:user_id => @user.id,
:slug => "3UdbtQrSpd",
:lat => "-0.200",
:lng => "36.070",
:start_year_uncert => "",
:start_year => "-6050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Menenga, Eastern Africa VEI 6+ ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[VeatL22JUz]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @africa,
:slug => "3UdbtQrSpd",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "VeatL22JUz", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Kurile Lake Caldera VEI 7 ", :start_year => -6442)
if result.length == 0
result = HoloceneEvent.create({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "
<p>
Confirmed Eruption |
Radiocarbon (corrected)
[[Y23kpkhRbP]] 
</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Tao-Rusyr_Caldera",
:user_id => @user.id,
:slug => "Q08pcqgXf1",
:lat => "51.450",
:lng => "157.120",
:start_year_uncert => "28",
:start_year => "-6442"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "
<p>
Confirmed Eruption |
Radiocarbon (corrected)
[[Y23kpkhRbP]] 
</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "Q08pcqgXf1",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "Y23kpkhRbP", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Karymsky VEI 6 ", :start_year => -6600)
if result.length == 0
result = HoloceneEvent.create({:name => "Karymsky VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected) |
Karymsky caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Karymsky_(volcano)",
:user_id => @user.id,
:slug => "kw631ekhgp",
:lat => "54.049",
:lng => "159.443",
:start_year_uncert => "",
:start_year => "-6600"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Karymsky VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected) |
Karymsky caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "kw631ekhgp",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Fisher Caldera, Aleutian Islands  VEI 6 ", :start_year => -7420)
if result.length == 0
result = HoloceneEvent.create({:name => "Fisher Caldera, Aleutian Islands  VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[0g4nrMkgJ9]]  |
NE and SW parts of Fisher caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Fisher_Caldera",
:user_id => @user.id,
:slug => "FZVcx45cSn",
:lat => "54.650",
:lng => "-164.430",
:start_year_uncert => "200",
:start_year => "-7420"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Fisher Caldera, Aleutian Islands  VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[0g4nrMkgJ9]]  |
NE and SW parts of Fisher caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "FZVcx45cSn",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "0g4nrMkgJ9", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Pinatubo, Philippines VEI 6 ", :start_year => -7460)
if result.length == 0
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[XSjcTa6mYu]]  |
Tayawan caldera</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southeastasia,
:url => "https://en.wikipedia.org/wiki/Mount_Pinatubo",
:user_id => @user.id,
:slug => "BufC44WRE7",
:lat => "15.130",
:lng => "120.350",
:start_year_uncert => "150",
:start_year => "-7460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pinatubo, Philippines VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[XSjcTa6mYu]]  |
Tayawan caldera</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southeastasia,
:slug => "BufC44WRE7",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "XSjcTa6mYu", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Aira Caldera VEI 6 ", :start_year => -8050)
if result.length == 0
result = HoloceneEvent.create({:name => "Aira Caldera VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected) |
Wakamiko Caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Aira_Caldera",
:user_id => @user.id,
:slug => "PTZfdVk1Jn",
:lat => "31.593",
:lng => "130.657",
:start_year_uncert => "1000",
:start_year => "-8050"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Aira Caldera VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected) |
Wakamiko Caldera</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "PTZfdVk1Jn",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grimsvotn, Iceland VEI 6 ", :start_year => -8230)
if result.length == 0
result = HoloceneEvent.create({:name => "Grimsvotn, Iceland VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[ngbtgAQM4r]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @icelandandarcticocean,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "Qtwv9AYYn6",
:lat => "64.417",
:lng => "17.206",
:start_year_uncert => "50",
:start_year => "-8230"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grimsvotn, Iceland VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[ngbtgAQM4r]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @icelandandarcticocean,
:slug => "Qtwv9AYYn6",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "ngbtgAQM4r", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Minchinmavida VEI 6 ", :start_year => -8400)
if result.length == 0
result = HoloceneEvent.create({:name => "Minchinmavida VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @southamerica,
:url => "https://en.wikipedia.org/wiki/Michinmahuida",
:user_id => @user.id,
:slug => "d0SMTNg0F5",
:lat => "-42.793",
:lng => "-72.439",
:start_year_uncert => "150",
:start_year => "-8400"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Minchinmavida VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @southamerica,
:slug => "d0SMTNg0F5",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Ulleung, Korea VEI 6 ", :start_year => -8750)
if result.length == 0
result = HoloceneEvent.create({:name => "Ulleung, Korea VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[R8J65kGddW]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @eastasia,
:url => "https://en.wikipedia.org/wiki/Ulleungdo",
:user_id => @user.id,
:slug => "18LeAEHhY1",
:lat => "37.500",
:lng => "130.870",
:start_year_uncert => "",
:start_year => "-8750"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Ulleung, Korea VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[R8J65kGddW]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @eastasia,
:slug => "18LeAEHhY1",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "R8J65kGddW", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "WPr4KSGUKB",
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
:slug => "WPr4KSGUKB",
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
:slug => "jD9MSH9yBU",
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
:slug => "jD9MSH9yBU",
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
:body => "
<p>The only Bond event to show a signature in the ice cores. 300 years of coldness and dryness.
</p>
",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/8.2_kiloyear_event",
:user_id => @user.id,
:slug => "CpPRsJVgxt",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 5 - 8.2K Event ",
:end_year => "-6050",
:body => "
<p>The only Bond event to show a signature in the ice cores. 300 years of coldness and dryness.
</p>
",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "CpPRsJVgxt",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "sjA7zhZeBK",
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
:slug => "sjA7zhZeBK",
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
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Flood")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Flood",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -5060)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "
<p>
[[1RFFDjWrJp]] 
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "yjxpZP57xc",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5060"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "
<p>
[[1RFFDjWrJp]] 
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @europe,
:slug => "yjxpZP57xc",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "1RFFDjWrJp", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -4375)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "
<p>
[[8d5UPbeLng]] 
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "TWjR6RqC33",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4375"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "
<p>
[[8d5UPbeLng]] 
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @europe,
:slug => "TWjR6RqC33",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "8d5UPbeLng", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6 ", :start_year => -4000)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>[[vnVMLnyyZW]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "AWbEhUJN23",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "200",
:start_year => "-4000"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>[[vnVMLnyyZW]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "AWbEhUJN23",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "vnVMLnyyZW", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Bond 4 - 5.9K Event - intense aridification ", :start_year => -4200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "
<p>5.9K Event was one of the most intense aridification events during the Holocene.
The Sahara desert reforms by 3,500 BC.
</p>
",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "R2F2K9sXrf",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-4200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "-3900",
:body => "
<p>5.9K Event was one of the most intense aridification events during the Holocene.
The Sahara desert reforms by 3,500 BC.
</p>
",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "R2F2K9sXrf",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Piora Oscillation ", :start_year => -3250)
if result.length == 0
result = HoloceneEvent.create({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "
<p>An abrupt cold and wet period in climate history of the Holocene.  Global in nature.</p>
",
:tag_list => [],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "7KYVk1HmKM",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3250"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "
<p>An abrupt cold and wet period in climate history of the Holocene.  Global in nature.</p>
",
:tag_list => [],
:event_types => [ @climate ],
:region => @global,
:slug => "7KYVk1HmKM",
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
result = HoloceneEvent.where(:name => "Burckle Crater - Noah's Flood ", :start_year => -3125)
if result.length == 0
result = HoloceneEvent.create({:name => "Burckle Crater - Noah's Flood ",
:end_year => "-2800",
:body => "
<p>Unconfirmed</p>
",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_types => [  @impact,@place ] ,
:region => @indianocean,
:url => "",
:user_id => @user.id,
:slug => "AhdK2UVshJ",
:lat => "-30.86",
:lng => "61.36",
:start_year_uncert => "",
:start_year => "-3125"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Burckle Crater - Noah's Flood ",
:end_year => "-2800",
:body => "
<p>Unconfirmed</p>
",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_types => [ @impact,@place ],
:region => @indianocean,
:slug => "AhdK2UVshJ",
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
rsl = GlossaryTerm.where(:name => "Biblical Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Biblical Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Flood")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Flood",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Low growth Irish Oak - Tree Ring Event ", :start_year => -3195)
if result.length == 0
result = HoloceneEvent.create({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "
<p>
This tree ring event seems to have captured Noah's Flood[[rFbHQ83a2j]] .
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "CBpSVPfMMD",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3195"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Low growth Irish Oak - Tree Ring Event ",
:end_year => "",
:body => "
<p>
This tree ring event seems to have captured Noah's Flood[[rFbHQ83a2j]] .
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @europe,
:slug => "CBpSVPfMMD",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "rFbHQ83a2j", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Umm al Bini ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini ",
:end_year => "",
:body => "
<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   
Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather[[BwsP8uG8zM]] .
</p><p>
The Egyptian Drought</p>
<p>Unconfirmed</p>
",
:tag_list => ["ImpactEvent", "Earth", "Flood"],
:event_types => [  @impact,@place ] ,
:region => @middleeast,
:url => "",
:user_id => @user.id,
:slug => "QWet6t5QxF",
:lat => "31.241389",
:lng => "47.105833",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini ",
:end_year => "",
:body => "
<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   
Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather[[BwsP8uG8zM]] .
</p><p>
The Egyptian Drought</p>
<p>Unconfirmed</p>
",
:tag_list => ["ImpactEvent", "Earth", "Flood"],
:event_types => [ @impact,@place ],
:region => @middleeast,
:slug => "QWet6t5QxF",
:lat => "31.241389",
:lng => "47.105833",
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
@timeline_timeline.holocene_events << result unless @timeline_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Flood")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Flood",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "BwsP8uG8zM", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tree Ring Event(9 years) ", :start_year => -2354)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(9 years) ",
:end_year => "-2345",
:body => "
<p>Lasted 9 years.
[[ArPwjP1FY3]] 
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JezauBFh30",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2354"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(9 years) ",
:end_year => "-2345",
:body => "
<p>Lasted 9 years.
[[ArPwjP1FY3]] 
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "JezauBFh30",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "ArPwjP1FY3", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Bond 3 - 4.2 Kiloyear Event ", :start_year => -2200)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "
<p>Global Aridification causes the collapse of the Egyptian, the Akkadian Empire, the Liangzhu culture in China and various movements of tribes in India.
</p>
",
:tag_list => ["BondEvent"],
:event_types => [  @climate ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/4.2_kiloyear_event",
:user_id => @user.id,
:slug => "CPvwQCRrdF",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 3 - 4.2 Kiloyear Event ",
:end_year => "-2100",
:body => "
<p>Global Aridification causes the collapse of the Egyptian, the Akkadian Empire, the Liangzhu culture in China and various movements of tribes in India.
</p>
",
:tag_list => ["BondEvent"],
:event_types => [ @climate ],
:region => @global,
:slug => "CPvwQCRrdF",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Santorini/Thera VEI 7 ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
[[nGExNcguQq]] 
</p>
<p>The Santorini/Thera explosion is an interesting event to consider.  First, the Minoan people appear to have packed and left before the creation of the caldera.  Second, the unique color of the ejaculate seems to be the link to the 10 Plagues of Egypt as noted in the Bible.   And third, the dating of this event shifts the birth and time of Moses as well as other dates in the Bible.
</p><p>
It is one of two calderas that have been remembered in folk lore.  The other caldera is the Crater Lake caldera in Oregon, USA.  Native American Legions speak of a battle of the Gods with one throwing down the other.
</p>
",
:tag_list => ["Atlantis", "Eruption", "VEI7", "Tsunami", "Earth", "Earthquake"],
:event_types => [  @volcanic,@place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Santorini_caldera",
:user_id => @user.id,
:slug => "b4ZKLSwgWJ",
:lat => "36.404",
:lng => "25.396",
:start_year_uncert => "14",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Santorini/Thera VEI 7 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)
[[nGExNcguQq]] 
</p>
<p>The Santorini/Thera explosion is an interesting event to consider.  First, the Minoan people appear to have packed and left before the creation of the caldera.  Second, the unique color of the ejaculate seems to be the link to the 10 Plagues of Egypt as noted in the Bible.   And third, the dating of this event shifts the birth and time of Moses as well as other dates in the Bible.
</p><p>
It is one of two calderas that have been remembered in folk lore.  The other caldera is the Crater Lake caldera in Oregon, USA.  Native American Legions speak of a battle of the Gods with one throwing down the other.
</p>
",
:tag_list => ["Atlantis", "Eruption", "VEI7", "Tsunami", "Earth", "Earthquake"],
:event_types => [ @volcanic,@place ],
:region => @europe,
:slug => "b4ZKLSwgWJ",
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
rsl = GlossaryTerm.where(:name => "Atlantis")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Atlantis",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Tsunami")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tsunami",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "nGExNcguQq", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tree Ring Event(6 years) ", :start_year => -1628)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(6 years) ",
:end_year => "-1622",
:body => "
<p>Lasted 6 years[[JL6Vvnxaax]] .</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "UGGn505kTB",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1628"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(6 years) ",
:end_year => "-1622",
:body => "
<p>Lasted 6 years[[JL6Vvnxaax]] .</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "UGGn505kTB",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "JL6Vvnxaax", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "WYHyf2jXr8",
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
:slug => "WYHyf2jXr8",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "b2M12mNJ4w",
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
:slug => "b2M12mNJ4w",
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
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 6 ", :start_year => -1460)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[SkPxt8n594]]  |
Horomatangi Reefs?</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:slug => "ME5SSQUGt8",
:lat => "-38.820",
:lng => "176.000",
:start_year_uncert => "40",
:start_year => "-1460"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (corrected)[[SkPxt8n594]]  |
Horomatangi Reefs?</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "ME5SSQUGt8",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "SkPxt8n594", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6 ", :start_year => -1370)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>[[uLFk9KmM2L]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "C8eD03caGT",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "100",
:start_year => "-1370"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>[[uLFk9KmM2L]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "C8eD03caGT",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "uLFk9KmM2L", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "WegeqpZxAS",
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
:slug => "WegeqpZxAS",
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
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Mycenae - Earthquakes ", :start_year => -1200)
if result.length == 0
result = HoloceneEvent.create({:name => "Mycenae - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earth", "Earthquake"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "LvwGApE91w",
:lat => "37.730792",
:lng => "22.756382",
:start_year_uncert => "",
:start_year => "-1200"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mycenae - Earthquakes ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earth", "Earthquake"],
:event_types => [ @earth ],
:region => @europe,
:slug => "LvwGApE91w",
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
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Helka 3, Iceland VEI 6 ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Helka 3, Iceland VEI 6 ",
:end_year => "",
:body => "
<p>LHE date 1100 BC ±50 years[[jeYY2Wvcc6]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Hekla",
:user_id => @user.id,
:slug => "46d2AWc5L0",
:lat => "63.983333",
:lng => "-19.7",
:start_year_uncert => "50",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helka 3, Iceland VEI 6 ",
:end_year => "",
:body => "
<p>LHE date 1100 BC ±50 years[[jeYY2Wvcc6]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @global,
:slug => "46d2AWc5L0",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "jeYY2Wvcc6", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Downturn of environment: Tree Ring Event(18 years) ", :start_year => -1159)
if result.length == 0
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "
<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years[[GWxc0fkuvM]] .</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2GeqQNuxKS",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-1159"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Downturn of environment: Tree Ring Event(18 years) ",
:end_year => "-1141",
:body => "
<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years[[GWxc0fkuvM]] .</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "2GeqQNuxKS",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "GWxc0fkuvM", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "5DVxbnnd5a",
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
:slug => "5DVxbnnd5a",
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
:slug => "pKXEJ3FUjF",
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
:slug => "pKXEJ3FUjF",
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
:slug => "NM7gdGTNxh",
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
:slug => "NM7gdGTNxh",
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
rsl = GlossaryTerm.where(:name => "Bond Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Bond Event",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "5RBgbRznkM",
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
:slug => "5RBgbRznkM",
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
:slug => "bQp3jCc3xr",
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
:slug => "bQp3jCc3xr",
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
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Storegga Slide ", :start_year => -8100)
if result.length == 0
result = HoloceneEvent.create({:name => "Storegga Slide ",
:end_year => "",
:body => "
<p>A megatsunami Norwegian Sea caused by the collapse of a Fiord face.
</p>
",
:tag_list => ["Tsunami"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Storegga_Slide",
:user_id => @user.id,
:slug => "DL6qDYhTUW",
:lat => "64.866667",
:lng => "1.3",
:start_year_uncert => "",
:start_year => "-8100"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Storegga Slide ",
:end_year => "",
:body => "
<p>A megatsunami Norwegian Sea caused by the collapse of a Fiord face.
</p>
",
:tag_list => ["Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:slug => "DL6qDYhTUW",
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
rsl = GlossaryTerm.where(:name => "Tsunami")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tsunami",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "u31eWS0W7L",
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
:slug => "u31eWS0W7L",
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
:body => "
<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar.</p>
",
:tag_list => ["Tartessos"],
:event_types => [  @place ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Tartessos",
:user_id => @user.id,
:slug => "5aYRL4kf8v",
:lat => "37.21",
:lng => "-6.938",
:start_year_uncert => "",
:start_year => "-440"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Destruction of Tartessos ",
:end_year => "",
:body => "
<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar.</p>
",
:tag_list => ["Tartessos"],
:event_types => [ @place ],
:region => @europe,
:slug => "5aYRL4kf8v",
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
rsl = GlossaryTerm.where(:name => "Tartessos")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tartessos",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Helike, Greece disappears into the sea ", :start_year => -373)
if result.length == 0
result = HoloceneEvent.create({:name => "Helike, Greece disappears into the sea ",
:end_year => "",
:body => "
<p>The city was submerged by a tsunami in the winter of 373 BC.
</p>
",
:tag_list => ["Tsunami"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Helike",
:user_id => @user.id,
:slug => "JpTcPeYdjU",
:lat => "38.219167",
:lng => "22.132778",
:start_year_uncert => "",
:start_year => "-373"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Helike, Greece disappears into the sea ",
:end_year => "",
:body => "
<p>The city was submerged by a tsunami in the winter of 373 BC.
</p>
",
:tag_list => ["Tsunami"],
:event_types => [ @earth ],
:region => @europe,
:slug => "JpTcPeYdjU",
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
rsl = GlossaryTerm.where(:name => "Tsunami")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tsunami",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Raoul Island, Kermadec Islands VEI 6 ", :start_year => -208)
if result.length == 0
result = HoloceneEvent.create({:name => "Raoul Island, Kermadec Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[0J4sMf379g]]  |
Denham caldera</p>
<p>LHE lists the date as 250 BC.</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Raoul_Island",
:user_id => @user.id,
:slug => "9CS9g2C1sE",
:lat => "-29.266667",
:lng => "-177.916667",
:start_year_uncert => "75",
:start_year => "-208"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Raoul Island, Kermadec Islands VEI 6 ",
:end_year => "",
:body => "
<p>Confirmed Eruption |
Radiocarbon (uncorrected)[[0J4sMf379g]]  |
Denham caldera</p>
<p>LHE lists the date as 250 BC.</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "9CS9g2C1sE",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "0J4sMf379g", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tree Ring Event(4 years) ", :start_year => -208)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event(4 years) ",
:end_year => "-204",
:body => "
<p>Winter which lasted 4 years,[[ZDzuwpnjuz]] .</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "1yFVuCSBPL",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-208"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event(4 years) ",
:end_year => "-204",
:body => "
<p>Winter which lasted 4 years,[[ZDzuwpnjuz]] .</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "1yFVuCSBPL",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "ZDzuwpnjuz", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
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
:slug => "X5upQxRusZ",
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
:slug => "X5upQxRusZ",
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
result = HoloceneEvent.where(:name => "Taupo, New Zealand VEI 7 ", :start_year => 180)
if result.length == 0
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "
<p>
This is called the Hatepe eruption.  
While this volcano is in the southern hemisphere, it was noted in both China and Rome as ash and red skis. 
</p>
<p>
It was a VEI-7 event.
</p>
<p>
This volcano is outside the normal range of Global Winter events being south of the 30Th parallel.  
The fact that there were red skis recorded in Rome and China signifies that the sulfur dioxide crossed the equator.  
The magnitude of the explosion was the determining factor for its effect on the globe.
</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Taupo_Volcano",
:user_id => @user.id,
:slug => "rtxaN1NAUh",
:lat => "-38.820",
:lng => "176.000",
:start_year_uncert => "",
:start_year => "180"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Taupo, New Zealand VEI 7 ",
:end_year => "",
:body => "
<p>
This is called the Hatepe eruption.  
While this volcano is in the southern hemisphere, it was noted in both China and Rome as ash and red skis. 
</p>
<p>
It was a VEI-7 event.
</p>
<p>
This volcano is outside the normal range of Global Winter events being south of the 30Th parallel.  
The fact that there were red skis recorded in Rome and China signifies that the sulfur dioxide crossed the equator.  
The magnitude of the explosion was the determining factor for its effect on the globe.
</p>
",
:tag_list => ["Eruption", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "rtxaN1NAUh",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Rabaul, New Britain VEI 6 ", :start_year => 512)
if result.length == 0
result = HoloceneEvent.create({:name => "Rabaul, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  
Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  
The LHE list says 540 AD ±100 years.
[[TNx7t2rPn4]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [   ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Rabaul",
:user_id => @user.id,
:slug => "ucSznNw9Qw",
:lat => "-4.2",
:lng => "152.183333",
:start_year_uncert => "4",
:start_year => "512"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Rabaul, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  
Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  
The LHE list says 540 AD ±100 years.
[[TNx7t2rPn4]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  ],
:region => @global,
:slug => "ucSznNw9Qw",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "TNx7t2rPn4", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Bond 1 Tree Ring Event(9 years) ", :start_year => 536)
if result.length == 0
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event(9 years) ",
:end_year => "545",
:body => "
<p>
The cold period lasted 9 years in the tree ring records[[QhneQkKMpT]] .   This impact left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.   It's ocular density was 2 and a half times the explosion of Tambora (1815).  
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Xpv7w1rvu3",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "536"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Bond 1 Tree Ring Event(9 years) ",
:end_year => "545",
:body => "
<p>
The cold period lasted 9 years in the tree ring records[[QhneQkKMpT]] .   This impact left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.   It's ocular density was 2 and a half times the explosion of Tambora (1815).  
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "Xpv7w1rvu3",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "QhneQkKMpT", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Tree Ring Event ", :start_year => 540)
if result.length == 0
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "",
:body => "
<p>
This tree ring event seems to be part of the global winter starting in 535/536 AD[[5qFBk81dCt]] .
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "0KySGgnJSU",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "540"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tree Ring Event ",
:end_year => "",
:body => "
<p>
This tree ring event seems to be part of the global winter starting in 535/536 AD[[5qFBk81dCt]] .
</p>
",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_types => [ @climate ],
:region => @global,
:slug => "0KySGgnJSU",
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
rsl = GlossaryTerm.where(:name => "Tree Ring Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tree Ring Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Dendrochronology")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Dendrochronology",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "5qFBk81dCt", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Olympia destroyed by tsunami ", :start_year => 551)
if result.length == 0
result = HoloceneEvent.create({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "
<p>Earthquake at Olympia destroys the site at Peloponnese.[[33QwY461G6]] 
</p>
",
:tag_list => ["Tsunami", "Earthquake", "Earth"],
:event_types => [  @earth ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "FpsYNYpqkT",
:lat => "37.636164122",
:lng => "21.6249975",
:start_year_uncert => "",
:start_year => "551"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "
<p>Earthquake at Olympia destroys the site at Peloponnese.[[33QwY461G6]] 
</p>
",
:tag_list => ["Tsunami", "Earthquake", "Earth"],
:event_types => [ @earth ],
:region => @europe,
:slug => "FpsYNYpqkT",
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
rsl = GlossaryTerm.where(:name => "Tsunami")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Tsunami",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earthquake")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earthquake",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Earth")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Earth",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "33QwY461G6", :body => "OlympiaEarthquake", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Pago, New Britain VEI 6 ", :start_year => 710)
if result.length == 0
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>
[[Uv1aPN0Z4x]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Pago_(volcano)",
:user_id => @user.id,
:slug => "L750acU46U",
:lat => "-5.576",
:lng => "150.516",
:start_year_uncert => "75",
:start_year => "710"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Pago, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>
[[Uv1aPN0Z4x]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "L750acU46U",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "Uv1aPN0Z4x", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Churchill, Eastern Alaska VEI 6 ", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Churchill, Eastern Alaska VEI 6 ",
:end_year => "",
:body => "
<p>[[kmGBj9pPtf]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @northamerica,
:url => "https://en.wikipedia.org/wiki/Mount_Churchill",
:user_id => @user.id,
:slug => "eHD64m82eb",
:lat => "61.380",
:lng => "-141.750",
:start_year_uncert => "100",
:start_year => "800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Churchill, Eastern Alaska VEI 6 ",
:end_year => "",
:body => "
<p>[[kmGBj9pPtf]] 
</p>
",
:tag_list => ["Eruption", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @northamerica,
:slug => "eHD64m82eb",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "kmGBj9pPtf", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Dakataua, New Britain VEI 6 ", :start_year => 800)
if result.length == 0
result = HoloceneEvent.create({:name => "Dakataua, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>[[EHdrxf7KbJ]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [  @volcanic,@place ] ,
:region => @australasia,
:url => "https://en.wikipedia.org/wiki/Dakataua",
:user_id => @user.id,
:slug => "dDmEMpPTMZ",
:lat => "-5.094",
:lng => "150.094",
:start_year_uncert => "50",
:start_year => "800"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Dakataua, New Britain VEI 6 ",
:end_year => "",
:body => "
<p>[[EHdrxf7KbJ]] 
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI6"],
:event_types => [ @volcanic,@place ],
:region => @australasia,
:slug => "dDmEMpPTMZ",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 6")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 6",
:user_id => @user.id,
:book => @book
 })
end
biblio = nil
Footnote.create(:slug => "EHdrxf7KbJ", :body => "HoloceneEruptions", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "'Lighting and Meteors destroyed the corn' in Ireland ", :start_year => 1294)
if result.length == 0
result = HoloceneEvent.create({:name => "'Lighting and Meteors destroyed the corn' in Ireland ",
:end_year => "1297",
:body => "
<p>
'Lighting and Meteors destroyed the corn' in Ireland 1294, 'ten fireballs the size of houses' fell in China 1295, extraterrestrial inpact in Russia 1296 and fire-induced growth in giant sequoia dendrochronology, 1297.[[E0st9RDzpS]] 
</p>
",
:tag_list => [],
:event_types => [  @impact ] ,
:region => @europe,
:url => "",
:user_id => @user.id,
:slug => "TbQrbTHveb",
:lat => "",
:lng => "",
:start_year_uncert => "4",
:start_year => "1294"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "'Lighting and Meteors destroyed the corn' in Ireland ",
:end_year => "1297",
:body => "
<p>
'Lighting and Meteors destroyed the corn' in Ireland 1294, 'ten fireballs the size of houses' fell in China 1295, extraterrestrial inpact in Russia 1296 and fire-induced growth in giant sequoia dendrochronology, 1297.[[E0st9RDzpS]] 
</p>
",
:tag_list => [],
:event_types => [ @impact ],
:region => @europe,
:slug => "TbQrbTHveb",
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
biblio = nil
Footnote.create(:slug => "E0st9RDzpS", :body => "Baillie1999", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Mahuika Crater ", :start_year => 1440)
if result.length == 0
result = HoloceneEvent.create({:name => "Mahuika Crater ",
:end_year => "",
:body => "
<p>The dating of this 1440 AD impact is in dispute due to several factors.</p>
<p>Unconfirmed</p>
",
:tag_list => ["ImpactEvent"],
:event_types => [  @impact,@place ] ,
:region => @australasia,
:url => "",
:user_id => @user.id,
:slug => "V8Eaz5J1wZ",
:lat => "-48.3",
:lng => "166.4",
:start_year_uncert => "15",
:start_year => "1440"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mahuika Crater ",
:end_year => "",
:body => "
<p>The dating of this 1440 AD impact is in dispute due to several factors.</p>
<p>Unconfirmed</p>
",
:tag_list => ["ImpactEvent"],
:event_types => [ @impact,@place ],
:region => @australasia,
:slug => "V8Eaz5J1wZ",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Kuwae, Vanuatu VEI 7 ", :start_year => 1453)
if result.length == 0
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "
<p>
Three year cooling event.
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [  @volcanic,@place ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Kuwae",
:user_id => @user.id,
:slug => "UshCRjh9Q5",
:lat => "-16.829",
:lng => "168.536",
:start_year_uncert => "",
:start_year => "1453"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kuwae, Vanuatu VEI 7 ",
:end_year => "",
:body => "
<p>
Three year cooling event.
</p>
",
:tag_list => ["Eruption", "GlobalVolcano", "VEI7"],
:event_types => [ @volcanic,@place ],
:region => @global,
:slug => "UshCRjh9Q5",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Global Volcano")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Global Volcano",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 7")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 7",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "jPhgBJBL9A",
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
:slug => "jPhgBJBL9A",
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
:slug => "zH3UBR82t4",
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
:slug => "zH3UBR82t4",
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
:slug => "6LxTt8Xp2t",
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
:slug => "6LxTt8Xp2t",
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
:slug => "qe9fNQCpZ1",
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
:slug => "qe9fNQCpZ1",
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
result = HoloceneEvent.where(:name => "Laki Eruption, Grimsvotn Volcano, Iceland VEI 4+ ", :start_year => 1783)
if result.length == 0
result = HoloceneEvent.create({:name => "Laki Eruption, Grimsvotn Volcano, Iceland VEI 4+ ",
:end_year => "",
:body => "
<p>The famous volcanic event which started the great Benjamin Franklin asking the question of whether the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption.</p>
",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  @climate ] ,
:region => @europe,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "vkBzWQzXVT",
:lat => "64.42",
:lng => "-17.33",
:start_year_uncert => "",
:start_year => "1783"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Laki Eruption, Grimsvotn Volcano, Iceland VEI 4+ ",
:end_year => "",
:body => "
<p>The famous volcanic event which started the great Benjamin Franklin asking the question of whether the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption.</p>
",
:tag_list => ["Eruption", "VEI4"],
:event_types => [ @climate ],
:region => @europe,
:slug => "vkBzWQzXVT",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 4")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 4",
:user_id => @user.id,
:book => @book
 })
end
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
:slug => "vex6N3pExB",
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
:slug => "vex6N3pExB",
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
:body => "
<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>
",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "8Ys66FGUXr",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1859"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "
<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>
",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [ @earth ],
:region => @global,
:slug => "8Ys66FGUXr",
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
rsl = GlossaryTerm.where(:name => "Magnetic Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Magnetic Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Historical")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Historical",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Tunguska Event ", :start_year => 1908)
if result.length == 0
result = HoloceneEvent.create({:name => "Tunguska Event ",
:end_year => "",
:body => "
<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>
",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [  @impact,@place ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "Hj6w3dKpLr",
:lat => "60.916667",
:lng => "101.95",
:start_year_uncert => "",
:start_year => "1908"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tunguska Event ",
:end_year => "",
:body => "
<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>
",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [ @impact,@place ],
:region => @fareast,
:slug => "Hj6w3dKpLr",
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
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "Historical")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Historical",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grimsvotn Volcano, Iceland VEI 4 ", :start_year => 2010)
if result.length == 0
result = HoloceneEvent.create({:name => "Grimsvotn Volcano, Iceland VEI 4 ",
:end_year => "",
:body => "
<p>This eruption caused disruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>
",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  @volcanic,@place ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "QrRuj0FYP6",
:lat => "64.417",
:lng => "17.206",
:start_year_uncert => "",
:start_year => "2010"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Grimsvotn Volcano, Iceland VEI 4 ",
:end_year => "",
:body => "
<p>This eruption caused disruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>
",
:tag_list => ["Eruption", "VEI4"],
:event_types => [ @volcanic,@place ],
:region => @global,
:slug => "QrRuj0FYP6",
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
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI 4")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI 4",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => 690)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "j2JjbhJEk7",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "j2JjbhJEk7",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -360)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "sJ1Q6ZEyc2",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "sJ1Q6ZEyc2",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -770)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mUa5W5ksha",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "mUa5W5ksha",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -1390)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "2sabrXMZRx",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "2sabrXMZRx",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -2860)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "ssBr3V3yG2",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "ssBr3V3yG2",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3340)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "xfxcYnNSfK",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "xfxcYnNSfK",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "eSFRBUTz8N",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "eSFRBUTz8N",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3630)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "kua1y41w9d",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "kua1y41w9d",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -3940)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "KUcPe9Q9a9",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "KUcPe9Q9a9",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -4230)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "sSDjf3FApj",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "sSDjf3FApj",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -4330)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "TqxM7bqyGE",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "TqxM7bqyGE",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5260)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "BHM80S2P5F",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "BHM80S2P5F",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5460)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "nRVzq2fb5P",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "nRVzq2fb5P",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5620)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "E7Wqvv1fHa",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "E7Wqvv1fHa",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5710)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "c5GxDtVEwa",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "c5GxDtVEwa",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -5990)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "096vaB1Hp2",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "096vaB1Hp2",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -6220)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mZfALeG0jC",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "mZfALeG0jC",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -6400)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Hyt94CxQD4",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "Hyt94CxQD4",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -7040)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "mMYMAn28Ze",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "mMYMAn28Ze",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -7310)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "d77nM7fSTs",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "d77nM7fSTs",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -7520)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "JEKL6zBJGD",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "JEKL6zBJGD",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -8220)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Ga6BQR0rFe",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "Ga6BQR0rFe",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Grand Solar Minimum ", :start_year => -9170)
if result.length == 0
result = HoloceneEvent.create({:name => "Grand Solar Minimum ",
:end_year => "",
:body => "",
:tag_list => ["SolarMinimum"],
:event_types => [  @earth ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "SdJMEeLDhH",
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
:tag_list => ["SolarMinimum"],
:event_types => [ @earth ],
:region => @global,
:slug => "SdJMEeLDhH",
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
rsl = GlossaryTerm.where(:name => "Solar Minimum")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Solar Minimum",
:user_id => @user.id,
:book => @book
 })
end
result = Chapter.create({:name => "Volcanos and Rocks Big Rocks ",
:position =>chapter_index,
:show_events => true,
:always_display_events => true,
:slug => "volcanoes_impacts",
:book => @book,
:body => "
<p>Climate is usually a pretty stable system.  
Oscillations do occurs, yet they are predictable.  
Sometime things happen which affect the climate, but are not predictable.  
Such things as volcanic eruptions and impact events from space do leave their mark on the climate and have a profound impact on history.</p>
"
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
biblio = Biblioentry.find_by_xreflabel("holoceneeruptions")
rt = result.footnotes.where(slug: "", biblioentry_id: biblio.id)
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id) if rt.length == 0
result = Section.create({:name => "Volcanic Events ",
:body => "
<p>When volcanoes erupt, they are grade on what is called the Volcanic Explosivity Index.  
This is a scale from 1 to 8.  An eruption of 6 or above is going to significantly effect the climate for a few years.
</p><p>
The eruption which create the Year without a Summer (1815 - Tambora) was a 7 on the VEI.</p>
<p>A partial list of eruptions during the Holocene:
</p>
",
:slug => "ZN5VgkG0xQ",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Eruption")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Eruption",
:user_id => @user.id,
:book => @book
 })
end
rsl = GlossaryTerm.where(:name => "VEI")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "VEI",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 ", :start_year => 1815)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "T9x36StAGa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1815"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "T9x36StAGa",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "ZDk62g4Vks",
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
:slug => "ZDk62g4Vks",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "fwueyxtr5k",
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
:slug => "fwueyxtr5k",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "Gq4dqvtNnU",
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
:slug => "Gq4dqvtNnU",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "8Ku0Ve5L9w",
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
:slug => "8Ku0Ve5L9w",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Mt. Mizama (Crater Lake Caldera) VEI 7 ", :start_year => -5677)
if result.length == 0
result = HoloceneEvent.create({:name => "Mt. Mizama (Crater Lake Caldera) VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "YZcBW4dZZH",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-5677"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Mt. Mizama (Crater Lake Caldera) VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "YZcBW4dZZH",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Kurile Lake Caldera VEI 7 ", :start_year => -6442)
if result.length == 0
result = HoloceneEvent.create({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Vz2yfRdmCZ",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-6442"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Kurile Lake Caldera VEI 7 ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Vz2yfRdmCZ",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-6442"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "R1TUf4KrBM",
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
:slug => "R1TUf4KrBM",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "SGzEnQPnRP",
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
:slug => "SGzEnQPnRP",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "7LkEAkby9D",
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
:slug => "7LkEAkby9D",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "HHx2aAjGSN",
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
:slug => "HHx2aAjGSN",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "AGqBqWLpX0",
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
:slug => "AGqBqWLpX0",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "vXMLd73PDM",
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
:slug => "vXMLd73PDM",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Tambora, Indonesia VEI 7 continuous eruptions until explosion in 1815 ", :start_year => 1812)
if result.length == 0
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7 continuous eruptions until explosion in 1815 ",
:end_year => "1815",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "54qK5yUXNR",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "1812"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Tambora, Indonesia VEI 7 continuous eruptions until explosion in 1815 ",
:end_year => "1815",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "54qK5yUXNR",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "ZvWkpLVjbz",
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
:slug => "ZvWkpLVjbz",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "yrQhgFv4r6",
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
:slug => "yrQhgFv4r6",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "xqMQbfUWUC",
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
:slug => "xqMQbfUWUC",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "9dJmAxLnAC",
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
:slug => "9dJmAxLnAC",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "SMsLtX44JT",
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
:slug => "SMsLtX44JT",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "Epa03m0yxN",
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
:slug => "Epa03m0yxN",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "Sex1N3hAtF",
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
:slug => "Sex1N3hAtF",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "8Hpj0fExvT",
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
:slug => "8Hpj0fExvT",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "PpgPkXYrq5",
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
:slug => "PpgPkXYrq5",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "8rc9wk0rC8",
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
:slug => "8rc9wk0rC8",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "VLVCNbthFt",
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
:slug => "VLVCNbthFt",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "rrBLdznp9m",
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
:slug => "rrBLdznp9m",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "4PPheY8wm3",
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
:slug => "4PPheY8wm3",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "2SfHUkyexr",
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
:slug => "2SfHUkyexr",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "X90PLMJkDT",
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
:slug => "X90PLMJkDT",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "P05bm4M8kw",
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
:slug => "P05bm4M8kw",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "FSsrCPsD4J",
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
:slug => "FSsrCPsD4J",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "QWVWZ0DC3Z",
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
:slug => "QWVWZ0DC3Z",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "LeFashPQnd",
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
:slug => "LeFashPQnd",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "G3cbAFPcZ9",
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
:slug => "G3cbAFPcZ9",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "LWyUwzm1rS",
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
:slug => "LWyUwzm1rS",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "vX99wtLy4q",
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
:slug => "vX99wtLy4q",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "VwpCUaJs2c",
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
:slug => "VwpCUaJs2c",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "Ne0j9Ekbes",
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
:slug => "Ne0j9Ekbes",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "Ydz7S9Dtmc",
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
:slug => "Ydz7S9Dtmc",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Section.create({:name => "Impact Events ",
:body => "
<p>The frequency of impact events is inconclusive as to how often a history changer occurs.  
The climate effects comes from the impact ejaculate being blown into the atmosphere as if it were a volcanic event.
</p><p>
A potential measure would be the check the ammonia levels in the ice core caps to determine if there is a relationship to impact events and high levels.  
The level of the 535 impact event was the second highest of the last 2,000 year in the Greenland ice cores.  The highest in that time frame was at 1014 AD.
</p>
<p>A partial list of impact events for the Holocene:
</p>
",
:slug => "LNn1rhjc2X",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
rsl = GlossaryTerm.where(:name => "Impact Event")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Impact Event",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Younger Dryas Impact Event ", :start_year => -10950)
if result.length == 0
result = HoloceneEvent.create({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "dj9c7M5DUu",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-10950"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Younger Dryas Impact Event ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "dj9c7M5DUu",
:lat => "",
:lng => "",
:url => "",
:user_id => @user.id,
:start_year_uncert => "",
:start_year => "-10950"
})
debugger if res.nil?
result = result[0]
end
end
@timeline.holocene_events << result unless @timeline.holocene_events.include?(result)
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "nuxZQYfS2P",
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
:slug => "nuxZQYfS2P",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "ukrjCBUmbx",
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
:slug => "ukrjCBUmbx",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "qsJG4URWs3",
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
:slug => "qsJG4URWs3",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "UTTApsqkVz",
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
:slug => "UTTApsqkVz",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "dc9gQyEqSq",
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
:slug => "dc9gQyEqSq",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "9bngdAxPan",
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
:slug => "9bngdAxPan",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "UxP5UmaRKS",
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
:slug => "UxP5UmaRKS",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "gcq68AHp7G",
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
:slug => "gcq68AHp7G",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "TyBrPBmmQZ",
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
:slug => "TyBrPBmmQZ",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Sirente Italy ", :start_year => 312)
if result.length == 0
result = HoloceneEvent.create({:name => "Sirente Italy ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "Q6Eup8Weqa",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "312"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Sirente Italy ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "Q6Eup8Weqa",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "KRabw6cnG7",
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
:slug => "KRabw6cnG7",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "sBdGDcfEVR",
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
:slug => "sBdGDcfEVR",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "UHgAv5VfKV",
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
:slug => "UHgAv5VfKV",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "sCBMSs1zWv",
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
:slug => "sCBMSs1zWv",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "RE6sybpuy7",
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
:slug => "RE6sybpuy7",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
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
:slug => "3XE52EuZT4",
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
:slug => "3XE52EuZT4",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "Umm al Bini ", :start_year => -2193)
if result.length == 0
result = HoloceneEvent.create({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [   ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "4d7AfKreBp",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-2193"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Umm al Bini ",
:end_year => "",
:body => "",
:tag_list => [],
:event_types => [  ],
:region => @global,
:slug => "4d7AfKreBp",
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
@volcanoes_impacts_timeline.holocene_events << result unless @volcanoes_impacts_timeline.holocene_events.include?(result)
@object.holocene_events << result
