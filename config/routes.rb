DocFinder::Application.routes.draw do
  root :to => 'home#index'
  get 'prescription', to: 'home#prescription'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')

  devise_for :users
  namespace :admin do
    resources :doctors do
    	member do
    		get :clinics
    	end
    end
    resources :clinics, except: [:index]
  end
  match '/admin', :to => 'admin/doctors#index', :as => :admin

  resources :doctors do
    collection do
      get :search
    end
    member do
      get :gmap
    end
    resources :clinics do
      resources :appointments
    end
  end
  resources :patients
end
