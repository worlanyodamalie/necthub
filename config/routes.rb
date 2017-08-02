Rails.application.routes.draw do




  #get '/invite', to: 'groups#invite', constraint: lambda {|request|Organisation.subdomains.include?(request.subdomains.first)}


  devise_for :organisations, path: 'organisations' , :controllers => { registrations: "registrations" }

  devise_for :users, path: 'users' , :controllers => { registration: "signups" }


  #root 'static_pages#home', to: redirect("http://www.necthub.com/")
  root 'static_pages#home'
  #get '/home', to: 'static_pages#home'
  #get "/home" => redirect("http://www.necthub.com/")



  resources :users, :path_names => { :show => 'user'} ,  only: [:show, :edit, :update] do
     collection do
        get :skillsearch
        get :skills
        get :memberprofiles
        get :memberprofilesearch
       end
  end



  resources :organisations do
    collection do
       get :email
       get :sms
       get :send_message
       post :send_sms
       get :send_email
       get :share
    end
      member do
        post :join
        get :invite
      end
     resources :membershipdata

     resources :events

     #resources :fundraisings

    resources :groups

  end

  devise_scope :organisation do
     get '/dashboard', to: 'organisations#index'
  end

  devise_scope :user do
     get '/userfeed', to: 'groups#index'
  end


  # resources :networks

  resources :fundraisings do
    collection do
     get :single_page
    end
  end

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

  resources :announcements
  #resources :memberships

end
