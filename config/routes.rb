MyAgregat::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords", }

  root 'welcome#index'

  resources :categories, :only => [:show] do
    scope module: :categories do
      resources :machines, :only => [:index]
    end
  end

  resources :users, :only => [:show] do
    scope module: :users do
      resources :machines, :only => [:index, :show, :edit] do
        member do
          get :activate
          get :archivate
        end

        collection do
          get :archive
        end
      end
    end
  end
end
