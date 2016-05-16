AlRide::Application.routes.draw do
  root to: 'welcome#index'

  resources :entries do
    post 'send_email'
    get 'remove'
  end
end
