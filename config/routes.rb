Rails.application.routes.draw do
  get "analytics/dashboard"
  get "audit_logs/index"
  get "audit_logs/show"
  get "api/documentation"
  namespace :api do
    namespace :v1 do
      get "operations/index"
      get "operations/show"
      get "operations/create"
      get "operations/update"
      get "operations/destroy"
    end
  end
  get "roles/index"
  get "roles/show"
  get "roles/new"
  get "roles/create"
  get "roles/edit"
  get "roles/update"
  get "roles/destroy"
  get "search/index"
  get "notifications/index"
  get "notifications/show"
  get "notifications/update"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  # Guest access route
  post '/guest_access', to: 'users/sessions#guest_access', as: :guest_access
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Resource routes for main entities
  resources :operations do
    member do
      patch :close
      post :generate_report
    end
    resources :targets, only: [:create]
  end

  resources :targets do
      member do
        post :scan
      end
    end

  resources :findings do
    member do
      patch :update_severity
      post :attach_evidence
      patch :mark_verified
    end
    collection do
      get :index
      post :create
    end
    member do
      get :show
      patch :update
      delete :destroy
    end
    resources :evidence, only: [:create]
  end

  resources :evidence, only: [:show, :destroy]

  resources :reports do
    member do
      get :export_pdf
      get :export_csv
    end
    collection do
      get :index
      post :create
    end
    member do
      get :show
      patch :update
      delete :destroy
    end
  end

  # Notifications
  resources :notifications, only: [:index, :show, :update] do
    collection do
      patch :mark_all_read
    end
  end

  # Search
  get '/search', to: 'search#index'
  get '/search/suggestions', to: 'search#suggestions'

  # User Roles and Permissions (Admin only)
  resources :roles do
    member do
      post :assign_user
      delete :remove_user
    end
  end

  # API Routes
  namespace :api do
    namespace :v1 do
      resources :operations, only: [:index, :show, :create, :update, :destroy]
      resources :targets, only: [:index, :show, :create, :update, :destroy] do
        member do
          post :scan
        end
      end
      resources :findings, only: [:index, :show, :create, :update, :destroy] do
        member do
          patch :verify
        end
      end
      resources :reports, only: [:index, :show, :create] do
        member do
          get :export_pdf
        end
      end
      resources :notifications, only: [:index, :update] do
        collection do
          patch :mark_all_read
        end
      end
    end
  end

  # API Documentation
  get '/api/docs', to: 'api#documentation'

  # Audit Logs (Admin only)
  resources :audit_logs, only: [:index, :show]

  # Analytics Dashboard
  get '/analytics', to: 'analytics#dashboard'

  # Features page route
  get 'features', to: 'features#index'
  
  # Pricing page route
  get 'pricing', to: 'pricing#index'
  
  # Landing page route
  get 'landing', to: 'landing#index'
  
  # Defines the root path route ("/")
  root "landing#index"
end
