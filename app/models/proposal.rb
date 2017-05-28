class Proposal < ActiveRecord::Base
	belongs_to 	:gig
	belongs_to	:user
	# belongs_to :resume
end