Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/new'
  # get 'articles/edit'
  # get 'articles/update'
  # get 'articles/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    resources :articles
    root to: 'articles#index'
  end
