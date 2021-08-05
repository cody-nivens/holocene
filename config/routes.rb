Rails.application.routes.draw do

  concern :sectioned do |options|
     resources :chapters, options
     resources :scenes, options
  end

  concern :situated do |options|
     resources :chapters, options
     resources :stories, options
  end

  concern :located do |options|
    resources :scenes, options
  end

  concern :scripted do |options|
     resources :chapters, options
     resources :key_points, options
  end
  resources :signets
  resources :embeds
  resources :character_attributes
  resources :character_categories

  get "books/:id/export", to: "books#export", as: :book_export
  get "books/:id/epub", to: "books#epub", as: :book_epub
  get "books/:id/toc", to: "books#toc", as: :toc
  get "/books/:book_id/key_points/:id/move", to: "key_points#move", as: :book_key_point_move
  post "/books/:book_id/key_points/:id/moved", to: "key_points#moved", as: :book_key_point_moved
  post "/books/:book_id/authors/add", to: "authors#add", as: :book_authors_add
  get "/books/:book_id/authors/list", to: "authors#list", as: :book_authors_list
  post "/books/:book_id/characters/add", to: "characters#add", as: :book_characters_add
  get "/books/:book_id/characters/list", to: "characters#list", as: :book_characters_list
  get "/books/:book_id/character/:id/lineage", to: "characters#lineage", as: :book_character_lineage
  get "/books/:id/resync_stories", to: "books#resync_stories", as: :book_resync_stories
  get "/books/:book_id/key_points/:id/list", to: "key_points#list", as: :book_key_point_list
  post "/books/:book_id/key_points/:id/add", to: "key_points#add", as: :book_key_point_add
  get "/books/:id/timeline", to: "books#timeline", as: :book_timeline

  get "/scenes/:id/move", to: "scenes#move", as: :scene_move
  post "/scenes/:id/moved", to: "scenes#moved", as: :scene_moved
  post "/scenes/:scene_id/characters/add", to: "characters#add", as: :scene_characters_add
  get "/scenes/:scene_id/characters/list", to: "characters#list", as: :scene_characters_list
  get "/scenes/:scene_id/character/:id/lineage", to: "characters#lineage", as: :scene_character_lineage

  get "/stories/:story_id/key_points/:id/move", to: "key_points#move", as: :story_key_point_move
  post "/stories/:story_id/key_points/:id/moved", to: "key_points#moved", as: :story_key_point_moved
  get "/stories/:story_id/characters/list", to: "characters#list", as: :story_characters_list
  post "/stories/:story_id/characters/add", to: "characters#add", as: :story_characters_add
  get "/stories/:id/timeline", to: "stories#timeline", as: :story_timeline
  get "/stories/:id/resync_scenes", to: "stories#resync_scenes", as: :story_resync_scenes
  get "/stories/:story_id/key_points/:id/list", to: "key_points#list", as: :story_key_point_list
  post "/stories/:story_id/key_points/:id/add", to: "key_points#add", as: :story_key_point_add
  get "/stories/:story_id/character/:id/lineage", to: "characters#lineage", as: :story_character_lineage

#  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :footnotes
    resources :scenes do
      resources :characters do
      resources :character_values
    end
    end
  resources :books do
    resources :artifacts
    resources :artifact_types
    concerns :scripted, scripted_type: 'Book'
    resources :key_points do
      resources :sections
    end
    resources :characters do
      resources :character_values
    end
    resources :scenes
    resources :authors
    resources :glossary_terms
    resources :biblioentries
    resources :stories
    resources :key_points do
      resources :scenes 
    end
  end
    resources :stories do
      concerns :situated, scripted_type: 'Story'
      resources :scenes 
      resources :key_points do
        resources :scenes 
      end
      resources :chapters
      resources :characters do
        resources :character_values
      end
    end
  resources :chapters do
    concerns :scripted, scripted_type: 'Chapter'
    concerns :sectioned, sectioned_type: 'Chapter'
    resources :scenes 
    resources :asides
    resources :partitions
    resources :sections
 end
 resources :scenes do
    concerns :located, located_type: 'Book'
    resources :sections
    resources :character_scenes, only: [ :edit, :update ]
  end
  resources :epochs
  resources :timelines
  get "welcome/index"
  get "welcome/stats"
  get "/stats", to: "welcome#stats"
  resources :holocene_events
  resources :regions
  resources :event_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get "tagged/(:tag)", to: "holocene_events#tagged", as: :tag

  get "event_types/:id/geo_map", to: "event_types#geo_map", as: :geo_map_event_type
  get "timelines/:id/geo_map", to: "timelines#geo_map", as: :geo_map_timeline
  get "epochs/:id/geo_map", to: "epochs#geo_map", as: :geo_map_epoch
  get "chapters/:id/geo_map", to: "chapters#geo_map", as: :geo_map_chapter
  get "sections/:id/geo_map", to: "sections#geo_map", as: :geo_map_section
  get "holocene_events/:id/geo_map", to: "holocene_events#geo_map", as: :geo_map_holocene_event

  get 'citations/index'
  get "/timelines/display/:timeline_id", to: "holocene_events#display", as: :timeline_display
  get "/citation/display/:citation_id", to: "holocene_events#display", as: :citation_display
  get "/chapters/display/:chapter_id", to: "holocene_events#display", as: :chapter_display
  get "/sections/display/:section_id", to: "holocene_events#display", as: :section_display
  get "/epochs/display/:epoch_id", to: "holocene_events#display", as: :epoch_display

  get "/chapters/add_event/:chapter_id", to: "holocene_events#add_event", as: :chapter_add_event
  get "/sections/add_event/:section_id", to: "holocene_events#add_event", as: :section_add_event
  get "/timelines/add_event/:timeline_id", to: "holocene_events#add_event", as: :timeline_add_event
  get "/citations/add_event/:citation_id", to: "holocene_events#add_event", as: :citation_add_event
  get "/epochs/add_event/:epoch_id", to: "holocene_events#add_event", as: :epoch_add_event

  get "/chapters/timeline/:chapter_id/chapter", to: "timelines#timeline", as: :chapter_timeline
  get "/sections/timeline/:section_id", to: "timelines#timeline", as: :section_timeline
  get "/citations/timeline/:citation_id", to: "timelines#timeline", as: :citation_timeline
  get "/timelines/timeline/:timeline_id", to: "timelines#timeline", as: :timeline_timeline
  get "/epochs/timeline/:epoch_id", to: "timelines#timeline", as: :epoch_timeline
  get "/event_types/timeline/:event_type_id", to: "timelines#timeline", as: :event_type_timeline

  get '/chapters/show/:id', to: "chapters#show", as: :show_chapter
  get '/sections/show/:id', to: "sections#show", as: :show_section
  get '/citations/show/:id', to: "citations#show", as: :show_citation
  get '/timelines/show/:id', to: "timelines#show", as: :show_timeline
  get '/epochs/show/:id', to: "epochs#show", as: :show_epoch

  get "/chapters/:chapter_id/citations",               to: "citations#index", as: :chapter_citations
  get "/chapters/:chapter_id/footnotes",               to: "footnotes#index", as: :chapter_footnotes
  get "/sections/:section_id/footnotes",               to: "footnotes#index", as: :section_footnotes
  get "/holocene_events/:holocene_event_id/footnotes", to: "footnotes#index", as: :holocene_event_footnotes

  get "/chapters/:chapter_id/footnote/:id",               to: "footnotes#show", as: :chapter_footnote
  get "/sections/:section_id/footnote/:id",               to: "footnotes#show", as: :section_footnote
  get "/holocene_events/:holocene_event_id/footnote/:id", to: "footnotes#show", as: :holocene_event_footnote

  get "/chapters/:chapter_id/footnotes/:slug",               to: "footnotes#new", as: :new_chapter_footnote
  get "/sections/:section_id/footnotes/:slug",               to: "footnotes#new", as: :new_section_footnote
  get "/holocene_events/:holocene_event_id/footnotes/:slug", to: "footnotes#new", as: :new_holocene_event_footnote

  patch "/chapters/:chapter_id/citations",               to: "citations#update", as: :chapter_citation_update
  patch "/chapters/:chapter_id/footnote/:id",               to: "footnotes#update", as: :chapter_footnote_update
  patch "/sections/:section_id/footnote/:id",               to: "footnotes#update", as: :section_footnote_update
  patch "/holocene_events/:holocene_event_id/footnote/:id", to: "footnotes#update", as: :holocene_event_footnote_update

  get "/chapters/:id/sections/:section_id/promote",               to: "chapters#promote", as: :chapter_section_promote
  get "/chapters/:id/demote",               to: "chapters#demote", as: :chapter_demote

  post "/chapters/:chapter_id/citations",               to: "citations#update", as: :chapter_citation_create
  post "/chapters/:chapter_id/footnotes",               to: "footnotes#create", as: :chapter_footnote_create
  post "/sections/:section_id/footnotes",               to: "footnotes#create", as: :section_footnote_create
  post "/holocene_events/:holocene_event_id/footnotes", to: "footnotes#create", as: :holocene_event_footnote_create

  get "/chapters/:chapter_id/holocene_events", to: "holocene_events#index", as: :chapter_holocene_events
  get "/sections/:section_id/holocene_events", to: "holocene_events#index", as: :section_holocene_events
  get "/timelines/:timeline_id/holocene_events", to: "holocene_events#index", as: :timeline_holocene_events
  get "/citations/:citation_id/holocene_events", to: "holocene_events#index", as: :citation_holocene_events

  post "/chapters/:chapter_id/holocene_events", to: "holocene_events#objects", as: :chapter_holocene_event
  post "/holocene_events/:object_type/:object_id/objects/:id", to: "holocene_events#objects", as: :object_holocene_event

  post "/sections/:section_id/holocene_events", to: "holocene_events#objects", as: :section_holocene_event
  post "/timelines/:timeline_id/holocene_events", to: "holocene_events#objects", as: :timeline_holocene_event
  post "/citations/:citation_id/holocene_events", to: "holocene_events#objects", as: :citation_holocene_event

  get "/books/:book_id/chapter/:id", to: "chapters#move", as: :move_book_chapter


  get "/chapters/:chapter_id/signets",               to: "signets#index", as: :chapter_signets
  get "/sections/:section_id/signets",               to: "signets#index", as: :section_signets
  get "/books/:book_id/signets",               to: "signets#index", as: :book_signets
  get "/holocene_events/:holocene_event_id/signets", to: "signets#index", as: :holocene_event_signets
  get "/chapters/:chapter_id/signet/:id",               to: "signets#show", as: :chapter_signet
  get "/sections/:section_id/signet/:id",               to: "signets#show", as: :section_signet
  get "/books/:book_id/signet/:id",               to: "signets#show", as: :book_signet
  get "/holocene_events/:holocene_event_id/signet/:id", to: "signets#show", as: :holocene_event_signet
  get "/chapters/:chapter_id/signets/new",               to: "signets#new", as: :new_chapter_signet
  get "/sections/:section_id/signets/new",               to: "signets#new", as: :new_section_signet
  get "/books/:book_id/signets/new",               to: "signets#new", as: :new_book_signet
  get "/holocene_events/:holocene_event_id/signets/new", to: "signets#new", as: :new_holocene_event_signet
  patch "/chapters/:chapter_id/signet/:id",               to: "signets#update", as: :chapter_signet_update
  patch "/sections/:section_id/signet/:id",               to: "signets#update", as: :section_signet_update
  patch "/books/:book_id/signet/:id",               to: "signets#update", as: :book_signet_update
  patch "/holocene_events/:holocene_event_id/signet/:id", to: "signets#update", as: :holocene_event_signet_update
  post "/chapters/:chapter_id/signets",               to: "signets#create", as: :chapter_signet_create
  post "/sections/:section_id/signets",               to: "signets#create", as: :section_signet_create
  post "/books/:book_id/signets",               to: "signets#create", as: :book_signet_create
  post "/holocene_events/:holocene_event_id/signets", to: "signets#create", as: :holocene_event_signet_create

  root to: "welcome#index"

  get "/faq", to: "application#faq", as: "faq"
  get "/secret", to: "application#secret", as: "secret"
  get "/about", to: "application#about", as: "about"
  get "/contact", to: "application#contact", as: "contact"

end
