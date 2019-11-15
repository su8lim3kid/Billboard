Rails.application.routes.draw do
  get 'billboards/index'
  get 'billboards/show'
root 'artists#index'

resources :artists do
    resources :songs
end

    resources :songs do
      resources :billboard

    end
end
