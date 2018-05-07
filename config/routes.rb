Rails.application.routes.draw do
  resources :portfolios


  resources :blogs do
    member do
      get :toggle_status
    end
  end


  get 'pages/home'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

end
