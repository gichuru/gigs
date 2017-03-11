class Gig < ActiveRecord::Base
	# belongs_to	:company
	has_many	:proposals
	#belongs_to	:user
	#belongs_to :category
	has_many	:abilities
	has_many	:skills, through: :abilities
end