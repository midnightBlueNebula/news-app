Rails.application.routes.draw do
  post 'comment/new', to: "comments#create"
  post 'comment/edit', to: "comments#update"
  delete 'comment/remove/:id', to: "comments#destroy"
  post 'comment/vote/:id', to: "comments#vote"
  get 'articles/new'
  post "articles/new", to: "articles#create"
  get 'articles/edit/:id', to: "articles#edit"
  post "articles/edit/:id", to: "articles#update"
  get "articles/show/:id", to: "articles#show"
  post "articles/vote/:id", to: "articles#vote"
  delete "articles/remove/:id", to: "articles#destroy"
  get 'users/new'
  post 'users/new/:id', to: "users#create"
  get 'users/edit/:id', to: "users#edit"
  post 'users/edit/:id', to: "users#update"
  get 'users/show/:id', to: "users#show"
  get "users/login", to: "users#login_page"
  post "users/login", to: "users#login_action"
  delete "users/logout", to: "users#logout_action"
  delete "users/remove/:id", to: "users#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
