Rails.application.routes.draw do
  resources :reservations
  namespace :api do
    namespace :v1 do
      resources :reservations
    end
  end
  root 'reservations#index'

  match '*unmatched', to: proc { [404, {}, ['Invalid route']] }, via: :all
end
