Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users
      resources :spendings
      resources :earnings
      resources :goal

    end
  end
end
