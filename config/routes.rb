Rails.application.routes.draw do
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

  resources :targets, only: [:show, :destroy]

  resources :findings do
    member do
      patch :update_severity
      post :attach_evidence
      patch :mark_verified
    end
    resources :evidence, only: [:create]
  end

  resources :evidence, only: [:show, :destroy]

  resources :reports do
    member do
      get :export_pdf
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
