Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/courses', to: 'courses#index'
  get '/courses/:id', to: 'courses#show'
  # get '/courses/new', to: 'courses#new'
  # post '/courses', to: 'courses#create'
  get '/holes', to: 'holes#index'
end
