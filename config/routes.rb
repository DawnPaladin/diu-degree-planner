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
        put 'update_schedule', to: 'plans#update_schedule'
      end
      resources :electives, only: [:create, :update, :destroy]
      resources :advisors
      resources :concentrations, only: [:index, :show, :update, :delete]
      resources :terms, only: [:index]
      resources :courses, only: [:index]
      resources :degrees, only: [:index, :show, :update, :delete]
    end
  end

  root 'angular_app#index'

  get 'angular_app/index'

end
