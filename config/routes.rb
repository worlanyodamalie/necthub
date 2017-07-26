Rails.application.routes.draw do


  #get 'users/index'

  #get 'groups/index'

  #devise_for :users

  #get 'static_pages/home'


  devise_for :organisations, path: 'organisations' , :controllers => { registrations: "registrations" }

  devise_for :users, path: 'users' , :controllers => { registration: "signups" }


    # as :users do
    #   get '/login' => 'sessions#new',  as: :new_user_session
    #   post '/login' => 'sessions#create', as: :user_session
    #   delete '/logout' => 'sessions#destroy', as: :destroy_user
    #   get '/register' => 'signups#new', as: :new_user_registration
    #   post '/register' => 'signups#create',  as: :user_registration

    #   end



  ## custom routes for users
# as :user do
#   #get 'login' => 'users/sessions#new', as: :new_user_session
#   #post 'login' => 'users/sessions#create', as: :user_session
#   #delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
#   get 'register' => 'users/signups#new'
# end

  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/user', to: 'static_pages#user'

  resources :membershipdata do
    collection do
      get :members
      post :import
    end
  end


  resources :events

  resources :users

  resources :groups do
     collection do
      get :events
      get :jobs
      get :profile
      get :fundraising
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
    resources :users


  end

  devise_scope :organisation do
     get '/dashboard', to: 'organisations#index'
  end

  devise_scope :user do
     get '/userfeed', to: 'groups#index'
  end

end
