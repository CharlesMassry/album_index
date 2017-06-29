Rails.application.routes.draw do
  root 'homes#index'
  get 'search', to: 'searches#show', defaults: { format: :json }
end
