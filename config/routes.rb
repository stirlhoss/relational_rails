Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/courses', to: 'courses#index'
  post '/courses', to: 'courses#create'
  get '/courses/new', to: 'courses#new'
  get '/courses/:id', to: 'courses#show'
  patch '/courses/:id', to: 'courses#update'
  get '/courses/:id/edit', to: 'courses#edit'
  delete '/courses/:id', to: 'courses#destroy'

  get '/courses/:course_id/holes', to: 'course_holes#index'
  post '/courses/:course_id/holes', to: 'course_holes#create'
  get '/courses/:course_id/holes/new', to: 'course_holes#new'

  get '/holes', to: 'holes#index'
  get '/holes/:id', to: 'holes#show'
  patch '/holes/:id', to: 'holes#update'
  get '/holes/:id/edit', to: 'holes#edit'
end
