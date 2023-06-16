Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "url#index"

  resources :url, only: [:new, :create]
  get '/:token/info', to: 'url#visit', as: :visit_info
  get '/:token', to: 'url#show', as: :show_url
end
