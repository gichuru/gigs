class Profile < ActiveRecord::Base
	has_many	:skills
	#belongs_to	:user
	#belongs_to :category
	has_many	:abilities
	has_many	:skills, through: :abilities
end