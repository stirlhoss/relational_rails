Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/courses', to: 'courses#index'
  get '/courses/new', to: 'courses#new'
  post '/courses', to: 'courses#create'
  get '/courses/:id/edit', to: 'courses#edit'
  patch '/courses/:id', to: 'courses#update'
  get '/courses/:id', to: 'courses#show'

  get '/holes', to: 'holes#index'
  get '/holes/:id', to: 'holes#show'

  get '/courses/:parent_id/holes', to: 'course_holes#index'
  get '/courses/:parent_id/holes/new', to: 'course_holes#new'
end
