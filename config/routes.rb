Rails.application.routes.draw do

  root to: 'countries#index'

  resources :countries do 
    resources :leagues do
      resources :seasons do 
        resources :teams do
          resources :games
        end
        resources :games
      end
    end
  end
end
