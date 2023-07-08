# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get '/character_categories/sort', to: 'character_categories#sort', as: :character_categories_sort
  get '/character_attributes/:character_category_id/sort', to: 'character_attributes#sort', as: :character_attributes_sort
  get '/sections/:chapter_id/sort', to: 'sections#sort', as: :sections_sort
  get '/segments/:stage_id/sort', to: 'segments#sort', as: :segment_sort
  get '/itineraries/:tour_id/sort', to: 'itineraries#sort', as: :itinerary_sort
  get '/books/sort', to: 'books#sort', as: :books_sort
  patch '/sections/:section_id/sort', to: 'sections#sort', as: :section_sort
  get '/tours/:story_id/sort', to: 'tours#sort', as: :tour_sort
  get '/key_points/:story_id/sort', to: 'key_points#sort', as: :key_points_sort
  get '/stories/:book_id/sort', to: 'stories#sort', as: :stories_sort
  get '/chapters/:book_id/sort', to: 'chapters#sort', as: :chapters_sort

  get '/books/:book_id/characters/report', to: 'characters#report', as: :book_character_report

  get '/cities/index', to: 'cities#index', format: :js, constraints: ->(request) { request.xhr? }
  get '/cities/index', to: 'cities#index'
  post '/cities/itinerary', to: 'cities#itinerary', as: :cities_itinerary
  resources :cities do
    get :map_locs, to: 'cities#map_locs', format: :js, as: :map_locs, constraints: ->(request) { request.xhr? }
  end

  post '/character/:book_id/steps/create', to: 'character/steps#create', as: :character_steps_book
  patch '/character/:book_id/steps', to: 'character/steps#show', as: :character_steps_show
  namespace :character do
    get 'steps/show'
    get 'steps/update'
  end

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

  resources :character_categories, shallow: true do
    resources :character_attributes do
      patch :sort
      get :attribute_values, to: 'characters#attribute_values', format: :js, constraints: lambda { |request| request.xhr?  }
    end
    patch :sort
    get :attributes, to: 'characters#attributes', format: :js, constraints: lambda { |request| request.xhr?  }
  end

  put '/actor_location_times/:id/check', to: 'actor_location_times#check', as: :actor_location_times_check
  post '/plot_points/:id/add', to: 'plot_points#add', as: :plot_points_add
  get '/plot_points/:id/list', to: 'plot_points#list', as: :plot_points_list

  devise_for :users
  #devise_for :users, ActiveAdmin::Devise.config
  resources :footnotes
  resources :key_words, except: %i[index new create]
  resources :signets
  resources :embeds

  post '/books/:book_id/key_points/:id/add', to: 'key_points#add', as: :book_key_point_add
  post '/books/:book_id/key_points/:id/moved', to: 'key_points#moved', as: :book_key_point_moved
  get '/books/:book_id/key_points/:id/list', to: 'key_points#list', as: :book_key_point_list
  get '/books/:book_id/key_points/:id/move', to: 'key_points#move', as: :book_key_point_move
  post '/books/:book_id/authors/add', to: 'authors#add', as: :book_authors_add
  get '/books/:book_id/authors/list', to: 'authors#list', as: :book_authors_list
  post '/books/:book_id/characters/add', to: 'characters#add', as: :book_characters_add
  get '/books/:book_id/characters/list', to: 'characters#list', as: :book_characters_list
  get '/books/:book_id/character/:id/lineage', to: 'characters#lineage', as: :book_character_lineage
  get '/books/:book_id/chapter/:id', to: 'chapters#move', as: :move_book_chapter
  resources :books, shallow: true do
    resources :plot_points
    resources :key_words
    resources :artifacts
    resources :artifact_types
    resources :actors, shallow: true do
      resources :actor_characters, except: %i[show]
      resources :actor_location_times
    end
    resources :locations
    resources :acts, shallow: true do
      resources :stages, shallow: true do
        resources :segments, shallow: true do
          patch :sort
          resources :location_times, shallow: true do
            resources :actor_location_times
          end
        end
        get :check, to: 'stages#check'
        get :list, to: 'stages#list'
        get :report, to: 'stages#report'
        get :show, to: 'stages#show'
        patch :add_characters, to: 'stages#add_characters'
      end
    end
    patch :sort
    concerns :scripted, scripted_type: 'Book'
    resources :key_points do
      resources :sections
      resources :scenes
      get :view, to: 'key_points#view'
    end
    resources :scenes
    resources :authors
    resources :glossary_terms
    resources :biblioentries
    resources :stories do
      patch :sort
    end
    get :view, to: 'books#view'
    get :list_chars, to: 'characters#list_chars'
    get :publish, to: 'books#publish'
    get :chars, to: 'books#chars'
    post :import_chars, to: 'books#import_chars'
    get :chars_import, to: 'books#chars_import'
    get :characters, to: 'characters#index', format: :js, constraints: lambda { |request| request.xhr?  }
    get :scenes, to: 'scenes#index', format: :js, constraints: ->(request) { request.xhr? }
    get :export, to: 'books#export'
    get :report, to: 'books#report'
    get :epub, to: 'books#epub'
    get :toc, to: 'books#toc'
    get :resync_stories, to: 'books#resync_stories'
  end

  resources :biblioentries do
    resources :authors
  end

  get '/sections/:section_id/footnotes',               to: 'footnotes#index', as: :section_footnotes
  get '/sections/:section_id/footnote/:id',               to: 'footnotes#show', as: :section_footnote
  get '/sections/:section_id/footnotes/:slug',               to: 'footnotes#new', as: :new_section_footnote
  get '/sections/:section_id/footnotes/edit/:id',               to: 'footnotes#edit', as: :edit_section_footnote
  patch '/sections/:section_id/footnote/:id',               to: 'footnotes#update', as: :section_footnote_update
  post '/sections/:section_id/footnotes',               to: 'footnotes#create', as: :section_footnote_create
  resource :sections do
    resources :signets, only: [:index, :show, :new, :create, :update]
    resources :footnotes
    get :timeline, to: 'timelines#timeline'
    get :map_locs, to: 'sections#map_locs', format: :js, constraints: ->(request) { request.xhr? }
    get :geo_map, to: 'sections#geo_map'
    get :holocene_events, to: 'holocene_events#index'
    post :holocene_events, to: 'holocene_events#objects'
    get :display, to: 'holocene_events#display'
    get :add_event, to: 'holocene_events#add_event'
    get :show, to: 'sections#show'
  end

  resources :books do
    resources :authors
    resources :characters, shallow: false, except: [:new] do
      resources :steps, only: %i[show update], controller: 'character/steps'
      resources :character_values
      member do
        get "edit_attribute/:attribute", action: :edit_attribute, as: :edit_attribute
        patch "update_attribute/:attribute", action: :update_attribute, as: :update_attribute
      end
    end
    resources :signets, only: [:index, :show, :new, :create, :update]
    resources :asides, only: [:index]
    resources :partitions, only: [:index]
    get :notes, to: 'signets#notes'
    get :timeline, to: 'timelines#timeline'
    get :timeline, to: 'timelines#timeline', as: :timelinejs, format: :json, constraints: lambda { |request| request.xhr?  }
  end

  resources :stories, shallow: true do
    concerns :situated, scripted_type: 'Story'
    patch :sort
    resources :tours do
      get :map_locs, to: 'tours#map_locs', format: :js, constraints: ->(request) { request.xhr? }
      get :add_city, to: 'cities#add_city'
      get :cities, to: 'cities#index'
      post :tours, to: 'cities#tours'
      get :geo_map, to: 'tours#geo_map'
      patch :sort
      resources :itineraries do
        patch :sort
        get :map_locs, to: 'itineraries#map_locs', format: :js, constraints: ->(request) { request.xhr? }
      end
    end
    resources :scenes
    resources :characters
    resources :key_points do
      patch :sort
      resources :scenes
    end
    resources :chapters
  end

  get '/scenes/:scene_id/characters/report', to: 'characters#report', as: :scene_character_report
  post '/scenes/:scene_id/characters/add', to: 'characters#add', as: :scene_characters_add
  get '/scenes/:scene_id/characters/list', to: 'characters#list', as: :scene_characters_list
  get '/scenes/:scene_id/character/:id/lineage', to: 'characters#lineage', as: :scene_character_lineage
  post '/scenes/index', to: 'scenes#index'
  resources :scenes do
    concerns :sectioned, sectioned_type: 'Scene'
    resources :sections
    resources :characters, except: [:new] do
      resources :steps, only: %i[show update], controller: 'character/steps'
      resources :character_values
    end
    post :moved, to: 'scenes#moved'
    put :check, to: 'scenes#check'
    get :move, to: 'scenes#move'
  end

  get '/stories/:story_id/key_points/:id/list', to: 'key_points#list', as: :story_key_point_list
  post '/stories/:story_id/key_points/:id/add', to: 'key_points#add', as: :story_key_point_add
  get '/stories/:story_id/characters/report', to: 'characters#report', as: :story_character_report
  get '/stories/:story_id/key_points/:id/move', to: 'key_points#move', as: :story_key_point_move
  post '/stories/:story_id/key_points/:id/moved', to: 'key_points#moved', as: :story_key_point_moved
  get '/stories/:story_id/characters/list', to: 'characters#list', as: :story_characters_list
  post '/stories/:story_id/characters/add', to: 'characters#add', as: :story_characters_add
  get '/stories/:story_id/character/:id/lineage', to: 'characters#lineage', as: :story_character_lineage
  resources :stories do
    resources :characters, except: [:new] do
      resources :steps, only: %i[show update], controller: 'character/steps'
      resources :character_values
    end
    resources :signets, only: [:index, :show, :new, :create, :update]
    get :notes, to: 'signets#notes'
    get :timeline, to: 'timelines#timeline'
    get :timeline, to: 'timelines#timeline', as: :timelinejs, format: :json, constraints: lambda { |request| request.xhr?  }
    get :view, to: 'stories#view'
    get :chars, to: 'stories#chars'
    get :move, to: 'stories#move'
    post :moved, to: 'stories#moved'
    get :report, to: 'stories#report'
    get :resync_scenes, to: 'stories#resync_scenes'
  end

  get '/chapters/:chapter_id/footnotes',               to: 'footnotes#index', as: :chapter_footnotes
  get '/chapters/:chapter_id/footnote/:id',               to: 'footnotes#show', as: :chapter_footnote
  patch '/chapters/:chapter_id/footnote/:id',               to: 'footnotes#update', as: :chapter_footnote_update
  get '/chapters/:chapter_id/footnotes/:slug',               to: 'footnotes#new', as: :new_chapter_footnote
  get '/chapters/:chapter_id/footnotes/edit/:id',               to: 'footnotes#edit', as: :edit_chapter_footnote
  post '/chapters/:chapter_id/footnotes',               to: 'footnotes#create', as: :chapter_footnote_create
  resources :chapters do
    concerns :scripted, scripted_type: 'Chapter'
    concerns :sectioned, sectioned_type: 'Chapter'
    resources :scenes
    resources :sections
    resources :footnotes
    get :report
    patch :sort
    get :notes, to: 'signets#notes'
    get :timeline, to: 'timelines#timeline'
    get :timeline, to: 'timelines#timeline', as: :timelinejs, format: :json, constraints: lambda { |request| request.xhr?  }
    get :geo_map, to: 'chapters#geo_map'
    get :map_locs, to: 'chapters#map_locs', format: :js, as: :map_locs, constraints: ->(request) { request.xhr? }
    get :display, to: 'holocene_events#display'
    get :add_event, to: 'holocene_events#add_event'
    get :show, to: 'chapters#show'
    get :citations,               to: 'citations#index'
    patch :citations, to: 'citations#update', as: :citations_update
    get :footnotes,               to: 'footnotes#index'
    get :demote, to: 'chapters#demote'
    post :citations,               to: 'citations#update'
    post :footnotes,               to: 'footnotes#create'
    get :holocene_events, to: 'holocene_events#index'
    post :holocene_events, to: 'holocene_events#objects'
  end

  get '/citations/index'
  get '/citations/timeline/:citation_id', to: 'timelines#timeline', as: :citation_timeline
  get '/citations/add_event/:citation_id', to: 'holocene_events#add_event', as: :citation_add_event
  get '/citations/show/:id', to: 'citations#show', as: :show_citation
  get '/citations/:citation_id/holocene_events', to: 'holocene_events#index', as: :citation_holocene_events
  post '/citations/:citation_id/holocene_events', to: 'holocene_events#objects', as: :citation_holocene_event
  get '/citation/display/:citation_id', to: 'holocene_events#display', as: :citation_display

  get '/chapters/:id/sections/:section_id/promote', to: 'chapters#promote', as: :chapter_section_promote
  resources :chapters, shallow: true do
    resources :asides
    resources :partitions
    resources :signets, only: [:index, :show, :new, :create, :update]
  end

  resources :scenes, shallow: true do
    patch :sort
    concerns :located, located_type: 'Book'
    resources :sections
    resources :character_scenes, only: %i[show edit update]
    resources :signets, only: [:index, :show, :new, :create, :update]
  end

  resources :epochs do
    get :timeline, to: 'timelines#timeline'
    get :map_locs, to: 'epochs#map_locs', format: :js, constraints: ->(request) { request.xhr? }
    get :geo_map, to: 'epochs#geo_map'
    get :display, to: 'holocene_events#display'
    get :add_event, to: 'holocene_events#add_event'
    get :show, to: 'epochs#show'
    post :holocene_events, to: 'holocene_events#objects'
  end
  resources :timelines do
    get :geo_map
    get :holocene_events, to: 'holocene_events#index'
    get :show, to: 'timelines#show'
    get :display, to: 'holocene_events#display'
    get :add_event, to: 'holocene_events#add_event'
    post :holocene_events, to: 'holocene_events#objects'
    get :timeline, to: 'timelines#timeline', as: :timelinejs, format: :json, constraints: lambda { |request| request.xhr?  }
    get :timeline, to: 'timelines#timeline', as: :timeline
    get :map_locs, to: 'timelines#map_locs', format: :js, as: :timeline_map_locs, constraints: ->(request) { request.xhr? }
  end

  get '/holocene_events/:holocene_event_id/footnotes', to: 'footnotes#index', as: :holocene_event_footnotes
  get '/holocene_events/:holocene_event_id/footnote/:id', to: 'footnotes#show', as: :holocene_event_footnote
  get '/holocene_events/:holocene_event_id/footnotes/:slug', to: 'footnotes#new', as: :new_holocene_event_footnote
  get '/holocene_events/:holocene_event_id/footnotes/edit', to: 'footnotes#edit', as: :edit_holocene_event_footnote
  patch '/holocene_events/:holocene_event_id/footnote/:id', to: 'footnotes#update', as: :holocene_event_footnote_update
  post '/holocene_events/:holocene_event_id/footnotes', to: 'footnotes#create', as: :holocene_event_footnote_create
  post '/holocene_events/:object_type/:object_id/objects/:id', to: 'holocene_events#objects', as: :object_holocene_event
  resources :holocene_events do
    get :map_locs, to: 'holocene_events#map_locs', format: :js, constraints: ->(request) { request.xhr? }
    get :geo_map, to: 'holocene_events#geo_map'
    resources :footnotes
  end
  resources :regions
  resources :event_types do
    get :timeline, to: 'timelines#timeline'
    get :map_locs, to: 'event_types#map_locs', format: :js, constraints: ->(request) { request.xhr? }
    get :geo_map, to: 'event_types#geo_map'
    get :holocene_events, to: 'holocene_events#index'
  end

  get '/artifacts/:book_id/tagged/(:tag)', to: 'artifacts#tagged', as: :tag_artifacts
  get '/tagged/(:tag)', to: 'holocene_events#tagged', as: :tag

  get '/welcome/index'
  get '/welcome/show'
  get '/welcome/stats'
  get '/welcome/progress'
  get '/welcome/history'
  get '/stats', to: 'welcome#stats'
  get '/history', to: 'welcome#history'
  get '/progress', to: 'welcome#progress'
  get '/tags', to: 'welcome#tags', as: :welcome_tags
  get '/faq', to: 'application#faq', as: 'faq'
  get '/secret', to: 'application#secret', as: 'secret'
  get '/about', to: 'application#about', as: 'about'
  get '/contact', to: 'application#contact', as: 'contact'

  root to: 'welcome#index'
end
