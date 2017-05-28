Rails.application.routes.draw do

  devise_for :users
  	resources :dashboard

	resources :companies do
		resources	:gigs do
			resource :proposals, except: :index
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
 
 # if user_signed_in? && current_user.is_employer?
		root 'gigs#index'
	# else 
		root 'gig#resumes'
	# end
		get 'listing' => "companies#listing"

end
