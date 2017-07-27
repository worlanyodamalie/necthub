Rails.application.routes.draw do



  # get 'jobs/new'

  # get 'jobs/index'

  devise_for :organisations, path: 'organisations' , :controllers => { registrations: "registrations" }

  devise_for :users, path: 'users' , :controllers => { registration: "signups" }



  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'


  resources :membershipdata do
    collection do
      get :members
      post :import
    end
  end


  resources :events

  # resources :users,

  resources :users, :path_names => { :show => 'user'} ,  only: [:show, :edit, :update]
  #  get '/user', to: 'users#show'
  # get '/users/:id', to: 'users#show'

  resources :jobs

  resources :groups do
     collection do
      get :events
      get :jobs
      get :profile
      get :skills
      get :fundraising
      get :skillsearch
      end
  end

  resources :fundraisings do
    collection do
     get :single_page
    end
  end

  resources :organisations do
    collection do
       get :email
       get :sms
       get :send_message
       post :send_sms
       get :send_email
    end
     resources :membershipdata

     resources :events

     resources :fundraisings


    resources :groups


  end

  devise_scope :organisation do
     get '/dashboard', to: 'organisations#index'
  end

  devise_scope :user do
     get '/userfeed', to: 'groups#index'
  end

end
