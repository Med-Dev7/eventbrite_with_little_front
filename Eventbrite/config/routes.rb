Rails.application.routes.draw do
  get 'attendance/new'
  get 'attendance/create'
  # get 'attendances/new'
  # get 'attendances/create'
  # devise_for :users, module: "users"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :event

  # resources :event do
  #   get 'subscribe', on: :collection
  # end
   resources :event do
    resources :attendance, only: [:new, :create, :index]
  end
  # resources :attendances, only: [:new, :create]
  post '/event/subscribe/:id', to: 'event#subscribe', as: 'subscribe_event'
  resources :users,  only: [:show, :edit, :update]  

  root :to => "event#index"
  
  
  
  
  
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'user/show'
  # get 'user/edit'
  # get 'user/update'
  # get 'event/index'
  # get 'event/new'
  # get 'event/create'
  # get 'event/show'
  # get 'event/destroy'
  # get 'event/edit'
  # get 'event/update'
  # get 'static_pages/index'
  # get 'static_pages/secret'
end
