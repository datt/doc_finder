DocFinder::Application.routes.draw do
  root :to => 'home#index'
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

  resources :doctors
end
