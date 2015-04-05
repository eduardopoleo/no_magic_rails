Rails.application.routes.draw do
  get '/posts', to: 'application#posts'
  get '/show_post', to: 'application#show_post'
  get '/new_post', to: 'application#new_post'
end
