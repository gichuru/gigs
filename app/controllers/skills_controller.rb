class SkillsController < ApplicationController
	before_action :set_resume

	def index
		@skill = Skill.all
	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)
		@skill.resume_id = @resume.id
		@skill.save!
		redirect_to @resume	
	end

	def show
		@skill = Skill.find(params[:id])
	end

private

	def set_resume
		@resume = Resume.find(params[:resume_id])	
	end

	def skill_params
		params.require(:skill).permit(:name)
	end

end


