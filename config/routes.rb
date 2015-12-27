Rails.application.routes.draw do
  get '/companies' => 'companies#index'
  get '/companies/new' => 'companies#new'
  post '/companies' => 'companies#create'
  get '/companies/:id' => 'companies#show'
  get '/companies/:id/edit' => 'companies#edit'
  patch '/companies/:id' => 'companies#update'
  delete '/companies/:id' => 'companies#destroy'
end
