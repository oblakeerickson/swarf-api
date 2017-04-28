Rails.application.routes.draw do
  resources :lists do
    resources :todos
  end
end
