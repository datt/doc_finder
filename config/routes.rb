DocFinder::Application.routes.draw do
  root :to => 'home#index'
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
    resources :clinics do
      resources :appointments
    end
  end
  resources :patients
end
