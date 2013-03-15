LoginDemo::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'
  
  get "login/new" ,:as => :login
  get "registration/new" => "registration#new", :as => :sign_up
  post "registration/create" => "registration#create", :as => :registration
  post "login/create" => "login#create", :as => :login_create
  get "welcome/:id" => "login#welcome", :as => :welcome
  get "log_out" => "login#destroy", :as => "log_out"
  
end
