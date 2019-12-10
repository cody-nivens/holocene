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
result = Biblioentry.create({:name => "Wikipedia - The Free Encyclopedia",
  :xreflabel => "wikipedia",
  :releaseinfo => "<a href='https://www.wikipedia.org/'>The Free Encyclopedia</a>",
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
acronym = GlossaryTerm.where("name = ? or term = ?","XML","XML").find_or_create_by({term: "XML",
  :name => "XML",
  :book => @book,
  :body => "Some reasonable definition here.",
  :user => @user
})
term = GlossaryTerm.where("name = ? or term = ?","Extensible Markup Language","Extensible Markup Language").find_or_create_by({name: "Extensible Markup Language",
  :book => @book,
  :user => @user,
  :term => "xml",
  :body => "Some reasonable definition here.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = GlossaryTerm.where("name = ? or term = ?","sgml","sgml").find_or_create_by({term: "sgml",
  :name => "sgml",
  :book => @book,
  :body => "",
  :user => @user
})
seealso = nil
acronym = nil
term = GlossaryTerm.where("name = ? or term = ?","SGML","SGML").find_or_create_by({name: "SGML",
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
acronym = GlossaryTerm.where("name = ? or term = ?","SGML","SGML").find_or_create_by({term: "SGML",
  :name => "SGML",
  :book => @book,
  :body => "Some reasonable definition here.",
  :user => @user
})
term = GlossaryTerm.where("name = ? or term = ?","Standard Generalized Markup Language","Standard Generalized Markup Language").find_or_create_by({name: "Standard Generalized Markup Language",
  :book => @book,
  :user => @user,
  :term => "sgml",
  :body => "Some reasonable definition here.",
  :see => see,
  :seealso => seealso,
  :acronym => acronym
})
debugger if term.errors.count > 0
see = GlossaryTerm.where("name = ? or term = ?","vei","vei").find_or_create_by({term: "vei",
  :name => "vei",
  :book => @book,
  :body => "",
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
acronym = GlossaryTerm.where("name = ? or term = ?","VEI","VEI").find_or_create_by({term: "VEI",
  :name => "VEI",
  :book => @book,
  :body => "A numeric value denoting how large a volcanic explosion is compaired to other explosions.  Indexes greater than 5 affect the global climate.",
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
result = Chapter.create({:name => "Cultural Events ",
:position =>chapter_index,
:slug => "cTN3LCe15t",
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
result = Section.create({:name => "Docestication of the Animals ",
:body => "",
:slug => "nEvLda2jub",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
result = HoloceneEvent.where(:name => "Domestication of Horses", :start_year => -3500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Horses",
:end_year => "",
:body => "<p>The start of organized War[[QsRZgDX7AB]]
</p>",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Domestication_of_the_horse",
:user_id => @user.id,
:slug => "vZKGFKDf3K",
:lat => "",
:lng => "",
:start_year_uncert => "",
:start_year => "-3500"
})
else
if result[0].body ==""
res = result[0].update_attributes({:name => "Domestication of Horses",
:end_year => "",
:body => "<p>The start of organized War[[QsRZgDX7AB]]
</p>",
:tag_list => ["Domestication"],
:event_types => [ @cultural ],
:region => @global,
:slug => "vZKGFKDf3K",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
biblio = Biblioentry.find_by_xreflabel("wikipedia")
Footnote.create(:slug => "", :body => "", :noted => result,:biblioentry_id => biblio.id)
biblio = nil
Footnote.create(:slug => "QsRZgDX7AB", :body => "This is my thoughts", :biblioentry_id => (biblio.nil? ? nil : biblio.id), :noted => result)
result = HoloceneEvent.where(:name => "Dog buried inside of human dwellings ", :start_year => -12700)
if result.length == 0
result = HoloceneEvent.create({:name => "Dog buried inside of human dwellings ",
:end_year => "",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "L4fuYHJrFR",
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
:event_types => [ @cultural ],
:region => @neareast,
:slug => "L4fuYHJrFR",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
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
:body => "<p>Western Dog branch replaced by Eastern by 4,400 BC.
</p>",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "z5jn0r7AJu",
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
:event_types => [ @cultural ],
:region => @global,
:slug => "z5jn0r7AJu",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
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
:event_types => [  @cultural,@cultural ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "QTfpaD4pn9",
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
:event_types => [ @cultural,@cultural ],
:region => @neareast,
:slug => "QTfpaD4pn9",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
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
:event_types => [  @cultural ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "2M2LaGAkN9",
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
:event_types => [ @cultural ],
:region => @neareast,
:slug => "2M2LaGAkN9",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = HoloceneEvent.where(:name => "Domestication of Cats ", :start_year => -7500)
if result.length == 0
result = HoloceneEvent.create({:name => "Domestication of Cats ",
:end_year => "-7000",
:body => "",
:tag_list => ["Domestication"],
:event_types => [  @cultural ] ,
:region => @neareast,
:url => "",
:user_id => @user.id,
:slug => "T4W86DBJ2V",
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
:event_types => [ @cultural ],
:region => @neareast,
:slug => "T4W86DBJ2V",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
@object.holocene_events << result
rsl = GlossaryTerm.where(:name => "Domestication")
if rsl.length == 0
rsl = GlossaryTerm.create({:name => "Domestication",
:user_id => @user.id,
:book => @book
 })
end
result = Section.create({:name => "Agriculture ",
:body => "",
:slug => "SEtW9r10Zq",
:position => section_index,
:display_name => true,
:chapter_id => @chapter.id
})
@object = result
section_index += 1
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
:url => "",
:user_id => @user.id,
:slug => "Js72eVMcd2",
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
:event_types => [ @cultural ],
:region => @eurasia,
:slug => "Js72eVMcd2",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
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
:url => "",
:user_id => @user.id,
:slug => "zNL2su13sD",
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
:event_types => [ @cultural ],
:region => @neareast,
:slug => "zNL2su13sD",
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
@chapter1_timeline.holocene_events << result unless @chapter1_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = Chapter.create({:name => "Chapter Two Stuff ",
:position =>chapter_index,
:slug => "KnVZxEAYkc",
:book => @book,
:body => ""
})
@object = result
@chapter = result
chapter_index += 1
section_index = 0
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
:slug => "RHuC6z8mmV",
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
:slug => "RHuC6z8mmV",
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
@chapter2_timeline.holocene_events << result unless @chapter2_timeline.holocene_events.include?(result)
@object.holocene_events << result
result = HoloceneEvent.where(:name => "The Carrington Event: Solar Storm of 1859 ", :start_year => 1859)
if result.length == 0
result = HoloceneEvent.create({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
There were fires along the telegraph lines and station due to the storm generating power in the wires.
</p>",
:tag_list => ["MagneticEvent", "Historical"],
:event_types => [  @climate ] ,
:region => @global,
:url => "",
:user_id => @user.id,
:slug => "PnY0W8CN9D",
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
:event_types => [ @climate ],
:region => @global,
:slug => "PnY0W8CN9D",
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
@chapter2_timeline.holocene_events << result unless @chapter2_timeline.holocene_events.include?(result)
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
:body => "<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion.
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>",
:tag_list => ["ImpactEvent", "Historical"],
:event_types => [  @impact ] ,
:region => @fareast,
:url => "",
:user_id => @user.id,
:slug => "CG837uXBFK",
:lat => "",
:lng => "",
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
:event_types => [ @impact ],
:region => @fareast,
:slug => "CG837uXBFK",
:lat => "",
:lng => "",
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
@chapter2_timeline.holocene_events << result unless @chapter2_timeline.holocene_events.include?(result)
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
result = HoloceneEvent.where(:name => "Grimsvotn Volanco, Iceland VEI 4 ", :start_year => 2010)
if result.length == 0
result = HoloceneEvent.create({:name => "Grimsvotn Volanco, Iceland VEI 4 ",
:end_year => "",
:body => "<p>This eruption caused desruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>",
:tag_list => ["Eruption", "VEI4"],
:event_types => [  @volcanic ] ,
:region => @global,
:url => "https://en.wikipedia.org/wiki/Gr%C3%ADmsv%C3%B6tn",
:user_id => @user.id,
:slug => "vFg1ETs9sX",
:lat => "",
:lng => "",
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
:event_types => [ @volcanic ],
:region => @global,
:slug => "vFg1ETs9sX",
:lat => "",
:lng => "",
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
@chapter2_timeline.holocene_events << result unless @chapter2_timeline.holocene_events.include?(result)
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
