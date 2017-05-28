class Resume < ActiveRecord::Base
	#belongs_to :category
	has_many :proposals
	belongs_to	:user 
	has_many	:edus
	has_many	:jobs
	has_many	:skills
	has_many	:abilities
	has_many	:skills, through: :abilities
end