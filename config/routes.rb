Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      get '/employees' => 'employees#index'
      post '/employees' => 'employees#create'
      get '/employees/:id' => 'employees#show'
      get '/employees/:id/edit' => 'employees#edit'
      patch '/employees/:id' => 'employees#update'
      delete '/employees/:id' => 'employees#destroy'
    end
  end
  root 'devise/sessions#new'
  get '/employees' => 'employees#index'
  get '/employees/new' => 'employees#new'
  post '/employees' => 'employees#create'
  get '/employees/:id' => 'employees#show'
  patch '/employees/:id' => 'employees#update'
  delete '/employees/:id' => 'employees#destroy'
end
