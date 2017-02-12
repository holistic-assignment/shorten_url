Rails.application.routes.draw do
  root 'short_links#index'
  get  ':id' => 'short_links#redirect'
  get  'a/sign_in',to: 'sessions#new'
  get  'a/sign_up',to: 'users#new'
  delete 'a/sign_out', to: 'sessions#destroy'
  resources :users
  resources :short_links
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
