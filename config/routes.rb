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
  get "/mqtt/sub" =>  "dashbord#get_data_mqtt"
  get "/control" => "dashbord#control"
  resource :dashbord

  get "/setting" => "setting#index"
  post "/aksi_simpan" => "setting#simpan"
  post "/user_simpan" => "setting#simpan_user"
  post "/aksi_hapusalat" => "setting#hapus_alat"
  post "/aksi_hapususer" => "setting#hapus_user"
  resource :setting

  get "/profile" => "profile#index"
  post "/profile/aksi_edit" => "profile#edit"
  resource :profile

  get "/report" => "report#index"
  get "/export" => "report#download_csv"
  resource :report

  get "/signup" => "signup#index"
  post "/aksi_signup" => "signup#signup"
  resource :signup
end
