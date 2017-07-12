Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :credentials, except: [:show]
  get 'angular-items', to:'credentials#angular'
  get 'portfolio/:id', to:'credentials#show', as:'portfolio_show'
  
  
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
end
