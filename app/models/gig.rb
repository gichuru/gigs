class Gig < ActiveRecord::Base
	belongs_to	:company
	has_many	:proposals
	belongs_to 	:category
	has_many	:abilities
	has_many	:skills, through: :abilities

	validates :name, :description, :budget, :startdate, :duration, presence: true

	def skill_list=(skills_string)
		skill_names = skills_string.split(",").collect{ |s| s.strip.downcase}.uniq
		new_or_found_skills = skill_names.collect { |name| Skill.find_or_create_by(name: name) }
		self.skills = new_or_found_skills
	end

	def skill_list
		self.skills.collect do |skill|
			skill.name
		end.join(",")
	end
end