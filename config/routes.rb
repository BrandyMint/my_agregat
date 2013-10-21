MyAgregat::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords", }

  root 'welcome#index'

  resources :categories, :only => [:show] do
    resources :machines, :only => [:index]
  end
end
