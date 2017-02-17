Rails.application.routes.draw do

  devise_for :advisors, controllers: { sessions: 'advisors/sessions', registrations: 'advisors/registrations'}

  devise_scope :advisor do
    get 'advisors/sign_out', to: 'advisors/sessions#destroy'
  end

  resources :advisors, only: [:index, :update, :destroy]

  scope :api do
    scope :v1 do
      resources :students do
        resource :plan
        
        # TODO Refactor
        put 'enroll_in_meeting', to: 'plans#enroll_in_meeting'
        put 'disenroll_from_meeting', to: 'plans#disenroll_from_meeting'
      end
      resources :advisors
      resources :concentrations, only: [:index, :show]
      resources :terms, only: [:index]
      resources :courses, only: [:index]
    end
  end

  root 'angular_app#index'

  get 'angular_app/index'

end
