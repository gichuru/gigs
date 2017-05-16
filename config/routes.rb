Rails.application.routes.draw do

  devise_for :users
  	resources :dashboard

	resources :companies do
		resources	:gigs
		resources	:proposals
	end
	resources	:gigs
	resources :resumes do
		resources :edus
		resources :jobs
		resources :skills

	end

		root 'gigs#index'
		get 'listing' => "companies#listing"

end
