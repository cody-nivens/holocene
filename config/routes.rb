Rails.application.routes.draw do
#  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :footnotes
  resources :biblioentries do
    resources :citations
  end
  resources :authors
  resources :books do
    resources :chapters do
      resources :sections
    end
  end
  resources :epochs
  resources :timelines
  get "welcome/index"
  resources :holocene_events
  resources :regions
  resources :event_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get "tagged/(:tag)", to: "holocene_events#tagged", as: :tag

  get "/timelines/display/:id", to: "timelines#display", as: :timeline_display
  get "/citation/display/:id", to: "citations#display", as: :citation_display

  get "/chapters/display/:id", to: "chapters#display", as: :chapter_display
  get "/sections/display/:id", to: "sections#display", as: :section_display

  get "/chapters/timeline/:id", to: "chapters#timeline", as: :chapter_timeline
  get "/sections/timeline/:id", to: "sections#timeline", as: :section_timeline
  get "/citations/timeline/:id", to: "citations#timeline", as: :citation_timeline
  get "/timelines/timeline/:id", to: "timelines#timeline", as: :timeline_timeline

  #get "/chapters/:chapter_id/footnotes/new", to: "footnotes#chapter", as: :new_chapter_footnotes

  get "/chapters/:chapter_id/footnotes",               to: "footnotes#index", as: :chapter_footnotes
  get "/sections/:section_id/footnotes",               to: "footnotes#index", as: :section_footnotes
  get "/holocene_events/:holocene_event_id/footnotes", to: "footnotes#index", as: :holocene_event_footnotes

  get "/chapters/:chapter_id/footnote/:id",               to: "footnotes#show", as: :chapter_footnote
  get "/sections/:section_id/footnote/:id",               to: "footnotes#show", as: :section_footnote
  get "/holocene_events/:holocene_event_id/footnote/:id", to: "footnotes#show", as: :holocene_event_footnote

  get "/chapters/:chapter_id/footnotes/:slug",               to: "footnotes#new", as: :new_chapter_footnote
  get "/sections/:section_id/footnotes/:slug",               to: "footnotes#new", as: :new_section_footnote
  get "/holocene_events/:holocene_event_id/footnotes/:slug", to: "footnotes#new", as: :new_holocene_event_footnote

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
  get "/books/:id/pdf", to: "books#pdf", as: :book_pdf, defaults:  { :format => 'pdf' }
  get "/chapters/:id/pdf", to: "chapters#pdf", as: :chapter_pdf, defaults:  { :format => 'pdf' }

  root to: "welcome#index"
  get "/faq", to: "application#faq", as: "faq"
  get "/secret", to: "application#secret", as: "secret"
  get "/about", to: "application#about", as: "about"
  get "/contact", to: "application#contact", as: "contact"

end
