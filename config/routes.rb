Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'recipe_users#login'})
  match('recipe_users', {:via => :get, :to => 'recipe_users#read'})
  match('recipe_users', {:via => :post, :to => 'recipe_users#create'})
  match('recipe_users/new', {:via => :get, :to => 'recipe_users#new'})
  match('recipe_users/index', {:via => :get, :to => 'recipe_users#index'})
  match('recipe_users/:id/edit', {:via => :get, :to => 'recipe_users#edit'})
  match('recipe_users/:id', {:via => :patch, :to => 'recipe_users#update'})
  match('recipe_users/:id', {:via => :delete, :to => 'recipe_users#destroy'})
  # match('recipes', {:via => :get, :to => 'recipes#new'})
  # match('recipes', {:via => :post, :to => 'recipes#create'})
  # match('recipes/index', {:via => :get, :to => 'recipes#index'})
  # match('recipes/:id/read', {:via => :get, :to => 'recipes#read'})
  # match('recipes/:id/edit', {:via => :get, :to => 'recipes#edit'})
  # match('recipes/:id', {:via => :patch, :to => 'recipes#update'})
  # match('recipes/:id', {:via => :delete, :to => 'recipes#destroy'})
  match('tags/index', {:via => :get, :to => 'tags#index'})
  match('tags', {:via => :post, :to => 'tags#create'})
  match('tags/new', {:via => :get, :to => 'tags#new'})
  match('tags/:id/edit', {:via => :get, :to => 'tags#edit'})
  match('tags/:id', {:via => :patch, :to => 'tags#update'})
  match('tags/:id', {:via => :delete, :to => 'tags#destroy'})
end
