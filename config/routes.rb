Rails.application.routes.draw do

  devise_for :users
	resources :gigs
	resources	:profiles
	root 'gigs#index'
end
