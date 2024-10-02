# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: "categories#index"
  resources :bookmarks, only: [:destroy]
  resources :categories, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create, :edit, :update]
  end
end
