Rails.application.routes.draw do

 # get '/invite', to: 'groups#invite', constraint: lambda {|request|Organisation.subdomains.include?(request.subdomains.first)}

  get 'annoucements/index'

  get 'annoucements/new'

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


  resources :events do
    collection do
      get :eventsearch
    end
  end

  resources :announcements

  resources :users, :path_names => { :show => 'user'} ,  only: [:show, :edit, :update] do
     collection do
        get :skillsearch
       end
  end
  #  get '/user', to: 'users#show'
  # get '/users/:id', to: 'users#show'

  resources :jobs do
    collection do
      get :jobsearch
    end
  end

  resources :groups do
     collection do
      get :events

      get :jobs

      get :skills

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


    #resources :groups


  end

  devise_scope :organisation do
     get '/dashboard', to: 'organisations#index'
  end

  devise_scope :user do
     get '/userfeed', to: 'groups#index'
  end

end
