Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :forms, only: [:index, :create, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
