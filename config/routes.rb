# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/show'
  get 'comments/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.odevise_for :users
  get 'home/index'
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :posts do
    resources :comments
  end
end
