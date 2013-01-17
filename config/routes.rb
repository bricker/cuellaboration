Cuellaboration::Application.routes.draw do
  root to: 'projects#index'
  
  resources :projects
  resources :cues
  resources :versions
  resources :collaborators
  resources :notes
  
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  resources :sessions, only: [:create, :destroy]
end
