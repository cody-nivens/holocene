Rails.application.routes.draw do
  resources :biblioentries
  resources :authors
  resources :chapters
  resources :sections
  resources :eras
  resources :timelines
  get "welcome/index"
  resources :citations
  resources :holocene_events
  resources :regions
  resources :event_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get "tagged/(:tag)", to: "holocene_events#tagged", as: :tag
  get "/timelines/display/:id", to: "timelines#display", as: :display

  root to: "welcome#index"
  get "/faq", to: "application#faq", as: "faq"
  get "/secret", to: "application#secret", as: "secret"
  get "/about", to: "application#about", as: "about"
  get "/contact", to: "application#contact", as: "contact"

end
