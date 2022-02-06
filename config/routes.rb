Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'entries#index'

  resources :entries do
    post 'send_email'
    get 'remove'
  end
end
