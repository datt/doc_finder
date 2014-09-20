DocFinder::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  namespace :admin do
    resources :doctors
  end
  match '/admin', :to => 'admin/doctors#index', :as => :admin

  resources :doctors do
    resources :clinics do
      resources :appointments
    end
  end
end
