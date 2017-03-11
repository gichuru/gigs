Rails.application.routes.draw do

  devise_for :users

	resources :companies do
		resources	:gigs
		resources	:proposals
end
	root 'companies#index'
end
