Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :portfolio, only: [:show, :edit, :update]
    resources :repositories
  end
  root 'welcome#index'

  match "/auth/:provider/callback" => "sessions#create", :via => [:get], :as => 'gallery_show'
  match "/signout" => "sessions#destroy", :via => [:get], :as => :signout

end
