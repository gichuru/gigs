Rails.application.routes.draw do

  devise_for :users

	resources :companies do
		resources	:gigs
		resources	:proposals
	end

	resources :resumes do
		resources :edus
		resources	:jobs
	end
	root 'resumes#index'
end
