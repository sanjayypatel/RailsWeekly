Rails.application.routes.draw do
  resources :users, only: [:show]

  root 'welcome#index'

  match "/auth/:provider/callback" => "sessions#create", :via => [:get], :as => 'gallery_show'
  match "/signout" => "sessions#destroy", :via => [:get], :as => :signout

end
