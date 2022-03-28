Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  class SubdomainConstraint
    def self.matches?(request)
      request.subdomain == ENV['API_SUBDOMAIN']
    end
  end

  constraints(SubdomainConstraint) do
    namespace :v1, defaults: { format: :json } do
      namespace :users do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:invitations], controllers: {
          sessions:           'v1/users/auth/sessions'
        }
      end

      resources :accounts, only: :create
      resources :customers
      resources :zipcodes, only: :show
      resources :prefectures, only: :index
      resources :floors
      resources :reservations
    end
  end
end
