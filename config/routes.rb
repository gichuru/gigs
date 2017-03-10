Rails.application.routes.draw do

  devise_for :users
	resources :gigs
	resources	:profiles
	resources	:edus
	resources	:companies
	root 'gigs#index'
end
