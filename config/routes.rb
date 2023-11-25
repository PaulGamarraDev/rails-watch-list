Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create] do
    member do
      resources :bookmarks, only: %i[new create]
    end
  end

  resources :bookmarks, only: [:destroy] do

  end

  # get 'lists', to: 'lists#index'
  # get 'lists/:id', to: 'lists#show'
  # get 'lists/new', to: 'lists#new'
  # post 'lists', to: 'lists#create'

end
