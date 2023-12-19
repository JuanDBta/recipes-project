Rails.application.routes.draw do
  get 'public_recipes/index'

  root to: 'recipe#index', as: :user_recipes_root

  get 'users/:user_id/foods', to: 'food#index', as: 'user_foods'
  get 'users/:user_id/foods/new', to: 'food#new', as: 'new_user_food'
  post 'users/:user_id/foods', to: 'food#create', as: 'create_user_food'
  delete 'users/:user_id/foods/:id', to: 'food#destroy', as: 'destroy_user_food'

  get 'users/:user_id/recipes', to: 'recipe#index', as: 'user_recipes'
  get 'users/:user_id/recipes/new', to: 'recipe#new', as: 'new_user_recipe'
  post 'users/:user_id/recipes', to: 'recipe#create', as: 'create_user_recipe'
  get 'users/:user_id/recipes/:id', to: 'recipe#show', as: 'show_user_recipe'
  delete 'users/:user_id/recipes/:id', to: 'recipe#destroy', as: 'destroy_user_recipe'

  get 'users/:user_id/recipes/:recipe_id/recipe_foods/new', to: 'recipe_foods#new', as: 'new_user_recipe_recipe_food'
  get 'users/:user_id/recipes/:recipe_id/recipe_foods', to: 'recipe_foods#index', as: 'user_recipe_recipe_foods'
  post 'users/:user_id/recipes/:recipe_id/recipe_foods', to: 'recipe_foods#create', as: 'create_user_recipe_recipe_food'
  delete 'users/:user_id/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#destroy', as: 'destroy_user_recipe_recipe_food'
  get 'users/:user_id/recipes/:recipe_id/recipe_foods/:id/edit', to: 'recipe_foods#edit', as: 'edit_user_recipe_recipe_food'
  patch 'users/:user_id/recipes/:recipe_id/recipe_foods/:id/update', to: 'recipe_foods#update', as: 'update_user_recipe_recipe_food'


  patch 'users/:user_id/recipes/:id/toggle_public', to: 'recipe#toggle_public', as: 'toggle_public_recipe'

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  get '/general_shopping_list', to: 'shopping_lists#index', as: 'general_shopping_list'

end
