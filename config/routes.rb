Rails.application.routes.draw do
  root to: 'users#index'

  get '/users', to: 'users#show'
  get '/users/query', to: 'users#search'
  get '/users/:uid', to: 'users#uid_search'
  get '/users/:uid/groups', to: 'users#group_search'
  get '/groups', to: 'groups#show'
  get '/groups/query', to: 'groups#search'
  get 'groups/:gid', to: 'groups#gid_search'
end
