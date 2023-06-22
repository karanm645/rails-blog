Rails.application.routes.draw do

  resources :blog_posts

  #get "/blog_posts", to: "blog_posts#index", as :blog_posts

  root "blog_posts#index"
end