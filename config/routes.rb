Rails.application.routes.draw do

  devise_for :users
  	resources :dashboard

	resources :companies do
		resources	:gigs do
			resources :proposals, except: :index
		end
		# resources	:proposals
	end
	resources	:gigs
	# Manage links to interns, resumes
	resources :resumes do
		resources :edus
		resources :jobs
		resources :skills

	end

		root 'gigs#index'
		get 'listing' => "companies#listing"

end
