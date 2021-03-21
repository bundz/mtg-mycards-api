Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/api' do
    post '/user', to: 'user#create'
    post '/user/login', to: 'user#login'
    get '/user', to: 'user#show'
    get '/edition', to: 'edition#index'
    get '/edition/:id', to: 'edition#cards'
  end 
end
