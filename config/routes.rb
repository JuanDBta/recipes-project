Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:show] do
    resources :recipes, only: [:index, :show]
    resources :foods, only: [:index]
    
    get 'public_recipes', to: 'recipes#public', on: :member
    get 'shopping_list', to: 'foods#shopping_list', on: :member
  end
end
