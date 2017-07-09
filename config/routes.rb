Rails.application.routes.draw do
  resources :credentials, except: [:show]
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
