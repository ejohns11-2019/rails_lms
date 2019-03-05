Rails.application.routes.draw do
  root 'courses#index' #controller#action

  resources :users #name of controller
  resources :courses do
    resources :enrollments, only: [:index, :new, :create, :destroy]
  end
end
