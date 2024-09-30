Rails.application.routes.draw do

  # Student Borrow Rroute
  get "/student/borrow_request/new/:id", to: "borrows#new"
  post "/student/borrow_request/new/:id", to: "borrows#create"
  # Book Route
  get "/admin/book/show/:id", to: "books#show"
  get "/student/book/show/:id", to: "books#show"
  get "/admin/book/edit/:id", to: "books#edit"
  post "/admin/book/edit/:id", to: "books#update"
  post "/admin/book/create", to:"books#create"
  get "/admin/books", to: "books#index"
  post "/admin/books", to: "books#index"
  get "/admin/book/new", to:"books#new"
  get "/student/books", to: "books#index"
  delete "/book/destroy", to: "books#destroy"
# ------------------------------------------------------------
  # For Create User Account
  post "/admin/students", to: "users#index"
  get "/admin/students", to: "users#index"
  get '/user/new' , to: "users#new"
  get 'users/:id', to:"users#show"
  post '/user/create' , to: "users#create"
  get "/admin/student/edit/:id", to: "users#edit"
  post "/admin/student/edit/:id", to: "users#update"
  delete "/user/destroy", to: "users#destroy"
#  --------------------------------------------------------------
  # For Login User Account
  get "/", to: "logins#login"
  get "/login", to: "logins#login"
  post "/login", to: "logins#login"
  get "/logout", to: "logins#logout"
  #  
end
