Rails.application.routes.draw do
  devise_for :models
  root to: 'blog/posts#index'

  namespace :author do
    resources :posts
  end

  root to: 'blog/posts#index'

  scope module: 'blog' do
    get 'author/posts' => 'posts#index', as: :posts
    get 'author/posts/:id' => 'posts#show', as: :post 
  end
end
 