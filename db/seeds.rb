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

@chapter = Chapter.create({:name => "Preface",
:body => "<p>This book started with the book </p><p>.  During it's reading, I began to look at history in a different way.  Previously, I had followed the tradition of cultural forces verses population as the main driver of history. 
</p><p> presented the idea that the environment's changes and the trail left by various peoples as they have struggled to live and ensure they children's survival influenced the development of civilization.
</p><p>
Brian Fagan's books and their assorted information on climate and its affect on history further informed this concept with data in recorded history.
Patterns in weather and their effects on the history of people became very apparent. 
Yet it was apparent from these books that weather could not explain all the various changes in the development of civilization.
A question formed in my mind as to what caused the breaks in historical development.  
Richard Stothers'</p><p> work presented the Global Winter pattern by applying to many cases in the last 2,000 years.  
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
@chapter = Chapter.create({:name => "Introduction ",
:body => "<p>My first and primary occupation in life has been Computer Science.  From beginning with Basic on a Woods</p><p> computer and the December 1973 Popular Science magazine's article on the Intel 8080 microprocessor chip to today's cloud environment, Computer Science and its practice has allowed me to sharpen my skills at pattern recognition.  
</p><p>
The science of Computer Science is finding the patterns that define the interaction and manipulation of data and doing so in an efficient manner.  The engineering art of Computer Science is in finding ways to apply those patterns to an ever changing array of data and the needs for knowledge that arises from the crunching of that data.
</p><p>
This pattern awareness lead me to Chinese Medicine and a degree and license in Chinese Medicine and Acupuncture.    The Chinese over the course of millennium have discovered patterns in how the body reacts to bacteriological and viral influences as well as metabolic changes.
Their effect lead to a model of what a healthy person should be as they age.  
As time passed the Chinese scholars augmented the understanding of these traditions with descriptions of patterns related to epidemics and chronic health problems endemic to Mankind.  
</p><p>
Chinese Medicine
</p><p>
 lead me to study the epidemics of history looking at the patterns that a virus would have on society.  In 220 AD Zhong Zhung Zhing 
</p><p>
published the </p><p> (The treatment of Cold Disorders).   
This book came about because Dr Zhong lost three quarters of his clan to an epidemic (believed to be Typhus)
</p><p>
</p><p>
causing him to begin the practice of medicine to aid the survivors. 
85% of the herbal formulas in this book are still in use today.
</p><p>
Having looked at the history of several epidemics, it is apparent to me that many people cannot comprehend the horror of the mass destruction of humanity and as a result reduce the observations of past historians with remarks of 'of course, that cannot be correct'  in reference to figures stated by various people in their writings.
Yet, time has proved many historians of the past to be accurate to the extent of their observations and it is not incomprehensible that in fact at various place during the Justian Plague and the Black Death that populations in some areas were indeed decimated with 9 of 10 people dying just as other places felt no losses.
</p><p>
Documentation of this phenomena are in the modern worlds interactions with 'lost' tribes in the Amazon and how first contact results in a 90% loss of life.  Cortez
 conquered Mexico due to Smallpox
</p><p>
</p><p>
</p><p>
 and other viruses that the Incas had caught from Cortez and his crew.   
</p><p>
In the Amazon, there are archaeological digs going on documenting the settlements abandoned 500 years ago</p><p>.   
With the destruction of a civilization to such an extent, more than culture is lost as the skills to continue basic survival are reduced to subsistence level at best.  
Plague is indiscriminate in its effects on the knowledge level of a population.  
During a famine,
</p><p>
 it is the young, the sick, the old, the weak who die first.  
People with skills survive because people reliant on those skills will support those individuals possessing them.   
The concept of the 'noblar third'.  During a plague, the loss of this third results in the degredation of civilization.
During a plague, your chances are dependent on exposure, genes and preexisting immune system strength which paradoxically does not ensure the survival of the fittest.  
During the 'Swine' flu epidemic of 1919, it was the young and strong that died is most numbers.  
Their immune systems launched too strong of an attack resulting in an autoimmune condition.  
During the 2008 round of Swine flu, it was children who were most effected with prolonged effects observed.  
</p><p>
</p><p>
This pattern of epidemics on a native</p><p> population can possibly be used to explain the mystery of the Minion's disappearance from history as well as the interesting fact that an epidemic of 1,500BC left its mark on the gene pool of Europe</p><p>.
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
</p><p>
 
A condition under which the temperature is low and plants do not grow due to cold and low light conditions.  
In the 535-6 event, the effect was described as a year of living in eclipse as that was the resulting light density from the sun filtering through the dust throw up into the atmosphere. During the 'Cold War', much discussion was given to the effects of a Nuclear Winter.  A similar condition, but with nuclear radiation to contend with as well.  
</p>"
})
@chapter = Chapter.create({:name => "Global Winter",
:body => "<p>A global winter is a condition that was first examined in relation to Nuclear war.  What would happen if the globe suffered a winter condition that lasted several years?  
While we hope that Nuclear war is not something that will affect history anytime soon, a volcano can and often does produce the effect.  
Additionally, the impact of a comet or meteorite sufficiently large would also impact weather.
</p><p>
A global winter must be distinguished from a hemispheric winter which  affects only the middle to upper latitudes above or below the equator.   
In 2009, a volcano in Iceland exploded and in the winter of 2010, Western Europe is suffering a severely cold winter.  
While today, it is great  inconvenience to the inhabitants of Western Europe, in the past it would have meant the deaths of young and old from exposure and starvation.  
When the cold extends into summer, a 'Winter' is happening.  
</p><p>
In 1815, the Tambora volcano</p><p> exploded resulting in a global winter within 'recorded' history</p><p>.  
Indeed the records available demonstrate the extent to which the weather in North Eastern America changed is very dramatic.  
When examined along side the records from Krakatoa, it can be seen that 1815 'winter' effect was significantly larger.  
1815 is called the last crisis of subsistence where the ability of people to feed themselves was greatly challenged.</p>"
})
result = Section.create({:name => "Definition",
:body => "<p>A Global winter is a climate event which encompasses the whole planet</p><p>.   
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
</p><p>
The difference between a global  and a hemispheric winter is that the hemispheric winter is usually a couple of years of cold followed by fairly normal weather.  In the northern hemisphere, the weather would be a cold atmosphere with a warm ocean current.  
Not much effect would be felt about four years down the line when waters warmed in the Pacific tootles along side Europe as most of those waters are warmed in the southern pacific.
</p><p>
A event in the Southern Hemisphere would have an immediate effect on Australia and South America and southern Africa as well as an effect on Europe as soon as two years latter since all the waters on the way to Europe are coursing through the southern hemisphere and would last longer than a purely northern event as the main volume of water in the Thermohaline circulation runs through the southern hemisphere.</p>",
:chapter_id => @chapter.id
})
result = Section.create({:name => "Famine",
:body => "<p>Famine</p><p> was very common event with an extreme change of weather.  
The Year without a Summer in 1816 was the last great Crisis of subsistence in the Western Hemisphere.  
After that year, modern transportation has eased the burdens of feeding the population.
</p><p>
In ancient time, an extreme weather event would result in famine with in a year.  
If the event occur ed early in the year and no real crops where harvested, famine would occur.  
With a truncated harvest, famine would start early the next year.  
From a simple event, there could be 1 to 2 years of no or substandard harvests followed by 2 years of barely sufficient harvests followed by another 2 to 3 years of substandard harvests.</p>",
:chapter_id => @chapter.id
})
@chapter = Chapter.create({:name => "Arthur and The Justian Plague ",
:body => "<p>
Impact event by two bodies resulting in impact craters called Tabban and Kenmore in the Gulf of Carpeneria, Australia.
The cold period lasted 9 years in the tree ring records.
This impact left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.
It's ocular density was 2 and a half times the explosion of Tambora (1815).
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'
</p>"
})
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
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "https://en.wikipedia.org/wiki/battle_of_badon",
:start_year_uncert => "",
:start_year => "516"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "535, Mar 24- 536, Jun 24 AD -  Year of Darkness ",
:end_year => "536",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Year of Darkness - global winter ",
:end_year => "544",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Year of Darkness - total weather affect ",
:end_year => "595",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Death of Arthur ",
:end_year => "",
:body => "<p>
In the Anneals Cambriae entry for 537 states 'The Strife of Camlann in which Arthur and Medraut fell [and there was death in Britain and in Ireland].'
The '[and there was death in Britain and Ireland]' ties the death of Arthur to the deaths resulting from the 535 impact at Kenmore and Tabban in Australia.
</p>",
:tag_list => ["Arthur"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "537"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Famine"],
:event_type => @cultural,
:citations => [ @annalesulster],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_type => @cultural,
:citations => [ @annalesulster],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "539"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Failure of Bread",
:end_year => "",
:body => "",
:tag_list => ["Arthur", "Famine"],
:event_type => @cultural,
:citations => [ @annalesulster],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "540"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Justian Plague.  Second Occurrence of Plague in Europe ",
:end_year => "",
:body => "<p>
An Empire is not only the ground help by those disposed to its existence, but also the people.
Its citizens who serve as government, religious, cultural and business leaders from ties between communities that are based on trust and mutual understanding.  When plague strikes, the indiscriminate manner of death leads to an uneven distribution of contacts over the larger state.
</p><p>
With such a reduction in communal contentedness, the concept of greater nationhood ceases to exist.
The trust and mutual understanding coming from known personal constants reduces to knowledge of a brother's cousin's friend's cousin.
Family to Family contacts exist if the Family exists.
After a plague, a family's reduction in size reduces it knowledge of the business and its properties.
</p><p>
The Manorialism started in the Third century contributed to this reduction in knowledge because instead of masters of a craft spread out amount the population, they were isolated in number to a Manor.
The lost of an estates master with the job following to a journeyman would cause the Estate owner to seek out a master of the craft if they could be found.
</p>",
:tag_list => ["Epidemic", "BubonicPlague", "Historical"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "541"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Final collapse of the Roman Empire ",
:end_year => "",
:body => "<p>
Lost of 'Noblest third' of population.
Loss of complexity.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "600"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@arthur_timeline.holocene_events << result
@chapter.holocene_events << result
@chapter = Chapter.create({:name => "Cultural Events ",
:body => "<p>Events caused by Man or happeded to Mankind.
</p>"
})
result = HoloceneEvent.create({:name => "Hunter/Gatherer Agriculture ",
:end_year => "-10900",
:body => "<p>The first agriculture or selection of plants for food to carry started with wild grains as the groups moved across the landscape.
</p><p>This ended with the Colvis Impact.  The Younger Dryus pushed the growing zones for grain more southward.  Starvation and the 
abandonment of settlements as the people moved around to find food.  Their movement and attempts to find grain caused them to try to grow
it where conditions seemed right creating true agriculture.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
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
:event_type => @cultural,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Gobekli Tepe - level II ",
:end_year => "-8000",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8800"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Flood of Dardanus ",
:end_year => "",
:body => "<p>The story of the flood of Dardanus states that Dardanus survived on the  mountain which became Samothraki island in the Aegean sea.  The date for the flooding of the Samothraki plateau is about 8,500 BC(4).</p>",
:tag_list => ["Earth", "Flood"],
:event_type => @cultural,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 7 - Beginnings of grain agriculture ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8300"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Gobekli Tepe - level I ",
:end_year => "-7900",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "First Ocean going boats ",
:end_year => "",
:body => "<p>The first ocean going boats used between the Mesopotamia delta and Kuwait and other place along the Gulf shore area(7).</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Copper Mining at Rio Tinto, Spain ",
:end_year => "",
:body => "<p>
</p><p>
Rio Tinto is the oldest mine in use in the western hemisphere.  It's importance in history has been over looked.  Perhaps due to it's remoteness with Spain itself, its story is reduced.
</p><p>
</p><p>
Rio Tinto was mined by Neolithic man starting at least 3,000 BC.  A stone hoe was found at excavations at the site.</p>",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Rio Tinto Smelting recorded in Ice Cores ",
:end_year => "-2275",
:body => "<p>Mining stopped with  the exhaustion of the forests.</p>",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2475"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "End of Rio Tinto Smelting - Deforestation ",
:end_year => "",
:body => "<p>The end of the smelting at 
</p><p>
Rio Tinto was due to the deforestation of the surrounding areas.</p>",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2275"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "The Sherden Sea People ",
:end_year => "-1300",
:body => "",
:tag_list => ["SeaPeople"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1399"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Trojan War ",
:end_year => "",
:body => "<p>That the Trojan war is placed in the bronze Age Collapse, the question of motives is that the Trojans and their allies may have been the
</p><p>
Sea Peoples and were finally cornered as told by the Iliad.
</p><p>
Apollo his association with mice and their caring of
</p><p>
plague was noted in the Iliad.  That such an association should be stated so clearly indicated along standing understanding of causes of disease.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1150"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Phoenicians arrive at Rio Tinto ",
:end_year => "",
:body => "<p>Phoenicians begin trading with the Tartessians at
</p><p>
Rio Tinto.</p>",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Leather Bellows ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Rio Tinto as King Solomon\'s mines ",
:end_year => "-931",
:body => "",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-971"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Solon ",
:end_year => "-558",
:body => "",
:tag_list => ["Atlantis"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-638"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Carthaginians Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Plague of Athens ",
:end_year => "",
:body => "<p>
Typhus appears amoung the Athenians.</p>",
:tag_list => ["Epidemic", "Typhus"],
:event_type => @cultural,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-430"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Gilgamesh: The Babylonian Flood ",
:end_year => "-2345",
:body => "<p>The </p><p> story records a great flood in the general region of the middle east.  It states that certain area were flooded.  During the Biblical Event flood, cities were lost from history.</p>",
:tag_list => ["Gilgamesh", "Earth", "Flood"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Abraham - The first Monotheist ",
:end_year => "-1991",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2166"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "The Lycian Sea People ",
:end_year => "-1700",
:body => "",
:tag_list => ["SeaPeople"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Skara Brae inundated",
:end_year => "",
:body => "<p>
Skara Brae is on the west coast of Mainland in the Orkney Isles off Scotland.  It is considered on with the best preserved Bronze Age villages due to being burred by a sand storm.  It is possible that it was buried by a tsumani as well.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Romans Arrive at Rio Tinto ",
:end_year => "",
:body => "",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-206"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Antonine Plague ",
:end_year => "180",
:body => "<p>First appearance of Smallpox.
</p><p>
</p><p>
The plague decimated the army with a 13 to 15 percent loss with the cities suffering similarly while the rural population suffered 7 to 10 percent in loss of life.  When the Roman army contracted due to the plague, the Mauri invaded conquering the
</p><p>
Rio Tinto area leading to the loss of the silver supplying the army.
</p><p>
Striping the value from the coin lead to economic unrest resulting in the Crisis of the Third Century.</p>",
:tag_list => ["Epidemic", "Smallpox"],
:event_type => @cultural,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "165"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Mauri Conquer Rio Tinto and area ",
:end_year => "200",
:body => "<p>The loss of the
</p><p>
Rio Tinto mines silver output to the Roman empire brought about the crisis of the Third century.
</p><p>
The Mauri conquered the area when the Roman army contracted due to the plague of Antonine.  The plague decimated the army with a 13 to 15 percent loss with the cities suffering similarly while the rural population suffered 7 to 10 percent in loss of life.</p>",
:tag_list => ["RioTinto"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "180"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Plague of Cyprian ",
:end_year => "270",
:body => "<p>Second appearance of Smallpox.
 This plague is credited with having a substantial amount of influence of public view of Christianity as only the Christians were attending the plague victims.</p>",
:tag_list => ["Epidemic", "Smallpox"],
:event_type => @cultural,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "251"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "End of Migration Period ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "700"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "The Great Famine ",
:end_year => "1317",
:body => "",
:tag_list => ["Historical", "Famine"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1315"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Black Death.  Third Occurrence of ",
:end_year => "1351",
:body => "",
:tag_list => ["Historical", "Epidemic", "BubonicPlague"],
:event_type => @cultural,
:citations => [ @cantor2001,@ziegler1969],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1347"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@cultural_timeline.holocene_events << result
@chapter.holocene_events << result
@chapter = Chapter.create({:name => "Comets, plague and survivors - Plague and the issue of war ",
:body => "<p>Research on DNA traces of epidemics identified a epidemic that struck Europe about 1,500BC(14).
Curiously, it did not affect the population of the Middle East.
If a disease followed the same pattern of out of Africa via the Red Sea, then the Minoans would have taken it back to Crete and from there to its colonies in Greece and Anatolia.
With a naive population, the reduction of the Minoan population by 90% would reduce any culture to rubble.
</p><p>That plague is non-discriminitory towards status, the loss of leaders in any given group would lead to contests to
determine leadership.  It is possible that much of the violence that Graham Phillips (below) attributes to a comet is 
possibly related to the unrestrained mass of people faced with collapsed leadership and organized food production.
</p>"
})
result = HoloceneEvent.create({:name => "Bubonic Plague first appearance ",
:end_year => "",
:body => "<p>Gentic research into heart disease arrived at the conclustion that Bubonic plage appeared in Europe around 1,500 BC.  This epidemic possibly reduced the population by 90%.
</p>",
:tag_list => ["BiblicalEvent", "Epidemic", "BubonicPlague"],
:event_type => @epidemic,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tsunami at Tartessos area(15) ",
:end_year => "",
:body => "",
:tag_list => ["Tsunami"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Plague strikes Egypt(16) ",
:end_year => "",
:body => "<p>Plague strikes Egypt.</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "-1400",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Comet ",
:end_year => "",
:body => "<p>Graham Phillips presents compelling evidence that civilization in the northern hemisphere became warlike and monotheistic after Earth passed through the tail of a comet.
</p><p>
There is a text in Egypt which describes the comet and its breaking up.
</p><p>
The comet ice may have contained large amounts of amino acids which promoted aggression.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1486"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Suppiluliuma I died in the plague which spread across the region ",
:end_year => "",
:body => "<p>
It is thought that this plague came from captives from wars particularly Egypt.
</p>",
:tag_list => ["Epidemic", "BubonicPlague"],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1322"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bronze Age Collapse ",
:end_year => "-1150",
:body => "<p>A great question in history has always been the collapse of the Prototypical Manoral societies in the Macadonian and Greek areas.  With an event which produced an 18 year substandard harvest resulting in a transgenerational famine
</p><p>
 with peoples facing genocide due to the weather.   Peoples searching for substance flooded south into any area that had any food without care as to those there already.  The most famous is the
</p><p>
Sea People(19).
</p><p>
The appearance of the
</p><p>
Sea People it is believed were peoples from the various islands of the Mediterranean.(19)  It is speculated that the Trojans and their allies were a major part of the
</p><p>
Sea People.</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1206"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@first_plague_timeline.holocene_events << result
@chapter.holocene_events << result
@chapter = Chapter.create({:name => "Crisis of the Third Century ",
:body => "<p>
Perhaps one the most enduring mysteries of the Roman empire, the crisis of the Third Century has been difficult to explain in terms of the standard dynamics of culture.  
Here was a empire, prosperous and stable which suddenly experienced a monumental schism between the army and the government.  
What lead to such a crisis?
</p><p>
A non-cultural explanation is that the explosion of the Taupo volcano around 180 AD in the southern hemisphere lead to a hemispheric winter in Africa which caused the various peoples to migrate northward seeks subsistence.  
This migration eventually lead the Mauri people to invade southern Spain conquering the Rio Tinto area and its mine.
</p><p>
Rio Tinto was the pay master of the Roman empire.  
While the output in gold was not significant, the silver was the stable pay of the Army.  
With its loss, the pay was made up from other areas of the empire eventually leading to the devaluation of the Demare and the eventually collapse of the tax system resulting in the Army's revolt in 235 AD.
</p><p>
The 'Crisis of the Third Century' resulted in the lost of safe passage along the Roman highway, the most amazing feat of the Roman world.  
The roads systems allowed the common Roman the ability to travel over a large range of the empire without fear of out and out banditry.  
After the third century, safety was in numbers and via the sea until the advent of the Vandals and their pirating out of Carthage starting in the mid 5Th century.
</p><p>
Beginnings of Serfdom with the giving up of rights by people fleeing the cities.  
These people were called </p><p> being tied to the land via Imperial Reforms with the resulting descendant suffrage.
</p>"
})
result = HoloceneEvent.create({:name => "Beginnings of Serfdom and Manorialism ",
:end_year => "",
:body => "<p>
The destruction of the safe transport system lead to a drop in products getting to cities.  
Such a drop drove the poor into the country side seeking food and protection.  They formed the first coloni - people bound to the land by law.
</p><p>
The disappearance of consistent trade goods lead many land owners to create manors where all goods needed by the manor were produced.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "284"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Start of Migration Period ",
:end_year => "",
:body => "<p>
Several smaller volcanic eruptions about this time may have lead to the Age of Migration.  Volcanic eruptions can have an accumulative effect on the climate resulting in a global winter without a single cause.  A 'Winter' would be the straw that broke as at the end of such a 'Winter', a patent starts to see that their eldest child is failing due to lack of nourishment.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "300"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Constantine I - Law reaffirming Coloni(serfdom) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "325"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Huns force Goths into Roman Empire ",
:end_year => "",
:body => "<p>The arriving Huns force the Goths to flee into Roman territories.  Beginning of the Migration-Invasion question as groups try to get out of the way of the Huns.</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "376"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@crisis_3rd_century_timeline.holocene_events << result
@chapter.holocene_events << result
@chapter = Chapter.create({:name => "Genesis ",
:body => "<p>My maternal grandmother corralled my one day just before I went off to college.  She exponded to me the history of the Bible and that someday I 
or someone else would demonstrate it's validity.
</p><p>In the years since, I have watched the fate of archeology as one school and then another demonstrated why or why not biblical events could occur.
</p>"
})
result = HoloceneEvent.create({:name => "Day 1 Let there be Light ",
:end_year => "-9600",
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
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Day 2 - Dividing the Waters ",
:end_year => "-9100",
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
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-9600"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Day 3: Dry Land ",
:end_year => "-8300",
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
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Day 4 - Sun, Moon and Stars 'Lights in the Firmament' ",
:end_year => "",
:body => "<p>
A 'Day' which seems to reflect the growing wonder at God's creation.
A cold period with low atmospheric particulates or moisture.
Cold nights offer clearer sighs of the stars, planets and possible Aurora Brollies displays.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Day 5 - Water and Air creatures ",
:end_year => "",
:body => "<p>
After such flooding caused by the ice melt, the rivers and streams would have been washed clean.
The time needed for fish to establish themselves in the rivers and streams would have varied by species.
I think that as fish populations increase, so would Avian species preying on them.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-6100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Day 6 - Land creatures and Man ",
:end_year => "-5700",
:body => "<p>
I would contend that Days 5 and 6 are a bit 'shorter' that the previous one.
These reason for the is that as the Lord 'rested' and man played in the Garden of Eden, the ocean level rose.
Eventually, they cased the inflow of sea water into the Black Sea.
</p><p>
The domestication of animals has allowed man to expand in a manner never before seen in human history. While some animals have been with mankind for millennium, others are more recent and some will never be tamed.
As man's awareness has grown over time, the dependency on livestock for food and labor has grown as well.
</p><p>
Cows seem to have been associated with mankind from at least 7,000 BC(5).
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Day 7 - The Lord Rested ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5700"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "God Comes to visit ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5677"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Cast out of Eden - Flooding of the Black Sea ",
:end_year => "",
:body => "<p>
At that time the Black sea area was truly Eden.
Large fresh water lake with gentle rolling hills.
Four rivers flowing to the area proving a guide out of the area.
Having had several thousand years to adapt to the valley, it's loss would be a religious experience.
</p><p>
The Black Sea basin before the flooding by the sea was a paradice compaired to other areas during the Holocene. Fresh water with four river running into it profiding trails leading out. The plain would have been firtile with grass as well as marshes with birds, fish and other animals. 
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Noah's Flood ",
:end_year => "",
:body => "<p>
When research conducted by William Ryan, Walter Pitman was first published in 1998, the Christian community was not very receiving.
First, the Biblical flood covered the whole world, while the flooding of the Black Sea basin was not global in nature.
</p><p>
Research done by Abbott, et la(2) concerning specific types of chevron dunes along the coasts of various places lead to the discovery of the Buckle Crater.
This event would have been global with solid rain for several months.
</p><p>
This event is called the Piora Oscillation and lasted from 3250BC to 2900BC.
A Greenland GISP2 ice core sample shows a sulfate spike and methane trough about 3250 BC.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Deucalion Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Destrection of Sodom and Gomorrah ",
:end_year => "",
:body => "<p>Thera had two minor eruptions before exploding.  The first eruption cast a plume trace to the northeast of the 
Mediteranian.  Traces of the plume have been found in Turkey and parts of Lebinon.  The second eruption was towards the
south east over the land of Isreal.  Abraham  in the plains of Mamre would have seen the first eruption as something 
devine and safe as no fallout from the plume reached his location.  The interviening months between the first and second
eruptions would have allowed time for new of the destruction caused by the fallout of the first explosion to filter to 
Abraham.
</p><p>When the second explosion occured and the plume came overhead, Abraham sought to warm his family and friends
that the fallout from the plume could destroy them.  Who or what the angles sent to Lot in Sodom is unknowable.
There effect on the crowd at Sodom seems real enough.  If something or someone is brought to the city with knowledge
of what is happening with the eruption plume overhead would be very sought after.  
</p><p>
Steven Collins' work at Tall el-Hammam in Jordon has shown that the city he found matches the description of Sodom
as defined in the Bible.  During the work of excuvation, large quantities of glass where found that resemble Trinitite
indicating a very hot explotion.  That the glass was located in a area covering Tall el-Hammam suggests to me a 
volcanic cinder bomb not cooling correctly as it comes down resulting in a superheated explosion on a limited scale.
</p>",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Exodus - First ",
:end_year => "-1350",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1446"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Exodus - Second ",
:end_year => "-1200",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1300"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Moses ",
:end_year => "-1271",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1391"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ogygian Deluge ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
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
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@genesis_timeline.holocene_events << result
@chapter.holocene_events << result
@chapter = Chapter.create({:name => "Time line ",
:body => "<p>Earth related events such as volcanic eruptions, earthquakes, tsunamis, impact events, etc.
</p>"
})
result = HoloceneEvent.create({:name => "Nevali Cori ",
:end_year => "-8100",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8400"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 9 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "The Clovis Comet ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-10900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Campo del Cielo Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Carancas Impact Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "2007"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Grendel Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "536"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Haviland Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Henbury Meteorites Conservation Reserver ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent", "HenburyMeteoritesConservationReserver"],
:event_type => @impact,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ilumetsa Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-4600"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kenmore Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Morasko Meterorite Nature Reseve ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Rio Caurto Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Sirente Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "312"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Sobolev Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tai Hu Lake ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @centralasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tabban Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "535"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Wabar Craters ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @middleeast,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1863"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kamil Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Whitecourt Crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1105"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Dalgaranga crater ",
:end_year => "",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Younger Dryas ",
:end_year => "-9600",
:body => "<p>This event was a 1,300 year cold event as waters from the ice plateau covering North America flowed into the Atlantic basin shutting down the Gulf stream.
</p>",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "70",
:start_year => "-10900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Older Peron ",
:end_year => "-4100",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Younger Peron Transgression ",
:end_year => "-3400",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-4000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 8 - End of Younger Dryas ",
:end_year => "",
:body => "<p>The Gulf Stream resumes.</p>",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-9100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Lvinaya Past, Kamchatka Peninsula (Russa) VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @eastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/lvinaya_past_20070718011232.jpg/280px-lvinaya_past_20070718011232.jpg",
:url => "https://en.wikipedia.org/wiki/lvinaya_past",
:start_year_uncert => "50",
:start_year => "-7480"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 6 - Erdalen Glacial activity ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-7400"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Sakura-Jima, Kyushu (Japan) VEI 6+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/sakurajima55.jpg/280px-sakurajima55.jpg",
:url => "https://en.wikipedia.org/wiki/sakurajima",
:start_year_uncert => "1000",
:start_year => "-6200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Land Bridge from Siberia to North America sinks ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-12000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>I have included this event as it is with in recorded history.  The global temperatures did dip though not as expected.  The discrepancy is due to the general overall warming due to human activity.</p><p>VEI 6</p><p>
Confirmed Eruption</p><p>
Historical Observations
Lower north flank and summit</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/pinatubo91eruption_clark_air_base.jpg/280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:start_year_uncert => "",
:start_year => "1991"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Novarupta ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Historical Observations
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @northamerica,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/novarupta.jpg/280px-novarupta.jpg",
:url => "https://en.wikipedia.org/wiki/novarupta",
:start_year_uncert => "",
:start_year => "1912"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Santa Maria ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Historical Observations
SW flank</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @centralamerica,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/santiaguito_from_santamaria.jpg/280px-santiaguito_from_santamaria.jpg",
:url => "https://en.wikipedia.org/wiki/santa_mar%c3%ada_(volcano)",
:start_year_uncert => "",
:start_year => "1902"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Krakatoa, Indonesia VEI 6",
:end_year => "",
:body => "<p>While not as big as Tambora, Krakatoa was better observed by a good many people.  The documentation is very informative as to the magnitude of such explosions.  It was heard around the world.</p><p>VEI 6</p><p>
Confirmed Eruption</p><p>
Historical Observations
Krakatau Island (Perbuwatan, Danan)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/krakatoa_eruption_lithograph.jpg/280px-krakatoa_eruption_lithograph.jpg",
:url => "https://en.wikipedia.org/wiki/krakatoa",
:start_year_uncert => "",
:start_year => "1883"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tambora, Indonesia VEI 7",
:end_year => "1815",
:body => "<p>VEI 7
Confirmed Eruption</p><p>
Historical Observations
</p><p>This was the first 
</p><p>
eruption within 'written' history that had the benefit of an extensive amount of information gathered by a wide range of individuals.  The Stommel's in their book </p><p> provide a very detailed account of the sequence of events in North America in 1816.  
</p><p>
One of the interesting things about the Stommel's research is the Cholera epidemics
</p><p>
</p><p>
 of mid-19Th century Europe may have resulted due to the spread of the disease by refugees from the India famine
</p><p>
 of 1816</p>",
:tag_list => ["Eruption", "VEI7"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/mount_tambora_volcano%2c_sumbawa_island%2c_indonesia.jpg/280px-mount_tambora_volcano%2c_sumbawa_island%2c_indonesia.jpg",
:url => "https://en.wikipedia.org/wiki/mount_tambora",
:start_year_uncert => "",
:start_year => "1812"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Unknown Source ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Historical Observations
Tropical latitude (SP, 365 ppb sulfate)</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @unknown,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1808"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/long_island_nasa.jpg/280px-long_island_nasa.jpg",
:url => "https://en.wikipedia.org/wiki/long_island_(papua_new_guinea)",
:start_year_uncert => "20",
:start_year => "1660"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Huaynaputina, Peru VEI 6",
:end_year => "1603",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Historical Observations
Summit and south flank</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southamerica,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/huaynaputina.jpg/220px-huaynaputina.jpg",
:url => "https://en.wikipedia.org/wiki/huaynaputina",
:start_year_uncert => "",
:start_year => "1601"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/mtbalbitorenasa.jpg/280px-mtbalbitorenasa.jpg",
:url => "https://en.wikipedia.org/wiki/billy_mitchell_(volcano)",
:start_year_uncert => "20",
:start_year => "1580"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bardarbunga, Northeastern Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Historical Observations
Veidivötn (Veidivatnahraun)</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @icelandandarcticocean,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1477"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Quilotoa, Ecuador VEI 6",
:end_year => "",
:body => "<p>One of the largest 
</p><p>
eruption of the Holocene period.</p><p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1280"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Rinjani ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption</p><p>
Ice Core
Samalas</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @southeastasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1257"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Changbaishan ",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "4",
:start_year => "942"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ceboruco,Mexico VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @centralamerica,
:image => "",
:url => "",
:start_year_uncert => "200",
:start_year => "930"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Tephrochronology
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @northamerica,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/relief_map_of_usa_alaska.png/248px-relief_map_of_usa_alaska.png",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:start_year_uncert => "1",
:start_year => "847"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "75",
:start_year => "710"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Rabaul ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "https://upload.wikimedia.org/wikipedia/en/thumb/8/8e/rabaul.png/280px-rabaul.png",
:url => "https://en.wikipedia.org/wiki/rabaul_caldera",
:start_year_uncert => "2",
:start_year => "683"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Dakataua ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "https://en.wikipedia.org/wiki/file:papua_new_guinea_location_map_topographic.png",
:url => "https://en.wikipedia.org/wiki/dakataua",
:start_year_uncert => "18",
:start_year => "653"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ilopango, El Salvador VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
Ilopango</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @centralamerica,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/ilopango_caldera.jpg/280px-ilopango_caldera.jpg",
:url => "https://en.wikipedia.org/wiki/lake_ilopango",
:start_year_uncert => "30",
:start_year => "450"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ksudach ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
Ksudach V caldera</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "100",
:start_year => "240"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Taupo ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
Horomatangi Reefs area</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "https://en.wikipedia.org/wiki/file:taupo.volcanic.zone.north.island.nz.jpg",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:start_year_uncert => "13",
:start_year => "233"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Churchill ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @northamerica,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/relief_map_of_usa_alaska.png/248px-relief_map_of_usa_alaska.png",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:start_year_uncert => "200",
:start_year => "60"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ambrym, Vanuatu VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "100",
:start_year => "50"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Apoyeque, Nicaragua VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Tephrochronology
Apoyeque</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @centralamerica,
:image => "",
:url => "",
:start_year_uncert => "100",
:start_year => "-50"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Okmok, Aleutian Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
Okmok II caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "50",
:start_year => "-100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/pinatubo91eruption_clark_air_base.jpg/280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:start_year_uncert => "500",
:start_year => "-1050"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "160",
:start_year => "-1370"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Aniakchak ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Ice Core
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "10",
:start_year => "-1645"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Veniaminof, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1750"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "St. Helens, Washington, USA VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1860"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1890"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Black Peak, Alaska VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "150",
:start_year => "-1900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Long Island, Northeast of New Guinea VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/long_island_nasa.jpg/280px-long_island_nasa.jpg",
:url => "https://en.wikipedia.org/wiki/long_island_(papua_new_guinea)",
:start_year_uncert => "100",
:start_year => "-2040"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Blanco, Cerro ",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "160",
:start_year => "-2300"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/pinatubo91eruption_clark_air_base.jpg/280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:start_year_uncert => "",
:start_year => "-3550"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Taal, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "",
:url => "",
:start_year_uncert => "200",
:start_year => "-3580"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Witori ",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "210",
:start_year => "-4000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Masaya, Nicaragua ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Tephrochronology
NW of caldera</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @centralamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-4050"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kikai Caldera, Ryukyu Islands (Japan) VEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
Kikai caldera</p>",
:tag_list => ["Eruption", "VEI7"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-4350"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Maculey Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "200",
:start_year => "-4360"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Hudson, Cerro Southern Chile VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-4750"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Aniakchak, Alaska Peninsula VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Tephrochronology
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "1000",
:start_year => "-5250"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tao-Rusyr Caldera, Kuril Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
Tao-Rusyr</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "75",
:start_year => "-5550"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Mashu, Hokkaido (Japan) VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "100",
:start_year => "-5550"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Crater Lakes CalderaVEI 7",
:end_year => "",
:body => "<p>This event is noted in native American legions about a battle of the Gods where one threw down the other(6).</p><p>VEI 7
Confirmed Eruption</p><p>
Ice Core
Mt. Mazama summit and flank vents</p>",
:tag_list => ["Eruption", "VEI7"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "150",
:start_year => "-5677"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Khangar ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "16",
:start_year => "-5700"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Crater Lake ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
North flank (Llao Rock)</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "50",
:start_year => "-5900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Menenga, Eastern Africa VEI 6+",
:end_year => "",
:body => "<p>VEI 6+
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @africa,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-6050"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kurile Lake CalderaVEI 7",
:end_year => "",
:body => "<p>VEI 7
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI7"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "25",
:start_year => "-6440"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Karymsky ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
Karymsky caldera</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-6600"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Fisher, Aleutian Islands  VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
NE and SW parts of Fisher caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @northamerica,
:image => "",
:url => "",
:start_year_uncert => "200",
:start_year => "-7420"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pinatubo, Philippines VEI 6",
:end_year => "",
:body => "<p>VEI 6?
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
Tayawan caldera</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @southeastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/pinatubo91eruption_clark_air_base.jpg/280px-pinatubo91eruption_clark_air_base.jpg",
:url => "https://en.wikipedia.org/wiki/mount_pinatubo",
:start_year_uncert => "150",
:start_year => "-7460"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Aira ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
Wakamiko Caldera</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @eastasia,
:image => "",
:url => "",
:start_year_uncert => "1000",
:start_year => "-8050"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Grimsvotn, Iceland VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @icelandandarcticocean,
:image => "",
:url => "",
:start_year_uncert => "50",
:start_year => "-8230"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Minchinmavida ",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => [],
:event_type => @volcanic,
:citations => [],
:region => @southamerica,
:image => "",
:url => "",
:start_year_uncert => "150",
:start_year => "-8400"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Ulreung, Korea VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @eastasia,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/ulleung_island_from_above.jpg/260px-ulleung_island_from_above.jpg",
:url => "https://en.wikipedia.org/wiki/ulleungdo",
:start_year_uncert => "",
:start_year => "-8750"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "English Channel formed ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Climatic or Thermal Maximum ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 5 - 8.2K Event ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-6100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/cotopaxi_volcano_2008-06-27t1322.jpg/280px-cotopaxi_volcano_2008-06-27t1322.jpg",
:url => "https://en.wikipedia.org/wiki/cotopaxi",
:start_year_uncert => "75",
:start_year => "-5820"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Flooding of the Black Sea ",
:end_year => "",
:body => "",
:tag_list => ["Earth", "Flood"],
:event_type => @earth,
:citations => [],
:region => @neareast,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5600"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-5060"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-4375"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://en.wikipedia.org/wiki/file:papua_new_guinea_location_map_topographic.png",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:start_year_uncert => "200",
:start_year => "-4000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 4 - 5.9K Event - intense aridification ",
:end_year => "",
:body => "<p>5.9K Event was one of the most intense aridification events during the Holocene.</p>",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Cotopaxi, Ecuador VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/cotopaxi_volcano_2008-06-27t1322.jpg/280px-cotopaxi_volcano_2008-06-27t1322.jpg",
:url => "https://en.wikipedia.org/wiki/cotopaxi",
:start_year_uncert => "75",
:start_year => "-3880"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Piora Oscillation ",
:end_year => "-2900",
:body => "<p>An abrupt cold and wet period in climate history of the Holocene.  Global in nature.</p>",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Burkle Crater: Noah's Flood ",
:end_year => "",
:body => "",
:tag_list => ["BiblicalEvent", "ImpactEvent", "Earth", "Flood"],
:event_type => @impact,
:citations => [],
:region => @indianocean,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3250"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Low growth Irish Oak  ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-3195"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "End of Piora Oscillation ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 3 ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Umm al Bini -  The confusion of Civilizations ",
:end_year => "",
:body => "<p>The discovery of Umm al Bini was a fluke of war.  Sadam Hussine had drained the great lake that sat atop the crater exposing it to satellite photography.
</p><p>
I call this the Confusion of Civilization as there are two floods in this region.   
</p><p>
Noah's flood a thousand year before and now the Babylonian flood.   This flood was not as world wide as Noah's and left a distinct mark in history.  In the digs in Iraq, there is a layer of mud over remains.  The area of Umm al Bini would have been ocean estuary in 2,300BC's  so the impact was more a mud spatter than a real water impact.
</p><p>
Tree ring dating places this event at 2,354 BC with a 9 year window of cold weather</p><p>.
</p><p>
The Egyptian Drought</p>",
:tag_list => ["ImpactEvent", "Earth", "Flood"],
:event_type => @impact,
:citations => [],
:region => @neareast,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "-2345",
:body => "<p>Lasted 9 years.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2354"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "4.2 Kiloyear Event",
:end_year => "-2100",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-2200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Santorini/Thera VEI 7",
:end_year => "",
:body => "<p>VEI 7?
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
</p><p>The Thera explosion is an interesting event to consider.  First, the Minoan people appear to have packed and left before the creation of the caldera.  Second, the unique color of the ejaculate seems to be the link to the 10 Plagues of Egypt as noted in the Bible.   And third, the dating of this event shifts the birth and time of Moses as well as other dates in the Bible.
</p><p>
It is one of two calderas that have been remembered in folk lore.  The other caldera is the Crater Lakes caldera in Oregon, USA.  Native American Legions speak of a battle of the Gods with one throwing down the other.
</p>",
:tag_list => ["Eruption", "VEI7", "Tsunami", "Atlantis", "Earthquake"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "14",
:start_year => "-1628"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "-1622",
:body => "<p>Lasted 6 years</p><p>.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1628"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kaali Meteor Impact ",
:end_year => "-1400",
:body => "",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1500"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Macha Crater ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @impact,
:citations => [],
:region => @eurasia,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-6000"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Taupo, New Zealand VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (corrected)</p><p>
Horomatangi Reefs?</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "https://en.wikipedia.org/wiki/file:taupo.volcanic.zone.north.island.nz.jpg",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:start_year_uncert => "40",
:start_year => "-1460"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://en.wikipedia.org/wiki/file:papua_new_guinea_location_map_topographic.png",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:start_year_uncert => "100",
:start_year => "-1370"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Mycenea  ",
:end_year => "",
:body => "<p>
This earthquake was perhaps the earthquake described to Solon in Plato's Atlanis story.
</p>",
:tag_list => ["Earthquake"],
:event_type => @earth,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1240"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Mycenea  ",
:end_year => "-1190",
:body => "",
:tag_list => ["Earthquake"],
:event_type => @earth,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Helka 3, Iceland VEI 6",
:end_year => "",
:body => "<p>LHE date 1100 BC ±50 years
</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/2006-05-21-153901_iceland_st%c3%b3rin%c3%bapur.jpg/280px-2006-05-21-153901_iceland_st%c3%b3rin%c3%bapur.jpg",
:url => "https://en.wikipedia.org/wiki/hekla",
:start_year_uncert => "50",
:start_year => "-1159"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Downturn of environment: Tree Ring Event ",
:end_year => "-1141",
:body => "<p>Climate change recorded in tree rings.
</p><p>
Lasted 18 years</p><p>.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1159"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism ",
:end_year => "-300",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-900"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Iron Age Climate Pessimism - Coldest Point ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-450"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 2 - Iron Age Cold Epoch ",
:end_year => "",
:body => "",
:tag_list => ["BondEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-800"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Poseidon's Horses: Earthquake Swarm ",
:end_year => "-1175",
:body => "",
:tag_list => ["Earthquake"],
:event_type => @earth,
:citations => [],
:region => @neareast,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-1225"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Storegga Slide ",
:end_year => "",
:body => "<p>A megatsunami Norwegian Sea caused by the collapse of a Feord face.
</p>",
:tag_list => [],
:event_type => @earth,
:citations => [],
:region => @europe,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-8100"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Coldest point of Iron Age  Pessimism ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-450"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Destruction of Tartessos ",
:end_year => "",
:body => "<p>Located on south-western coast of Spain, just outside of the gates of Gibraltar(24).</p>",
:tag_list => [],
:event_type => @earth,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-440"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Helike, Greece disappears into the sea(25) ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @earth,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-373"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Raoul Island, Kermadec Islands VEI 6",
:end_year => "",
:body => "<p>VEI 6</p><p>
Confirmed Eruption</p><p>
Radiocarbon (uncorrected)</p><p>
Denham caldera</p><p>LHE lists the date as 250 BC.</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "75",
:start_year => "-208"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "-204",
:body => "<p>Winter which lasted 4 years,</p><p>.</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-208"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Roman Age Optimum ",
:end_year => "300",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "-200"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Masaya, Nicaragua VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "150"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
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
:event_type => @volcanic,
:citations => [],
:region => @australasia,
:image => "https://en.wikipedia.org/wiki/file:taupo.volcanic.zone.north.island.nz.jpg",
:url => "https://en.wikipedia.org/wiki/taupo_volcano",
:start_year_uncert => "",
:start_year => "180"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Rabul, New Britain VEI 6",
:end_year => "",
:body => "<p>This event is noted in the ice cores as a sulfur event at 516 AD ± 4 years.  Perhaps this is the explanation for the Saxon invasion of the Celtic side of Britain resulting the Braton Hill battle.  The LHE list says 540 AD ±100 years.</p>",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "4",
:start_year => "512"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Bond 1 Tree Ring Event ",
:end_year => "545",
:body => "<p>
</p><p>
Impact event by two bodies resulting in impact craters called  Tabban and Kenmore in the Gulf of Carpeneria, Australia.  The cold period lasted 9 years in the tree ring records</p><p>.   This impact left an impact in both the recorded history around the world and the climate proxies allowing for a reconstruction of what a global winter is like.
</p><p>
The cloud cover started on March 24, 535 and ended on June 24, 536.   It's ocular density was 2 and a half times the explosion of Tambora (1815).  
</p><p>
'There was a sign from the sun, the like of which had not been reported before. The sun became dark and its darkness lasted for 18 months.  Each day, it shone for about four hours, and still this light was only a feeble shadow.  Everyone declared that sun would never recover its full light again.'(30)</p>",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "536"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tree Ring Event ",
:end_year => "",
:body => "",
:tag_list => ["TreeRingEvent", "Dendrochronology"],
:event_type => @climatic,
:citations => [ @baillie1999],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "540"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Olympia destroyed by tsunami ",
:end_year => "",
:body => "<p>Earthquake at Olympia destroys the site at Peloponnese.</p>",
:tag_list => ["Tsunami", "Earthquake"],
:event_type => @earth,
:citations => [ @olympiaearthquake],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "551"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Pago, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://en.wikipedia.org/wiki/file:papua_new_guinea_location_map_topographic.png",
:url => "https://en.wikipedia.org/wiki/pago_(volcano)",
:start_year_uncert => "75",
:start_year => "710"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Churchill, Eastern Alaska VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/relief_map_of_usa_alaska.png/248px-relief_map_of_usa_alaska.png",
:url => "https://en.wikipedia.org/wiki/mount_churchill",
:start_year_uncert => "100",
:start_year => "800"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Dakataua, New Britain VEI 6",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI6"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://en.wikipedia.org/wiki/file:papua_new_guinea_location_map_topographic.png",
:url => "https://en.wikipedia.org/wiki/dakataua",
:start_year_uncert => "50",
:start_year => "800"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Billy Mitchell, Bougainville Island VEI 5+",
:end_year => "",
:body => "",
:tag_list => ["Eruption", "VEI5"],
:event_type => @volcanic,
:citations => [ @holoceneeruptions],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/mtbalbitorenasa.jpg/280px-mtbalbitorenasa.jpg",
:url => "https://en.wikipedia.org/wiki/billy_mitchell_(volcano)",
:start_year_uncert => "25",
:start_year => "1030"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "'Lighting and Meteors destroyed the corn' in Ireland ",
:end_year => "",
:body => "<p>
'Lighting and Meteors destroyed the corn' in Ireland 1294, 'ten fireballs the size of houses' fell in China 1295, extraterrestrial inpact in Russia 1296 and fire-induced growth in giant sequoia dendrochronology
</p><p>
, 1297</p><p>
</p><p>
.
</p>",
:tag_list => [],
:event_type => @impact,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1297"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Mahuika Crater ",
:end_year => "",
:body => "<p>The dating of this 1440 AD impact is in dispute due to several factors.</p>",
:tag_list => ["ImpactEvent"],
:event_type => @impact,
:citations => [],
:region => @australasia,
:image => "",
:url => "",
:start_year_uncert => "15",
:start_year => "1440"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Kuwae, Vanuatu ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @cultural,
:citations => [],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/shepherdislandsmap.png/280px-shepherdislandsmap.png",
:url => "https://en.wikipedia.org/wiki/kuwae",
:start_year_uncert => "",
:start_year => "1453"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Beginning of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1550"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "First Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1650"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Second Cold Point of Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1770"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Laki Eruption, Grimsvotn Volanco, Iceland VEI 4+ ",
:end_year => "",
:body => "<p>The famous volcanic event which started the great Benjamin Franklin asking the question of weither the Liki eruption had an effect on the weather in Europe and North America in the years following the eruption(39).</p>",
:tag_list => ["Eruption", "VEI4"],
:event_type => @volcanic,
:citations => [],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/iceland_grimsvoetn_1972-b.jpg/280px-iceland_grimsvoetn_1972-b.jpg",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:start_year_uncert => "",
:start_year => "1783"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Third Cold Point of the Little Ice Age ",
:end_year => "",
:body => "",
:tag_list => [],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1850"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "The Carrington Event: Solar Storm of 1859 ",
:end_year => "",
:body => "<p>This was the largest Geomagnetic storm on the sun.  It took 17 hours to travel to earth on a journey which normally take 3 days.
</p>",
:tag_list => ["MagneticEvent", "Historical", "CarringtonEvent"],
:event_type => @climatic,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1859"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Tunguska Event ",
:end_year => "",
:body => "<p>The first major Impact Event in recorded history.  It took almost 15 years to find the explosion point due to its remoteness in Siberia.  Recent models show an explosion of an asteroid above the earth with a small Impact Event.  The wide spread destruction was due to the mid-air explosion. 
</p><p>
People in London were able to read the new paper at night for 8 days after the event.  It was heard around the world.</p>",
:tag_list => ["ImpactEvent", "Historical", "Tunguska"],
:event_type => @earth,
:citations => [],
:region => @global,
:image => "",
:url => "",
:start_year_uncert => "",
:start_year => "1908"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = HoloceneEvent.create({:name => "Grimsvotn Volanco, Iceland VEI 4 ",
:end_year => "",
:body => "<p>This eruption caused desruptions to air travel in Europe.  President Obama had to cut short his visit to Ireland due to worries about the ash cloud.
</p>",
:tag_list => ["Eruption", "VEI4"],
:event_type => @volcanic,
:citations => [],
:region => @global,
:image => "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/iceland_grimsvoetn_1972-b.jpg/280px-iceland_grimsvoetn_1972-b.jpg",
:url => "https://en.wikipedia.org/wiki/gr%c3%admsv%c3%b6tn",
:start_year_uncert => "",
:start_year => "2010"
})
debugger if result.errors.count > 0
@timeline.holocene_events << result
@timeline_timeline.holocene_events << result
@chapter.holocene_events << result
result = Biblioentry.create({:name => "Exodus to Arthur: Catastrophic encounters with comets",
  :xreflabel => "baillie1999",
  :copyright_year => "1999, 2000, 2001",
  :copyright_holder => "Mike Baillie",
  :publisher => "B. T. Batsford Ltd"
})
debugger if result.errors.count > 0
[{:firstname=>"Mike", :surname=>"Baillie"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Susan Wise", :surname=>"Bauer"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Norman F.", :surname=>"Cantor"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Brian", :surname=>"Fagan"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Gram", :surname=>"Handcock"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"John", :surname=>"Kelly"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"David", :surname=>"Keyes"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Gina", :surname=>"Kolata"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"William H.", :surname=>"McNeill"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Steven", :surname=>"Mithen"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Amos", :surname=>"Nur"}, {:firstname=>"Dawn", :surname=>"Burgess"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Graham", :surname=>"Phillips"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"William", :surname=>"Ryan"}, {:firstname=>"Walter", :surname=>"Pitman"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"William", :surname=>"Rosen"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"John", :surname=>"Savino"}, {:firstname=>"Marie D.", :surname=>"Jones"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
result = Biblioentry.create({:name => "Famine and pestilence in the late Roman and early Byzantine empire: a ...",
  :xreflabel => "stathakopoulos",
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Dionysios Ch", :surname=>"Stathakopoulos"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Henry", :surname=>"Stommel"}, {:firstname=>"Elizameth", :surname=>"Stommel"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Bryan", :surname=>"Wade-Perkins"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Christopher", :surname=>"Wills"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Simon", :surname=>"Winchester"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
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
  :publisher => ""
})
debugger if result.errors.count > 0
[{:firstname=>"Philip", :surname=>"Ziegler"}].each do |name_info|
  authors = Author.where(:first_name => name_info[:firstname], :last_name => name_info[:surname])
  if authors.length == 0
    author = Author.create(:first_name => name_info[:firstname],
                           :last_name => name_info[:surname])
  else
    author = authors[0]
  end
  result.authors << author
end
