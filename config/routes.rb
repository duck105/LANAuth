Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions', passwords: 'users/passwords'}
  resources :records
  root 'welcome#index'
end
