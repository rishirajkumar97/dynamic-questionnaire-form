Rails.application.routes.draw do
  resources :forms, only: %i[index create show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
