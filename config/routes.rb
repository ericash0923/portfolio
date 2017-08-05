Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :credentials, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to:'credentials#angular'
  get 'portfolio/:id', to:'credentials#show', as:'portfolio_show'
  
  
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
end
