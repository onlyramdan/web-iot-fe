Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "dashbord#index"


  get "/login" => "login#index"
  get "/aksi_signout" => "login#logout"
  post "/aksi_login" => "login#login"
  resource :login

  get "/dashboard" => "dashbord#index"
  resource :dashbord

  get "/setting" => "setting#index"
  resource :setting

  get "/profile" => "profile#index"
  post "/profile/aksi_edit" => "profile#edit"
  resource :profile

  get "/report" => "report#index"
  resource :report

  get "/signup" => "signup#index"
  post "/aksi_signup" => "signup#signup"
  resource :signup
end
