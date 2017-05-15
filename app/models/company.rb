class Company < ActiveRecord::Base
	has_many	:categories
	has_many	:gigs
	belongs_to	:user
end