AlRide::Application.routes.draw do
  root to: 'entries#index'

  resources :entries do
    post 'send_email'
    get 'remove'
  end
end
