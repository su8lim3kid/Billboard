Rails.application.routes.draw do
  get 'billboards/index'
  get 'billboards/show'
root 'artists#index'

resources :artists do
    resources :songs
end

    
end
