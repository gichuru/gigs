Rails.application.routes.draw do

  devise_for :users

	resources :companies do
		resources	:gigs
		resources	:proposals
	end
	resources	:gigs

	resources :resumes do
		resources :edus
		resources	:jobs
	end

		root 'gigs#index'

end
