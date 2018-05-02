Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users do
        collection do
          post :sign_in
          post :sign_out
        end
        resources :spendings
        resources :earnings
        resources :goals
        resources :categories, only: [:index]
      end
    end
  end
end
